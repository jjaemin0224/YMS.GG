package gg.yms.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.GameRecord;
import gg.yms.icia.dao.IGameRecordDao;


@Service
public class GameRecordMM {
	
	@Autowired
	IGameRecordDao grDao;
	
	ModelAndView mav;

	public ModelAndView grSearch(String gr_summonerName) {
		mav = new ModelAndView();
		
		mav.addObject("gr_summonerName", gr_summonerName);
		mav.setViewName("gameRecord/main");
		return mav;
	}

	public ModelAndView grList(String gr_summonerName) {
		mav = new ModelAndView();
		List<GameRecord> grList = grDao.getGrList(gr_summonerName);
		if (grList.size() == 0) {
			mav.addObject("gr_summonerName", gr_summonerName);
			mav.setViewName("gameRecord/grNoList");
		}
		else {
			mav.addObject("grList", grList);
			mav.addObject("gr_summonerName", gr_summonerName);
			mav.setViewName("gameRecord/grList");
		}
		return mav;
	}

	public ModelAndView grGetOneGameList(String gr_gameId) {
		mav = new ModelAndView();
		List<GameRecord> grOneBlueList = grDao.grGetOneBlueList(gr_gameId);
		List<GameRecord> grOneRedList = grDao.grGetOneRedList(gr_gameId);
		
		mav.addObject("grDurationCheck", grOneBlueList.get(0).getGr_gameDuration());
		mav.addObject("grTypeCheck", grOneBlueList.get(0).getGr_gameType());
		if (grOneBlueList.get(0).getGr_win().equals("True")) {
			mav.addObject("grWinCheck", 1);
		}
		else {
			mav.addObject("grWinCheck", 0);
		}
		
		mav.addObject("grOneBlueList", grOneBlueList);
		mav.addObject("grOneRedList", grOneRedList);
		mav.setViewName("gameRecord/grOneGameList");
		return mav;
	}
	

}
