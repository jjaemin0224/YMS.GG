package gg.yms.icia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gg.yms.icia.bean.Tsb_Board;
import gg.yms.icia.service.TsbMM;

@Controller
public class TSboardController {
	@Autowired
	private TsbMM tsbM;
	
	ModelAndView mav;
	
	// 팀원 찾기 게시판 글 목록 	+ 팀원 찾기 게시판 페이징
	@RequestMapping(value = "/TsbList" , method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ModelAndView tsbList(@Nullable Integer pageNum ,@ModelAttribute Tsb_Board tsbBoard ) {
		System.out.println("CONSOLE"+tsbBoard.getTsb_lane());
		mav = tsbM.getTsbList(pageNum ,tsbBoard);
		return mav;
	}
	
	// 팀원 찾기 글 조회
	@RequestMapping(value = "/TsbContents" , method = RequestMethod.GET)
	public ModelAndView tsbContents(@RequestParam int postNum) {
		mav = tsbM.tsbContents(postNum);
		return mav;
	}
	
//	// 팀원 찾기 글 삭제
//	@PostMapping(value = "/TsbDelete" )
//	public ModelAndView tsbDelete(int postnum) {
//		
//		System.out.println("글삭제 tsb " +postnum);
//		mav = tsbM.tsbDelete(postnum);
//		return mav;
//	}
	
	
	// 팀원 찾기 게시판 글쓰기 이동
	@RequestMapping(value = "/tsbWriteFrm" , method = RequestMethod.GET)
	public String tsbWritemv() {
		return "tsBoard/tsbWrite";
		
	}
	@PostMapping(value = "/tsbWrite")
	public ModelAndView tsbWrite(@ModelAttribute Tsb_Board tsb, HttpSession session) {
		mav = tsbM.tsbWrite(tsb, session);
		System.out.println("controller tsb" + tsb);
		return mav;
	}
	


}
