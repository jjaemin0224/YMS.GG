package gg.yms.icia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.BbReply;
import gg.yms.icia.bean.BoardLike;
import gg.yms.icia.service.BoardMM;

@RestController
public class BoardRestController {
	
	@Autowired
	private BoardMM bm;
	
	ModelAndView mav;
	
	@PostMapping(value="/bbReplyInsert")
	public List<BbReply> bbReplyInsert(@RequestBody BbReply bbReply, HttpSession session) {
		List<BbReply> bbReplyList = bm.bbReplyInsert(bbReply, session);
		return bbReplyList;
	}

	// 자유게시판 좋아요
		@PostMapping(value = "/bbLikeUp")
		public BoardLike bbLikeUp(BoardLike Bbl , HttpSession session) {
			System.out.println("컨트롤러" + Bbl);
			BoardLike bblinfo = bm.bbLikeUp(Bbl , session);
			return bblinfo;
		}

		// 자유게시판 좋아요 취소
		@PostMapping(value = "/bbLikeDown")
		public BoardLike bbLikeDown(BoardLike Bbl , HttpSession session) {
			BoardLike bblinfo = bm.bbLikeDown(Bbl , session);
			return bblinfo;
		}
}
