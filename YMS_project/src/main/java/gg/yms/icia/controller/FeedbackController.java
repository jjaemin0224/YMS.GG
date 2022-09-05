package gg.yms.icia.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.service.FeedbackMM;

@Controller
public class FeedbackController {
	
	@Autowired
	private FeedbackMM fm;
	
	ModelAndView mav;
	
//	(일반회원)-----------------------------------------------------------------------------------------------------------------

	// 내 피드백 페이지 이동
	@RequestMapping(value = "/gmFeedbackMv", method = RequestMethod.GET)
	public String gmFeedbackMv() {
		return "member/gm/feedback";
	}

	// 내 피드백 리스트 (ajax)
	@PostMapping(value = "/gmFeedbackList")
	public ModelAndView gmFeedbackList(HttpSession session) {
		mav = fm.gmFeedbackList(session);
		return mav;
	}
	
	
}
