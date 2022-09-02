package gg.yms.icia.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gg.yms.icia.bean.Member;
import gg.yms.icia.dao.IMemberDao;

@Service
public class MemberMM {

	@Autowired
	private IMemberDao mDao;

	ModelAndView mav;

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

//	(비로그인서비스)---------------------------------------------------------------------------------------------------------

	// 회원가입
	public ModelAndView mmJoin(Member mb) {
		mav = new ModelAndView();
		String view = null;

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
		String view = null;

		if (mDao.mmLogin(mb)) {
			view = "home";
			session.setAttribute("id", mb.getM_id());
			mav.addObject("loginCheck", 1);
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

		if (mDao.mmResetPw(mb)) {
			view = "member/login";
		} else {
			view = "member/searchPw";
		}

		mav.setViewName(view);
		return mav;
	}

//	(공통회원)-----------------------------------------------------------------------------------------------------------------

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

		mb.setM_id(getSessionId(session));

		if (mDao.mmLogin(mb)) {
			view = "member/cm/myInfoUpdate";
			mav.addObject("member", getMemberInfo(session));
		} else {
			view = "member/cm/myInfoLogin";
			mav.addObject("msg", "로그인 실패");
		}
		mav.setViewName(view);

		return mav;
	}

	
	public ModelAndView cmMyInfoUpdate(Member mb, HttpSession session) {
		mav = new ModelAndView();
		mb.setM_id(getSessionId(session));
		
		if (mDao.cmMyInfoUpdate(mb)) {
			mav = cmMyPageMv(session);
		}
		else {
			mav.addObject("msg", "회원정보수정 실패");
			mav.setViewName("member/cm/myInfoUpdate");
		}
		return mav;
	}

}
