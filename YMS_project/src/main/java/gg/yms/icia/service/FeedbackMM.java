package gg.yms.icia.service;

import java.util.List;

import javax.annotation.Nonnull;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.Board;
import gg.yms.icia.bean.Feedback;
import gg.yms.icia.bean.FeedbackApplication;
import gg.yms.icia.bean.Member;
import gg.yms.icia.dao.IFeedbackDao;
import gg.yms.icia.dao.IMemberDao;
import lombok.NonNull;

@Service
public class FeedbackMM {
	
	@Autowired
	private IFeedbackDao fDao;

	
	ModelAndView mav;

	// 세션id return
	public String getSessionId(HttpSession session) {
		return session.getAttribute("id").toString();
	}



//	(일반회원)------------------------------------------------------------------------------------------------------------------

	public ModelAndView gmFeedbackList(HttpSession session) {
		mav = new ModelAndView();
		String m_id = getSessionId(session);
		
		List<Feedback> gmFeedbackList = fDao.gmFeedbackList(m_id);
		
		if (gmFeedbackList != null) {
			mav.addObject("gmFeedbackList", gmFeedbackList);
		}
		else {
			mav.addObject("msg", "피드백이 없습니다.");
		}
		mav.setViewName("member/gm/feedbackList");
		
		return mav;
	}

	//피드백 계정 전환 신청
	public ModelAndView gmFeedbackAccount(FeedbackApplication fab, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		fab.setFba_id(getSessionId(session));
		
		if(fDao.gmFeedbackAccount(fab)) {
			view = "member/gm/myPage";
			System.out.println("feedbackAccTrue:" + view);
		}else {
			view = "member/gm/feedbackAccountReq";
			System.out.println("feedbackAccFalse: "+view);
		}
		mav.setViewName(view);
		return mav;
	}
	

// (관리자)----------------------------------------------------------------
	
	//신청 리스트 확인
	public ModelAndView gmFeedbackConfirmList(@ModelAttribute FeedbackApplication fab, Integer pageNum) {
		mav = new ModelAndView();

		if (pageNum == null)
			pageNum = 1;

		List<Board> fabList = fDao.gmFeedbackConfirmList(pageNum);
		if (fabList != null && fabList.size() != 0) {
			System.out.println("fabList: "+ fabList);

			//mav.addObject("paging", getPaging(pageNum));
			mav.addObject("fabList", fabList);
			mav.setViewName("member/am/feedbackAccountList");
		}
		return mav;
	}
	
	//신청 리스트 상세보기
	public ModelAndView gmFeedbackConfirmView(@NonNull Integer fba_postnum) {
		mav = new ModelAndView();
		FeedbackApplication fa = fDao.gmFeedbackConfirmView(fba_postnum);
		if(fa != null) {
			mav.addObject("fa", fa);
			mav.setViewName("member/am/feedbackConfirmView");
			System.out.println("mab: " + mav);
		}else {
			mav.setViewName("member/am/feedbackAccountList");
		}
		return mav;
	}

	public ModelAndView gmFeedbackTransUpdate(int fba_postnum) {
		mav = new ModelAndView();
		String view = null;
		if(fDao.gmFeedbackTransUpdate(fba_postnum) && fDao.gmFeedbackTransUpdate2(fba_postnum)) {
			view = "member/gm/gmFeedbackConfirm";
			mav.addObject("fmFeedbackUpdate",1);
		}else {
			view = "member/am/feedbackConfirmView";
			mav.addObject("fmFeedbackUpdate",2);
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView gmFeedbackTransDelete(int fba_postnum) {
		mav = new ModelAndView();
		String view = null;
		if(fDao.gmFeedbackTransDelete(fba_postnum)) {
			view = "member/gm/gmFeedbackConfirm";
			mav.addObject("fmFeedbackUpdate",1);
			System.out.println("sView: " + view);
		}else {
			view = "member/am/feedbackConfirmView";
			mav.addObject("fmFeedbackUpdate",2);
			System.out.println("eView: " + view);
		}
		mav.setViewName(view);
		return mav;
	}
	

}
