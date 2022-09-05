package gg.yms.icia.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import gg.yms.icia.service.BoardMM;

@Controller
public class BoardController {

	@Autowired
	BoardMM bm;

	ModelAndView mav;

	// 자유게시판 페이지 이동
	@GetMapping(value = "/bbBulletinBoardMv")
	public String bbBulletinBoardMv() {
		return "bulletin/board";
	}
	
	// 자유게시판 리스트(ajax)
	@GetMapping(value = "/bbBulletinBoardList")
	public ModelAndView bbBulletinBoardList(@Nullable Integer pageNum) {
		mav = bm.bbBulletinBoardList(pageNum);
		return mav;
	}
	

}
