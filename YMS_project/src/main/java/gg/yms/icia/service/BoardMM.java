package gg.yms.icia.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import gg.yms.icia.bean.BbReply;
import gg.yms.icia.bean.Board;
import gg.yms.icia.bean.ChampImg;
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

	public ModelAndView bbBoardView(@NonNull Integer bb_postNum) {
		Board board = bDao.bbBoardView(bb_postNum);
		List<BbReply> bReplyList = bDao.bbReplyView(bb_postNum);
		if (board != null) {
			mav.addObject("board", board);
			mav.addObject("bReplyList", bReplyList);
			mav.setViewName("bulletin/boardView");
		} else {
			mav.setViewName("bulletin/board");
		}
		return mav;
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
