package gg.yms.icia.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gg.yms.icia.bean.Member;
import gg.yms.icia.service.MemberMM;

@Controller
public class MemberController {

	@Autowired
	private MemberMM mm;

	ModelAndView mav;

	// 회원가입 페이지로 이동
	@RequestMapping(value = "/mmJoinMv", method = RequestMethod.GET)
	public String mmJoinMv() {
		return "member/join";
	}

	// 회원가입
	@PostMapping(value = "/mmJoin")
	public ModelAndView mmJoin(@ModelAttribute Member mb) {
		mav = mm.mmJoin(mb);
		return mav;
	}

	// 로그인 페이지로 이동
	@RequestMapping(value = "/mmLoginMv", method = RequestMethod.GET)
	public String mmLoginMv() {
		return "member/login";
	}

	// 로그인
	@PostMapping(value = "/mmLogin")
	public ModelAndView mmLogin(@ModelAttribute Member mb, HttpSession session, RedirectAttributes attr) {
		mav = mm.mmLogin(mb, session, attr);
		return mav;
	}

	// 로그아웃
	@RequestMapping(value = "/mmLogout", method = RequestMethod.GET)
	public ModelAndView mmLogout(HttpSession session) {
		mav = mm.Logout(session);
		return mav;
	}

	// 아이디 찾기 페이지로 이동
	@RequestMapping(value = "/mmSearchIdMv", method = RequestMethod.GET)
	public String mmSearchIdMv() {
		return "member/searchId";
	}

	// 아이디 찾기
	@PostMapping(value = "/mmSearchId")
	public ModelAndView mmSearchId(@ModelAttribute Member mb) {
		mav = mm.mmSearchId(mb);
		return mav;
	}

	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "/mmSearchPwMv", method = RequestMethod.GET)
	public String mmSearchPwMv() {
		return "member/searchPw";
	}

	// 비밀번호 찾기
	@PostMapping(value = "/mmSearchPw")
	public ModelAndView mmSearchPw(@ModelAttribute Member mb) {
		mav = mm.mmSearchPw(mb);
		return mav;
	}

	// 비밀번호 변경
	@PostMapping(value = "/mmResetPw")
	public ModelAndView mmResetPw(@ModelAttribute Member mb) {
		mav = mm.mmResetPw(mb);
		return mav;
	}

	// 비밀번호 변경2
	@PostMapping(value = "/mmResetPw2")
	public ModelAndView mmResetPw2(@ModelAttribute Member mb) {
		mav = mm.mmResetPw(mb);
		return mav;
	}
	
	// 비밀번호 변경2
	@PostMapping(value = "/mmResetPw2222222")
	public ModelAndView mmResetPw22222222(@ModelAttribute Member mb) {
		mav = mm.mmResetPw(mb);
		return mav;
	}
}
