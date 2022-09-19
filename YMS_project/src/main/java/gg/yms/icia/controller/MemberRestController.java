package gg.yms.icia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.BbReply;
import gg.yms.icia.bean.Member;
import gg.yms.icia.service.MemberMM;

@RestController
public class MemberRestController {

	
	@Autowired
	private MemberMM MM;
	
	ModelAndView mav;
	
	@PostMapping(value="/amMemberDelete")
	public List<Member> amMemberDelete(String m_id) {
		System.out.println("delete 컨트롤러");
		List<Member> MemberDeleteList = MM.amMemberDelete(m_id);
		return MemberDeleteList;
	}

}
