package gg.yms.icia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.service.GameRecordMM;

@Controller
public class GameRecordController {
	
	@Autowired
	GameRecordMM grm;
	
	ModelAndView mav;
	
	@GetMapping(value="/grSearch")
	public ModelAndView grSearch(@RequestParam String gr_summonerName) {
		mav = grm.grSearch(gr_summonerName);
		return mav;
	}
	
	
}
