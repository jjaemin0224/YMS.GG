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

	// 내 피드백 리스트 일반회원
	@RequestMapping(value = "/gmFeedbackList", method = RequestMethod.GET)
	public ModelAndView gmFeedbackList(HttpSession session, Integer pageNum, Feedback fbBoard) {
		mav = fm.gmFeedbackList(session, pageNum, fbBoard);
		System.out.println("컨트롤러 넘어올 때 feb" + fbBoard);
		return mav;
	}

	// 피드백 리스트에서 글쓰기 이동
	@RequestMapping(value = "/gmFbReqWriteFrm", method = RequestMethod.GET)
	public String gmFbReqWriteMv() {
		return "member/gm/fbWrite";
	}

	@PostMapping(value = "/gmFbReqWrite")
	public ModelAndView gmFbReqWrite(@ModelAttribute Feedback fbBoard, HttpSession session) {
		mav = fm.gmFbReqWrite(fbBoard, session);
		System.out.println("controller gmFbReqWrite" + fbBoard);
		return mav;
	}

	// 피드백 계정 전환 신청 이동
	@RequestMapping(value = "/gmFeedbackAccountReqMv", method = RequestMethod.GET)
	public String gmFeedbackAccountReqMv() {
		return "member/gm/feedbackAccountReq";
	}

	// 피드백 계정 전환 신청
	@PostMapping(value = "/gmFeedbackAccountReq")
	public ModelAndView gmFeedbackAccount(@ModelAttribute FeedbackApplication fab, HttpSession session) {
		mav = fm.gmFeedbackAccount(fab, session);
		return mav;
	}

// (피드백 계정) -----------------------------------------------------------------------------------------------------------
	// 요청 피드백 목록 확인
	@RequestMapping(value = "/fmWaitingFbList", method = RequestMethod.GET)
	public ModelAndView fmWaitingFbList(Integer pageNum) {
		mav = fm.fmFeedbackList(pageNum);
		System.out.println("controller fmfbList" + mav);
		return mav;

	}

	@GetMapping(value = "/fmWatingFbView")
	public ModelAndView fmWatingFbView(@NonNull Integer fb_postNum, HttpSession session) {
		mav = fm.fmWatingFbView(fb_postNum, session);
		System.out.println("컨트롤러 view" + mav);
		return mav;
	}

	@PostMapping(value = "/FbAccept")
	public ModelAndView FbAccept(Feedback FbAcceptPost, HttpSession session) {
		mav = fm.FbAccept(FbAcceptPost, session);

		return mav;

	}

// 수락 관련
	@RequestMapping(value = "/fmAcceptFbList", method = RequestMethod.GET)
	public ModelAndView fmAcceptFbList(Integer pageNum, HttpSession session) { // 피드백 수락자명이 본인인 게시글 가져옴 , and check 1 인
																				// 경우
		mav = fm.fmAcceptFbList(pageNum, session);
		System.out.println("controller fmAccepList" + mav);
		return mav;

	}

	@RequestMapping(value = "/feedbackWriteView", method = RequestMethod.GET)
	public ModelAndView feedbackWriteView(@NonNull Integer fb_postNum, HttpSession session) {
		mav = fm.feedbackWritebView(fb_postNum, session);
		System.out.println("컨트롤러 fbWriteview" + mav);
		return mav;
	}

	@PostMapping(value = "/feedbackWrite")
	public ModelAndView feedbackWrite(@ModelAttribute Feedback FbWritePost) {
		System.out.println("컨트롤러 답변 작성할 fb 정보" + FbWritePost);
		mav = fm.feedbackWrite(FbWritePost);
		return mav;
	}

//	(관리자)----------------------------------------------------------

	// 피드백 계정 전환 신청 확인 페이지 이동
	@GetMapping(value = "/gmFeedbackConfirmMv")
	public String gmFeedbackConfirmMv() {
		return "member/gm/gmFeedbackConfirm";
	}

	// 피드백 계정 전환 신청 확인 리스트(ajax)
	@PostMapping(value = "/gmFeedbackConfirmList")
	public ModelAndView gmFeedbackConfirmList(@ModelAttribute FeedbackApplication fab, @Nullable Integer pageNum) {
		mav = fm.gmFeedbackConfirmList(fab, pageNum);
		System.out.println("mavv: " + mav);
		return mav;
	}

	// 피드백 계정 전환 신청 상세보기
	@GetMapping(value = "/gmFeedbackConfirmView")
	public ModelAndView gmFeedbackConfirmView(@NonNull Integer fba_postnum) {
		mav = fm.gmFeedbackConfirmView(fba_postnum);
		return mav;
	}

	// 피드백 계정 전환 수락
	@PostMapping(value = "/gmFeedbackTransUpdate")
	public ModelAndView gmFeedbackTransUpdate(int fba_postnum) {
		mav = fm.gmFeedbackTransUpdate(fba_postnum);
		System.out.println("fba_postnum: " + fba_postnum);
		return mav;
	}

	// 피드백 계정 전환 거절
	@PostMapping(value = "/gmFeedbackTransDelete")
	public ModelAndView gmFeedbackTransDelete(int fba_postnum) {
		mav = fm.gmFeedbackTransDelete(fba_postnum);
		return mav;
	}

}
