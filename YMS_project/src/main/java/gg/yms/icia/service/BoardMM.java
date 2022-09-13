package gg.yms.icia.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.BbReply;
import gg.yms.icia.bean.Board;
import gg.yms.icia.bean.BoardLike;
import gg.yms.icia.dao.IBoardDao;
import gg.yms.icia.userClass.Paging;
import lombok.NonNull;

@Service
public class BoardMM {

	@Autowired
	IBoardDao bDao;

	ModelAndView mav;

	// 세션id return
	public String getSessionId(HttpSession session) {
		return session.getAttribute("id").toString();
	}

	public ModelAndView bbBulletinBoardList(Integer pageNum) {
		mav = new ModelAndView();

		if (pageNum == null)
			pageNum = 1;

		List<Board> bbList = bDao.bbBulletinBoardList(pageNum);
		if (bbList != null && bbList.size() != 0) {
//			ObjectMapper mapper = new ObjectMapper();
//			String json = "";

//			try {
//				json = mapper.writeValueAsString(bbList);
//			} catch (JsonProcessingException e) {
//				e.printStackTrace();
//			}
//					
//			mav.addObject("bbList", json);
			mav.addObject("bbList", bbList);
			mav.addObject("paging", getPaging(pageNum));
			mav.setViewName("bulletin/boardList");
		}
		return mav;
	}

	private String getPaging(Integer pageNum) {
		int maxNum = bDao.getBoardCount();
		int listCount = 10; // 페이지당 글의 개수
		int pageCount = 5; // 그룹당 페이지 개수
		String boardName = "bbBulletinBoardList"; // url
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		return paging.makeHtmlPaging();
	}

	public ModelAndView bbBoardView(@NonNull Integer bb_postNum, HttpSession session) {
		Board board = bDao.bbBoardView(bb_postNum);
		List<BbReply> bReplyList = bDao.bbReplyView(bb_postNum);
		int boardLike = bDao.getLike(bb_postNum); // 현재 게시글 좋아요 수 저장
		int findLike = bDao.findLikeNum(bb_postNum, getSessionId(session).toString());
		if (board != null) {
			board.setBb_like(boardLike);
			mav.addObject("board", board);
			mav.addObject("bReplyList", bReplyList);
			mav.addObject("findLike",findLike); // select 값
			mav.addObject("boardLike",boardLike);
			mav.setViewName("bulletin/boardView");
		
		} else {
			mav.setViewName("bulletin/board");
		}
		return mav;
	}
	
	
//	public List<BbReply> bbReplyInsert(BbReply bbReply, HttpSession session) {
//		String bbr_id = getSessionId(session);
//		bbReply.setBbr_id(bbr_id);
//		List<BbReply> bbReplyList = null;
//		
//		if (bDao.bbReplyInsert(bbReply)) {
//			bbReplyList = bDao.bbReplyView(bbReply.getBbr_postNum());
//		}
//		
//		return bbReplyList;
//	}
//	
	public BoardLike bbLikeUp(BoardLike bbl , HttpSession session) {
		BoardLike bblinfo = null;
		System.out.println("MM" + getSessionId(session));
		if (bDao.bblUp(bbl.getBbl_postnum(), getSessionId(session))) { // 좋아요 여부 검사 할 때 썼던 session 값 id 와 현재 board값
			bDao.bb_likeUp(bbl.getBbl_postnum()) ;  // 현재 게시글 좋아요 수 +1
			int bbl_like = bDao.getLike(bbl.getBbl_postnum()); // 좋아요 버튼 눌렀을 때 보드 라이크의 현재 해당 게시글의 좋아요 카운트
			bblinfo = bDao.getbbl(bbl.getBbl_postnum() ,getSessionId(session));
			bblinfo.setBbl_like(bbl_like); // 좋아요 누른 현재 좋아요 수 반영한 컬럼 값 업데이트
			System.out.println("like up시 저장된 bblinfo 값" + bblinfo);
		} 
		return bblinfo;
	}

	public BoardLike bbLikeDown(BoardLike bbl , HttpSession session) {
		BoardLike bblinfo = bbl;
		System.out.println("넘어는 오나요" + bbl + getSessionId(session));
		if (bDao.bblDown(bbl.getBbl_postnum(), getSessionId(session))) {
			bDao.bb_likeDown(bblinfo.getBbl_postnum());
			int bbl_like = bDao.getLike(bblinfo.getBbl_postnum()); // 좋아요 버튼 눌렀을 때 보드 라이크의 현재 해당 게시글의 좋아요 카운트
			bblinfo.setBbl_Id(getSessionId(session));
			bblinfo.setBbl_like(bbl_like);
			bblinfo.setBbl_likeNum(0);
			System.out.println("like down시 저장된 bblinfo 값" + bblinfo);
		}	
		return bblinfo;
	}

	public ModelAndView bbBoardWrite(Board board, HttpSession session) {
		mav = new ModelAndView();
		String bb_id = getSessionId(session);
		board.setBb_id(bb_id);
		
		if (bDao.bbBoardWrite(board)) {
			mav.setViewName("bulletin/board");
		}

		return mav;
	}

	public List<BbReply> bbReplyInsert(BbReply bbReply, HttpSession session) {
		String bbr_id = getSessionId(session);
		bbReply.setBbr_id(bbr_id);
		List<BbReply> bbReplyList = null;
		
		if (bDao.bbReplyInsert(bbReply)) {
			bbReplyList = bDao.bbReplyView(bbReply.getBbr_postNum());
		}
		
		return bbReplyList;
	}

	

}
