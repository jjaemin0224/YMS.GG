package gg.yms.icia.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.Feedback;
import gg.yms.icia.bean.Member;
import gg.yms.icia.dao.IFeedbackDao;

@Service
public class FeedbackMM {
	
	@Autowired
	private IFeedbackDao fDao;
	
	ModelAndView mav;

	// 세션id return
	public String getSessionId(HttpSession session) {
		return session.getAttribute("id").toString();
	}

	
//	(일반회원)------------------------------------------------------------------------------------------------------------------

	public ModelAndView gmFeedbackList(HttpSession session) {
		mav = new ModelAndView();
		String m_id = getSessionId(session);
		
		List<Feedback> gmFeedbackList = fDao.gmFeedbackList(m_id);
		
		if (gmFeedbackList != null) {
			mav.addObject("gmFeedbackList", gmFeedbackList);
		}
		else {
			mav.addObject("msg", "피드백이 없습니다.");
		}
		mav.setViewName("member/gm/feedbackList");
		
		return mav;
	}
	
	
	

}
