package gg.yms.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.ChampImg;
import gg.yms.icia.dao.IChampDao;

@Service
public class ChampMM {

	@Autowired
	private IChampDao cDao;

	ModelAndView mav;

	public ModelAndView mainChampList() {
		mav = new ModelAndView();

		List<ChampImg> champImgList = cDao.mainChampList();

		mav.addObject("champImgList", makeHtml_cList(champImgList));
		mav.setViewName("main/champList");
		return mav;
	}

	private Object makeHtml_cList(List<ChampImg> champImgList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < champImgList.size(); i++) {
			ChampImg c = champImgList.get(i);
			sb.append("<div class='champImg' data-code='" + c.getCh_img_championId() + "'>");
			sb.append("<img src='" + c.getCh_img_img1() + "'>");
			sb.append("</div>");
		}
		return sb.toString();
	}

}
