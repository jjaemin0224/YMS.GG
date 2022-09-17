package gg.yms.icia.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.Board;
import gg.yms.icia.bean.Feedback;
import gg.yms.icia.bean.FeedbackApplication;
import gg.yms.icia.bean.Member;
import gg.yms.icia.bean.Tsb_Board;
import gg.yms.icia.dao.IFeedbackDao;
import gg.yms.icia.dao.IMemberDao;
import gg.yms.icia.userClass.Paging;
import lombok.NonNull;

@Service
public class FeedbackMM {

	@Autowired
	private IFeedbackDao fDao;

	@Autowired
	private IMemberDao mDao;

	ModelAndView mav;

	// 세션id return
	public String getSessionId(HttpSession session) {
		return session.getAttribute("id").toString();

	}

//	(일반회원)------------------------------------------------------------------------------------------------------------------

	public ModelAndView gmFeedbackList(HttpSession session, Integer pageNum, Feedback fbBoard) {
		if (pageNum == null)
			pageNum = 1;
//		System.out.println(m_id);
		String m_id = getSessionId(session).toString();

		if (fbBoard.getFb_check() != 0) {
			mav = new ModelAndView();
			List<Feedback> gmFeedbackList = fDao.gmFeedbackList(m_id, pageNum, fbBoard.getFb_check());
			if (gmFeedbackList != null) {
				mav.addObject("gmFeedbackList", gmFeedbackList);
				mav.addObject("FbPaging", getPaging(pageNum, fbBoard.getFb_check()));
				mav.setViewName("member/gm/feedbackListAj");
			} else {
				mav.addObject("msg", "피드백이 없습니다.");
				mav.addObject("FbPaging", getPaging(pageNum, fbBoard.getFb_check()));
				mav.setViewName("member/gm/feedbackListAj");

			}
		} else if (fbBoard.getFb_check() == 0 || fbBoard.getFb_check() == 5) {
			List<Feedback> gmFeedbackListfirst = fDao.gmFeedbackListfirst(m_id, pageNum);
			mav = new ModelAndView();
			mav.addObject("gmFeedbackList", gmFeedbackListfirst);
			mav.addObject("FbPaging", getFirstPaging(pageNum));
			mav.setViewName("member/gm/feedbackList");
		}
//		System.out.println("list" + gmFeedbackList);
		return mav;
	}

	private String getPaging(Integer pageNum, int check) {
		int maxNum = fDao.getBoardCount(check);
		int listCount = 10; // 페이지당 글의 개수
		int pageCount = 5; // 그룹당 페이지 개수
		String boardName = "gmFeedbackList"; // url
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		return paging.makeHtmlPaging();
	}

	private String getFirstPaging(Integer pageNum) {
		int maxNum = fDao.getFirstPaging();
		int listCount = 10; // 페이지당 글의 개수
		int pageCount = 5; // 그룹당 페이지 개수
		String boardName = "gmFeedbackList"; // url
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		return paging.makeHtmlPaging();
	}

