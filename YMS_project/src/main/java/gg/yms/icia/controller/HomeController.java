package gg.yms.icia.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.service.ChampMM;

@Controller
public class HomeController {
	
	@Autowired
	private ChampMM cm;
	
	ModelAndView mav;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	    return "home";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
	    return "home";
	}
	
	@RequestMapping(value = "/mainChampList", method = RequestMethod.GET)
	public ModelAndView mainChampList() {
	    mav = cm.mainChampList();
		return mav;
	}
	
	@RequestMapping(value = "/mainChampSideList", method = RequestMethod.GET)
	public String mainChampSideList() {
		return "main/champSideList";
	}
	
}
