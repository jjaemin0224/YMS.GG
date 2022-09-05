package gg.yms.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.Board;
import gg.yms.icia.bean.ChampImg;
import gg.yms.icia.dao.IBoardDao;
import gg.yms.icia.userClass.Paging;

@Service
public class BoardMM {
	
	@Autowired
	IBoardDao bDao;
	
	ModelAndView mav;

	public ModelAndView bbBulletinBoardList(Integer pageNum) {
		mav = new ModelAndView();
		
		if (pageNum == null) pageNum = 1;
		
		List<Board> bbList = bDao.bbBulletinBoardList(pageNum);
		if (bbList != null && bbList.size() != 0) {
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
	
	
}
