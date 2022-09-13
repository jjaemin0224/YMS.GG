package gg.yms.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.ChampAnalysisRate;
import gg.yms.icia.bean.ChampCounter;
import gg.yms.icia.bean.ChampImg;
import gg.yms.icia.dao.IChampDao;

@Service
public class ChampMM {

	@Autowired
	private IChampDao cDao;

	ModelAndView mav;
	
	public ModelAndView champMainList() {
		mav = new ModelAndView();

		List<ChampImg> champImgList = cDao.mainChampList();

		mav.addObject("champImgList", champImgList);
		mav.addObject("lane", "ALL");
		mav.setViewName("champAnalysis/champMainList");
		return mav;
	}

	public ModelAndView caChampMainListLane(String lane) {
		mav = new ModelAndView();
		List<ChampImg> champImgList = null;
		List<Integer> champIdList = cDao.selectLaneChampionId(lane);
		
		champImgList = cDao.getChampImgList(champIdList);
		mav.addObject("champImgList", champImgList);
		mav.addObject("lane", lane);
		mav.setViewName("champAnalysis/champMainList");
		
		return mav;
	}
	
	public ModelAndView mainChampSideList() {
		mav = new ModelAndView();
		String lane = "TOP";
		List<ChampAnalysisRate> champSideList = cDao.mainChampSideList(lane);
		mav.addObject("sideLane", lane);
		mav.addObject("champSideList", champSideList);
		mav.setViewName("champAnalysis/champSideList");
		return mav;
	}

	public ModelAndView caChampSideListLane(String lane) {
		mav = new ModelAndView();
		List<ChampAnalysisRate> champSideList = cDao.mainChampSideList(lane);
		mav.addObject("sideLane", lane);
		mav.addObject("champSideList", champSideList);
		mav.setViewName("champAnalysis/champSideList");
		return mav;
	}

	
	
	public ModelAndView caAnalysis(ChampCounter cc) {
		mav = new ModelAndView();
		int championId = cc.getCc_championId();
		if (cc.getCc_lane().equals("ALL")) {
			String lane = cDao.getMainLane(championId);
			cc.setCc_lane(lane);
		}
		
		ChampCounter champ = cDao.getFirstCounterId(cc);
		ChampImg champImg = cDao.caChampionImg(championId);
		
		mav.addObject("ChampImg", champImg);
		mav.addObject("ChampCounter", champ);
		mav.setViewName("champAnalysis/analysisMain");
		return mav;
		
	}
	
	public ModelAndView caChampMatchUp(int championId, int counterId, String lane) {
		mav = new ModelAndView();
		
		ChampCounter champCounter = cDao.caChampMatchUp(championId, counterId, lane);
		ChampImg champImg = cDao.getChampImg(championId);
		ChampImg counterImg = cDao.getChampImg(counterId);
		ChampAnalysisRate champCa = cDao.getChampAnalysisRate(championId, lane);
		ChampAnalysisRate counterCa = cDao.getChampAnalysisRate(counterId, lane);
		
		double winrate_counter = 100 - champCounter.getCc_winrate_org();
		double lanewinrate_counter = 100 - champCounter.getCc_lanewinrate_org();
		
		champCounter.setCc_winrate_counter(Math.round(winrate_counter*100)/100.0);
		champCounter.setCc_lanewinrate_counter(Math.round(lanewinrate_counter*100)/100.0);
		
		mav.addObject("championId", championId);
		mav.addObject("champImg", champImg);
		mav.addObject("counterImg", counterImg);
		mav.addObject("champCa", champCa);
		mav.addObject("counterCa", counterCa);
		mav.addObject("champCounter", champCounter);
		
		mav.setViewName("champAnalysis/ca/champMatchUp");
		return mav;
	}
	

	public ModelAndView caChampCounterInfo(int championId, String lane) {
		mav = new ModelAndView();
		List<ChampCounter> champCounterList = cDao.caChampCounterInfo(championId, lane);
		
		mav.addObject("champCounterList", champCounterList);
		mav.setViewName("champAnalysis/ca/champCounterInfo");
		return mav;
	}

	
	

	
	



}
