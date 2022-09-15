package gg.yms.icia.controller;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.Feedback;
import gg.yms.icia.bean.FeedbackApplication;
import gg.yms.icia.bean.Member;
import gg.yms.icia.service.FeedbackMM;
import lombok.NonNull;
import oracle.jdbc.proxy.annotation.Post;

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
	
   //피드백 계정 전환 신청 이동
   @RequestMapping(value = "/gmFeedbackAccountReqMv", method = RequestMethod.GET)
   public String gmFeedbackAccountReqMv() {
	   return "member/gm/feedbackAccountReq";
   }
   
   //피드백 계정 전환 신청
   @PostMapping(value = "/gmFeedbackAccountReq")
   public ModelAndView gmFeedbackAccount(@ModelAttribute FeedbackApplication fab, HttpSession session ) {
	   mav = fm.gmFeedbackAccount(fab, session);
	   return mav;
   }
   
//	(관리자)----------------------------------------------------------
  
   //피드백 계정 전환 신청 확인 페이지 이동
   @GetMapping(value = "/gmFeedbackConfirmMv")
   public String gmFeedbackConfirmMv() {
	   return "member/gm/gmFeedbackConfirm";
   }
   
   //피드백 계정 전환 신청 확인 리스트(ajax)
   @PostMapping(value = "/gmFeedbackConfirmList")
   public ModelAndView gmFeedbackConfirmList(@ModelAttribute FeedbackApplication fab, @Nullable Integer pageNum) {
	   mav = fm.gmFeedbackConfirmList(fab, pageNum);
	   System.out.println("mavv: "+ mav);
	   return mav;
   }
   
   //피드백 계정 전환 신청 상세보기
   @GetMapping(value = "/gmFeedbackConfirmView")
   public ModelAndView gmFeedbackConfirmView(@NonNull Integer fba_postnum) {
	   mav = fm.gmFeedbackConfirmView(fba_postnum);
	   return mav;
   }
   
   //피드백 계정 전환 수락
   @PostMapping(value = "/gmFeedbackTransUpdate")
   public ModelAndView gmFeedbackTransUpdate(int fba_postnum) {
	   mav = fm.gmFeedbackTransUpdate(fba_postnum);
	   System.out.println("fba_postnum: " + fba_postnum);
	   return mav;
   }
   
   //피드백 계정 전환 거절
   @PostMapping(value = "/gmFeedbackTransDelete")
   public ModelAndView gmFeedbackTransDelete(int fba_postnum) {
	   mav = fm.gmFeedbackTransDelete(fba_postnum);
	   return mav;
   }
   

}
