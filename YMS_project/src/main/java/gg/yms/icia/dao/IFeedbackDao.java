package gg.yms.icia.dao;

import java.util.List;

import gg.yms.icia.bean.Feedback;

public interface IFeedbackDao {

	List<Feedback> gmFeedbackList(String m_id);

}
