package gg.yms.icia.service;

import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.ChampAnalysisRate;
import gg.yms.icia.bean.ChampCounter;
import gg.yms.icia.bean.ChampImg;
import gg.yms.icia.bean.RuneAnalysis;
import gg.yms.icia.bean.StartItem;
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

	public ModelAndView caChampRuneInfo(int championId, String lane) {
		mav = new ModelAndView();
		RuneAnalysis ra = cDao.caChampRuneInfo(championId, lane);
		
		mav.addObject("runeAnalysis", ra);
		mav.setViewName("champAnalysis/ca/champRuneInfo");
		return mav;
	}

	public ModelAndView caChampSkillBuildInfo(int championId, String lane) {
		mav = new ModelAndView();
		String skill = cDao.caChampSkillBuildInfo(championId, lane);
		StringTokenizer st = new StringTokenizer(skill, "|");
		String [] arr = new String[st.countTokens()];
		int i = 0;
		while(st.hasMoreElements()){
			arr[i++] = st.nextToken();
		}
		mav.addObject("skill", arr);
		mav.setViewName("champAnalysis/ca/champSkillBuildInfo");
		return mav;
	}

	public ModelAndView caChampStartItemInfo(int championId, String lane) {
		mav = new ModelAndView();
		StartItem startItem = cDao.caChampStartItemInfo(championId, lane);
		String startItem1 = startItem.getSi_startitem1();
		StringTokenizer st1 = new StringTokenizer(startItem1, "|");
		String [] arr1 = new String[st1.countTokens()];
		int i = 0;
		while(st1.hasMoreElements()){
			arr1[i++] = st1.nextToken();
		}
		mav.addObject("startItemImg1", arr1);
		String startItem2 = startItem.getSi_startitem1();
		StringTokenizer st2 = new StringTokenizer(startItem2, "|");
		String [] arr2 = new String[st2.countTokens()];
		int j = 0;
		while(st2.hasMoreElements()){
			arr2[j++] = st2.nextToken();
		}
		mav.addObject("startItemImg2", arr2);
		
		mav.addObject("startItem", startItem);
		mav.setViewName("champAnalysis/ca/champStartItemInfo");
		return mav;
	}


}
