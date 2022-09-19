package gg.yms.icia.service;

import java.beans.Encoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gg.yms.icia.bean.Board;
import gg.yms.icia.bean.Feedback;
import gg.yms.icia.bean.Member;
import gg.yms.icia.bean.Tsb_Board;
import gg.yms.icia.bean.Withdrawal;
import gg.yms.icia.dao.IMemberDao;
import gg.yms.icia.dao.TsbDao;
import gg.yms.icia.userClass.Paging;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberMM {

	@Autowired
	private IMemberDao mDao;

	ModelAndView mav;

	@Bean
	BCryptPasswordEncoder passwordEncoder() {

		return new BCryptPasswordEncoder();
	}

	// 세션id를 통해 정보 가져오기
	public Member getMemberInfo(HttpSession session) {

		String m_id = session.getAttribute("id").toString();
		Member member = mDao.getMemberInfo(m_id);
		return member;
	}

	// 세션id return
	public String getSessionId(HttpSession session) {
		return session.getAttribute("id").toString();
	}

//   (비로그인서비스)---------------------------------------------------------------------------------------------------------

// 회원가입
	public ModelAndView mmJoin(Member mb) {
		mav = new ModelAndView();
		BCryptPasswordEncoder bc = new BCryptPasswordEncoder();
		String view = null;
		mb.setM_pw(bc.encode(mb.getM_pw()));

		if (mDao.mmJoin(mb)) {
			view = "home";
			mav.addObject("joinCheck", 1);
		} else {
			view = "member/join";
			mav.addObject("joinCheck", 2);
		}
		mav.setViewName(view);
		return mav;
	} // end mmJoin

// 로그인
	public ModelAndView mmLogin(Member mb, HttpSession session, RedirectAttributes attr) {
		mav = new ModelAndView();
		BCryptPasswordEncoder bc = new BCryptPasswordEncoder();
		String view = null;

		String bcEnco = mDao.mmEncoderPw(mb.getM_id());
		if (bcEnco != null) {
			if (bc.matches(mb.getM_pw(), bcEnco)) {
				session.setAttribute("id", mb.getM_id());
				mb = mDao.getMemberInfo(mb.getM_id());
				mav.addObject("loginCheck", 1);
				view = "home";
			} else {
				view = "member/login";
				mav.addObject("loginCheck", 2);
			}
		} else {
			view = "member/login";
			mav.addObject("loginCheck", 2);

		}
		mav.setViewName(view);
		return mav;
	}

	// 아이디 찾기
	public ModelAndView mmSearchId(Member mb) {
		mav = new ModelAndView();
		String view = null;

		Member member = mDao.mmSearchMember(mb);

		if (member != null) {
			view = "member/showId";
			mav.addObject("searchedId", member.getM_id());
		} else {
			view = "member/searchId";
			mav.addObject("nosearchedId", "no id");
		}

		mav.setViewName(view);
		return mav;
	}

	// 비밀번호 찾기
	public ModelAndView mmSearchPw(Member mb) {
		mav = new ModelAndView();
		String view = null;

		Member member = mDao.mmSearchMember(mb);

		if (member != null) {
			view = "member/resetPw";
			mav.addObject("searchedId", member.getM_id());
		} else {
			view = "member/searchPw";
			mav.addObject("nosearchedId", "no id");
		}

		mav.setViewName(view);
		return mav;
	}

	public ModelAndView mmResetPw(Member mb) {
		mav = new ModelAndView();
		String view = null;
		BCryptPasswordEncoder bc = new BCryptPasswordEncoder();
		mb.setM_pw(bc.encode(mb.getM_pw()));

		if (mDao.mmResetPw(mb)) {
			view = "member/login";
		} else {
			view = "member/searchPw";
		}

		mav.setViewName(view);
		return mav;
	}

	// 휴대폰 인증
	public void mmCertifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCS4TFIUH8KX0ZMV";
		String api_secret = "NOLQQZAPE0GE3GTCYBGWPF6ITU4ERB0U";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber);
		System.out.println(userPhoneNumber);
		params.put("from", "01030982596");
		params.put("type", "SMS");
		params.put("text", "[yms.gg] 인증번호는" + "[" + randomNumber + "]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}

//   (공통회원)-----------------------------------------------------------------------------------------------------------------

	// 로그아웃
	public ModelAndView cmLogout(HttpSession session) {
		mav = new ModelAndView();

		session.invalidate();

		mav.setViewName("home");
		return mav;
	}

	// 마이페이지로 이동
	public ModelAndView cmMyPageMv(HttpSession session) {
		mav = new ModelAndView();
		String view = null;

		// 세션id를 통해 회원정보 검색
		Member member = getMemberInfo(session);

		if (member.getM_rating().equals("GM")) {
			view = "member/gm/myPage";
		} else if (member.getM_rating().equals("AM")) {
			view = "member/am/myPage";
		} else {
			view = "member/fm/myPage";
		}

		mav.addObject("member", member);
		mav.setViewName(view);

		return mav;
	}

	public ModelAndView cmMyInfoLogin(Member mb, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		BCryptPasswordEncoder bc = new BCryptPasswordEncoder(); // 입력하는 비번 암호화 해줄 얘
		String bcEnco = mDao.mmEncoderPw(getSessionId(session)); // 로그인 된 아이디 의 비밀번호
		String m_id = getSessionId(session);
		mb.setM_id(m_id);

		if (bc.matches(mb.getM_pw(), bcEnco)) {
			System.out.println("비교?");

			view = "member/cm/myInfoUpdate";
			mav.addObject("member", getMemberInfo(session));
		} else {
			view = "member/cm/myInfoLogin";
			mav.addObject("msg", "로그인 실패");
			System.out.println("failMav: " + mav);
		}

		mav.setViewName(view);
		System.out.println("infoLogin: " + mav);
		return mav;
	}

	public ModelAndView cmMyInfoUpdate(Member mb, HttpSession session) {
		mav = new ModelAndView();
		mb.setM_id(getSessionId(session));

		if (mDao.cmMyInfoUpdate(mb)) {
			mav = cmMyPageMv(session);
		} else {
			mav.addObject("msg", "회원정보수정 실패");
			mav.setViewName("member/cm/myInfoUpdate");
		}
		return mav;
	}

	public ModelAndView cmMyInfoPwUpdate(Member mb, HttpSession session) {
		mav = new ModelAndView();
		BCryptPasswordEncoder bc = new BCryptPasswordEncoder();
		mb.setM_id(getSessionId(session));
		mb.setM_pw(bc.encode(mb.getM_pw()));

		if (mDao.cmMyInfoPwUpdate(mb)) {
			mav = cmMyPageMv(session);
		} else {
			mav.addObject("msg", "비밀번호변경 실패");
			mav.setViewName("member/cm/myInfoPwUpdate");
		}
		return mav;

	}

	public ModelAndView cmMyInfoDelete(Member mb, Withdrawal wd, HttpSession session) {
		mav = new ModelAndView();
		BCryptPasswordEncoder bc = new BCryptPasswordEncoder(); // 입력하는 비번 암호화 해줄 얘
		String bcEnco = mDao.mmEncoderPw(getSessionId(session)); // 로그인 된 아이디 의 비밀번호
		String m_id = getSessionId(session);
		mb.setM_id(m_id);
		wd.setWd_id(m_id);
		bc.encode(mb.getM_pw());

		if (bc.matches(mb.getM_pw(), bcEnco)) {
			if (mDao.cmInsertWithdrawal(wd)) {
				if (mDao.cmMyInfoDelete(mb)) {
					session.invalidate();
					mav.setViewName("member/cm/withdrawalSuccess");
				}
			}
		} else {
			mav.setViewName("member/cm/myInfoDelete");
			mav.addObject("msg", "비밀번호불일치");
		}

		return mav;
	}

	// 아이디 중복체크
	public int mmIdCheck(Member mb) {
		int result = mDao.mmIdCheck(mb);
		System.out.println("resultMM: " + result);
		return result;
	}

	// 카카오페이
	public ModelAndView cmKakaoPay(Member mb, HttpSession session) {
		mav = new ModelAndView();

		mb.setM_id(getSessionId(session));

		String view = null;

		Member member = getMemberInfo(session);
		int org_cash = member.getM_cash();
		int charge_cash = mb.getM_cash();
		int m_cash = org_cash + charge_cash;

		mb.setM_cash(m_cash);
		System.out.println(org_cash);
		System.out.println(charge_cash);

		if (mDao.cmCashCharge(mb)) {
			view = "home";
		} else {
			view = "member/cm/cashCharge";
			mav.addObject("msg", "캐시충전실패");
		}
		mav.setViewName(view);

		return mav;

	}

	public ModelAndView cmCashChargeMv(HttpSession session) {
		mav = new ModelAndView();
		Member member = getMemberInfo(session);
		mav.addObject("member", member);
		mav.setViewName("member/cm/cashCharge");
		return mav;
	}

// --- 관리자 계정
	public ModelAndView amGetMemberinfo() {
		mav = new ModelAndView();
		List<Member> MemberList = mDao.amGetMemberinfo();
		mav.addObject("memberInfo", MemberList);
		mav.setViewName("member/am/MemberInfo");
		return mav;
	}

	public List<Member> amMemberDelete(String m_id) {
		System.out.println("넘겨받은 삭제할 멤버 아이디" + m_id);
		List<Member> MemberDeleteList = null; // 삭제 후 멤버 정보
		if (m_id != null) {
			if (mDao.amMemberDelete(m_id)) {
				MemberDeleteList = mDao.amGetMemberinfo();
			}

		} else {
			System.out.println("넘겨받은 member정보 없음");
		}
		return MemberDeleteList;

	}

	public ModelAndView getTsbList(Integer pageNum) {
		if (pageNum == null)
			pageNum = 1;
		mav = new ModelAndView();
		List<Tsb_Board> tsbList = mDao.getTsbList(pageNum);
		if (tsbList != null && tsbList.size() != 0) {
			mav.addObject("tsbList", tsbList);
			mav.addObject("tsbPaging", getPaging(pageNum, "amGetTsbList"));
			String view = "member/am/tsbList";
			mav.setViewName(view);
		}
		return mav;
	}

	private String getPaging(Integer pageNum, String url) {
		int listCount = 10; // 페이지당 글의 개수
		int pageCount = 5; // 그룹당 페이지 개수
		int maxNum = 0;
		String boardName = url; // url
		if (boardName == "tsbList") {
			maxNum = mDao.getTsbBoardCount();
		} else {
			maxNum = mDao.getBoardCount();
		}

		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		return paging.makeHtmlPaging();
	}

	public List<Tsb_Board> amTsbDelete(Integer postNum, Integer pageNum) {
		System.out.println("넘겨받은 삭제할 게시글 번호" + postNum);
		List<Tsb_Board> amTsbList = null; // 삭제 후 게시글 정보
		if (postNum != 0 || postNum != null) {
			if (mDao.amTsbDelete(postNum)) {
				if (pageNum == null)
					pageNum = 1;
				amTsbList = mDao.getTsbList(pageNum);
			}

		} else {
			System.out.println("넘겨받은 tsb정보 없음");
		}
		return amTsbList;

	}

	public ModelAndView getBbList(Integer pageNum) {
		if (pageNum == null)
			pageNum = 1;
		mav = new ModelAndView();
		List<Board> bbList = mDao.getBbList(pageNum);
		if (bbList != null && bbList.size() != 0) {
			mav.addObject("bbList", bbList);
			mav.addObject("bbPaging", getPaging(pageNum, "bbList"));
			String view = "member/am/bbList";
			System.out.println("bb list" + bbList);
			mav.setViewName(view);
		}
		return mav;
	}

	public List<Board> amBbDelete(Integer postNum, Integer pageNum) {
		System.out.println("넘겨받은 삭제할 게시글 번호" + postNum);
		List<Board> amBbList = null; // 삭제 후 게시글 정보
		if (postNum != 0 || postNum != null) {
			if (mDao.amBbDelete(postNum)) {
				if (pageNum == null)
					pageNum = 1;
				amBbList = mDao.getBbList(pageNum);
			}

		} else {
			System.out.println("넘겨받은 bb정보 없음");
		}
		return amBbList;
	}
}