	public ModelAndView gmFbReqWrite(Feedback fbBoard, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		String req_id = getSessionId(session);
		fbBoard.setFb_req_id(req_id);
		Member memberInfo = mDao.getMemberInfo(req_id);
		if (memberInfo.getM_cash() >= 2000) {
			if (fDao.gmFbReqWrite(fbBoard)) { // 수정 if 문으로 한번 더 감싸야함 (결제 성공 여부)
				mav = gmFeedbackList(session, 1, fbBoard);
				mav.addObject("gmFbWriteCheck", 1);
				mDao.cashDeduction(req_id);
			} else {
				mav = gmFeedbackList(session, 0, fbBoard);
				mav.addObject("gmFbWriteCheck", 2);
			}
		}
		view = "member/gm/feedbackList";
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView gmFbContents(int postnum) {
		String view = "member/gm/FbContents";
		mav = new ModelAndView();
		Tsb_Board FbContents = fDao.getFbreq(postnum);
		System.out.println("게시글 확인 " + FbContents);
		mav.addObject("FbContents", FbContents);
		mav.setViewName(view);
		return mav;
	}

	// 피드백 계정 전환 신청
	public ModelAndView gmFeedbackAccount(FeedbackApplication fab, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		fab.setFba_id(getSessionId(session));

		if (fDao.gmFeedbackAccount(fab)) {
			view = "member/gm/myPage";
		} else {
			view = "member/gm/feedbackAccountReq";
		}
		mav.setViewName(view);
		return mav;
	}

	// 피드백 계정
	// -------------------------------------------------------------------------
	public ModelAndView fmFeedbackList(Integer pageNum) {
		if (pageNum == null)
			pageNum = 1;

		List<Feedback> fmFeedbackList = fDao.fmFeedbackList(pageNum);
		if (fmFeedbackList != null) {
			mav = new ModelAndView();
			mav.addObject("fmFeedbackList", fmFeedbackList);
			mav.addObject("getPaging_req", getPaging_req(pageNum));
			mav.setViewName("member/fm/WatingFbList");
		} else {
			mav.addObject("msg", "요청 피드백이 없습니다.");
			mav.addObject("getPaging_req", getPaging_req(pageNum));
			mav.setViewName("member/fm/WatingFbList");

		}
		return mav;
	}

	private String getPaging_req(Integer pageNum) {
		int maxNum = fDao.getWatingFbCount();
		int listCount = 10; // 페이지당 글의 개수
		int pageCount = 5; // 그룹당 페이지 개수
		String boardName = "fmWaitingFbList"; // url
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		System.out.println("maxNum" + maxNum);
		return paging.makeHtmlPaging();
	}

	public ModelAndView fmWatingFbView(@NonNull Integer fb_postNum, HttpSession session) {
		Feedback watingFb = fDao.fmWatingFbView(fb_postNum);
		if (watingFb != null) {
			mav.addObject("watingFb", watingFb);
			mav.setViewName("member/fm/WatingFbView");
		} else {
			mav.setViewName("member/fm/WatingFbView");
		}
		return mav;

	}

	// 피드백 수락 시
	public ModelAndView FbAccept(Feedback fbAcceptPost, HttpSession session) {
		mav = new ModelAndView();
		if (fDao.FbAccept(fbAcceptPost.getFb_postNum(), getSessionId(session))) {
			mav.setViewName("member/fm/WatingFbList");
		}
		return mav;
	}

	public ModelAndView fmAcceptFbList(Integer pageNum, HttpSession session) {
		if (pageNum == null)
			pageNum = 1;

		List<Feedback> fmAcceptFbList = fDao.fmAcceptFbList(pageNum, getSessionId(session));
		if (fmAcceptFbList != null) {
			mav = new ModelAndView();
			mav.addObject("fmAcceptFbList", fmAcceptFbList);
			mav.addObject("getPaging_accept", getPaging_accept(pageNum, session));
			mav.setViewName("member/fm/AcceptFbList");
		} else {
			mav.addObject("msg", "요청 수락한 피드백이 없습니다.");
			mav.addObject("getPaging_accept", getPaging_accept(pageNum, session));
			mav.setViewName("member/fm/AcceptFbList");

		}
		System.out.println("list" + fmAcceptFbList);
		return mav;
	}

	private String getPaging_accept(Integer pageNum, HttpSession session) {
		int maxNum = fDao.getAcceptFbCount(getSessionId(session));
		int listCount = 10; // 페이지당 글의 개수
		int pageCount = 5; // 그룹당 페이지 개수
		String boardName = "fmAcceptFbList"; // url
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		return paging.makeHtmlPaging();
	}

	public ModelAndView feedbackWritebView(@NonNull Integer fb_postNum, HttpSession session) {
		Feedback fbWriteView = fDao.feedbackWritebView(fb_postNum);
		if (fbWriteView != null) {
			mav.addObject("WriteFb", fbWriteView);
			mav.setViewName("member/fm/feedbackWrite");
		} else {
			mav.setViewName("member/fm/feedbackWrite");
		}
		return mav;
	}

	public ModelAndView feedbackWrite(Feedback fbWritePost) {
		mav = new ModelAndView();
		if (fDao.fbWrite(fbWritePost.getFb_postNum(), fbWritePost.getFb_ans_contents())) {
			mav.setViewName("member/fm/fmAcceptFbList");
		}
		return mav;
	}

// (관리자)----------------------------------------------------------------

	// 신청 리스트 확인
	public ModelAndView gmFeedbackConfirmList(@ModelAttribute FeedbackApplication fab, Integer pageNum) {
		mav = new ModelAndView();

		if (pageNum == null)
			pageNum = 1;

		List<Board> fabList = fDao.gmFeedbackConfirmList(pageNum);
		if (fabList != null && fabList.size() != 0) {

			// mav.addObject("paging", getPaging(pageNum));
			mav.addObject("fabList", fabList);
			mav.setViewName("member/am/feedbackAccountList");
		}
		return mav;
	}

	// 신청 리스트 상세보기
	public ModelAndView gmFeedbackConfirmView(@NonNull Integer fba_postnum) {
		mav = new ModelAndView();
		FeedbackApplication fa = fDao.gmFeedbackConfirmView(fba_postnum);
		if (fa != null) {
			mav.addObject("fa", fa);
			mav.setViewName("member/am/feedbackConfirmView");
		} else {
			mav.setViewName("member/am/feedbackAccountList");
		}
		return mav;
	}

	public ModelAndView gmFeedbackTransUpdate(int fba_postnum) {
		mav = new ModelAndView();
		String view = null;
		if (fDao.gmFeedbackTransUpdate(fba_postnum) && fDao.gmFeedbackTransUpdate2(fba_postnum)) {
			view = "member/gm/gmFeedbackConfirm";
			mav.addObject("fmFeedbackUpdate", 1);
		} else {
			view = "member/am/feedbackConfirmView";
			mav.addObject("fmFeedbackUpdate", 2);
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView gmFeedbackTransDelete(int fba_postnum) {
		mav = new ModelAndView();
		String view = null;
		if (fDao.gmFeedbackTransDelete(fba_postnum)) {
			view = "member/gm/gmFeedbackConfirm";
			mav.addObject("fmFeedbackUpdate", 1);
		} else {
			view = "member/am/feedbackConfirmView";
			mav.addObject("fmFeedbackUpdate", 2);
		}
		mav.setViewName(view);
		return mav;
	}

}
