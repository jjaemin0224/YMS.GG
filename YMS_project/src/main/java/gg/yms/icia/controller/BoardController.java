package gg.yms.icia.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.Board;
import gg.yms.icia.service.BoardMM;
import lombok.NonNull;

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

	// 게시글 읽기
	@GetMapping(value = "/bbBoardView")
	public ModelAndView bbBoardView(@NonNull Integer bb_postNum) {
		mav = bm.bbBoardView(bb_postNum);
		return mav;
	}

	// 게시글 작성 페이지 이동
	@GetMapping(value = "/bbBoardWriteMv")
	public String bbBoardWriteMv() {
		return "bulletin/boardWrite";
	}

	// 게시글 작성
	@GetMapping(value = "/bbBoardWrite")
	public ModelAndView bbBoardWrite(@ModelAttribute Board board, HttpSession session) {
		mav = bm.bbBoardWrite(board, session);
		return mav;
	}

}