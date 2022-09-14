package gg.yms.icia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gg.yms.icia.service.GameRecordMM;

@Controller
public class GameRecordController {
	
	@Autowired
	GameRecordMM grm;
	
	ModelAndView mav;
	
	@GetMapping(value="/grSearchMv")
	public String grSearch() {
		return "gameRecord/search";
	}
	
	@GetMapping(value="/grSearch")
	public ModelAndView grSearch(@RequestParam String gr_summonerName) {
		mav = grm.grSearch(gr_summonerName);
		return mav;
	}
	
	@GetMapping(value="/grList")
	public ModelAndView grList(@RequestParam String gr_summonerName) {
		mav = grm.grList(gr_summonerName);
		return mav;
	}
	
	
	@GetMapping(value="/grGetOneGameList")
	public ModelAndView grGetOneGameList(@RequestParam String gr_gameId) {
		mav = grm.grGetOneGameList(gr_gameId);
		return mav;
	}
	
	
	
}