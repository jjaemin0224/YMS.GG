package gg.yms.icia.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.ChampAnalysisRate;
import gg.yms.icia.bean.ChampCounter;
import gg.yms.icia.bean.Member;
import gg.yms.icia.service.ChampMM;

@Controller
public class ChampAnalysisController {
	
	@Autowired
	private ChampMM cm;
	
	ModelAndView mav;
	
	@RequestMapping(value = "/caChampAnalysisMv", method = RequestMethod.GET)
	public String caChampAnalysisMv() {
		return "champAnalysis/main";
	}
	
	@RequestMapping(value = "/caChampMainList", method = RequestMethod.GET)
	public ModelAndView mainChampList() {
	    mav = cm.champMainList();
		return mav;
	}
	
	@RequestMapping(value = "/caChampSideList", method = RequestMethod.GET)
	public ModelAndView mainChampSideList() {
		mav = cm.mainChampSideList();
		return mav;
	}
	
	@RequestMapping(value = "/caChampSideListLane", method = RequestMethod.GET)
	public ModelAndView caChampSideListLane(@RequestParam String lane) {
		mav = cm.caChampSideListLane(lane);
		return mav;
	}
	
	@RequestMapping(value = "/caChampMainListLane", method = RequestMethod.GET)
	public ModelAndView caChampMainListLane(@RequestParam String lane) {
	    mav = cm.caChampMainListLane(lane);
		return mav;
	}
	
	@RequestMapping(value = "/caAnalysis", method = RequestMethod.GET)
	public ModelAndView caAnalysis(@ModelAttribute ChampCounter cc) {
		mav = cm.caAnalysis(cc);
		return mav;
	}
	
	@RequestMapping(value = "/caChampCounterInfo", method = RequestMethod.GET)
	public ModelAndView caChampCounterInfo(@RequestParam int championId, @RequestParam String lane) {
		mav = cm.caChampCounterInfo(championId, lane);
		return mav;
	}
	
	@RequestMapping(value = "/caChampMatchUp", method = RequestMethod.GET)
	public ModelAndView caChampMatchUp(@RequestParam int championId, @RequestParam int counterId, @RequestParam String lane) {
		mav = cm.caChampMatchUp(championId, counterId, lane);
		return mav;
	}
	
	
	
	
	
	
}