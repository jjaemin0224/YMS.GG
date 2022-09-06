package gg.yms.icia.service;

import org.python.util.PythonInterpreter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.dao.IGameRecordDao;


@Service
public class GameRecordMM {
	
	@Autowired
	IGameRecordDao grDao;
	
	ModelAndView mav;
	
	public ModelAndView grSearch(String gr_summonerName) {
		mav = new ModelAndView();
		mav.addObject("gr_summonerName", gr_summonerName);
		mav.setViewName("gameRecord/search");
		return mav;
		}

	public ModelAndView grLastList(String gr_summonerName) {
		PythonInterpreter pyInterp = new PythonInterpreter();
		return null;
	}
		
}