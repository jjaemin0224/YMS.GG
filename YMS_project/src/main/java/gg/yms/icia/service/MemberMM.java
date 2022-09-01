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

	//회원가입
	public ModelAndView mmJoin(Member mb) {
		mav = new ModelAndView();
		String view = null;
		
		if (mDao.mmJoin(mb)) {
			view = "home";
			mav.addObject("joinCheck", 1);
		}
		else {
			view = "member/join";
			mav.addObject("joinCheck", 2);
		}
		mav.setViewName(view);
		return mav;
	} // end mmJoin


	//로그인
	public ModelAndView mmLogin(Member mb, HttpSession session, RedirectAttributes attr) {
		mav = new ModelAndView();
		String view = null;
		
		if (mDao.mmLogin(mb)) {
			view = "home";
			session.setAttribute("id", mb.getM_id());
			mav.addObject("loginCheck", 1);
		}
		else {
			view = "member/login";
			mav.addObject("loginCheck", 2);
		}
		mav.setViewName(view);
		return mav;
	}


	//로그아웃
	public ModelAndView Logout(HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		
		session.invalidate();
		
		view = "home";
		mav.setViewName(view);
		return mav;
	}

	//아이디 찾기
	public ModelAndView mmSearchId(Member mb) {
		mav = new ModelAndView();
		String view = null;
		
		Member member = mDao.mmSearchMember(mb);
		
		if (member != null) {
			view = "member/showId";
			mav.addObject("searchedId", member.getM_id());
		}
		else {
			view = "member/searchId";
			mav.addObject("nosearchedId", "no id");
		}
		
		mav.setViewName(view);
		return mav;
	}

	
	//비밀번호 찾기
	public ModelAndView mmSearchPw(Member mb) {
		mav = new ModelAndView();
		String view = null;
		
		Member member = mDao.mmSearchMember(mb);
		
		if (member != null) {
			view = "member/resetPw";
			mav.addObject("searchedId", member.getM_id());
		}
		else {
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
		}
		else {
			view = "member/searchPw";
		}
		
		mav.setViewName(view);
		return mav;
	}
	
	

}
