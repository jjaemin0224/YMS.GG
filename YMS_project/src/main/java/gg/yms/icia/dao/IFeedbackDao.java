package gg.yms.icia.dao;

import java.util.List;

import gg.yms.icia.bean.Board;
import gg.yms.icia.bean.Feedback;
import gg.yms.icia.bean.FeedbackApplication;
import lombok.NonNull;

public interface IFeedbackDao {

	List<Feedback> gmFeedbackList(String m_id);

	boolean gmFeedbackReq(Feedback fb);

	Feedback getFeedbackInfo(String fb_req_id);

	boolean gmFeedbackAccount(FeedbackApplication fab);

	List<Board> gmFeedbackConfirmList(Integer pageNum);

	FeedbackApplication gmFeedbackConfirmView(@NonNull Integer fba_postnum);

	boolean gmFeedbackTransUpdate(int fba_postnum);

	boolean gmFeedbackTransDelete(int fba_postnum);

	boolean gmFeedbackTransUpdate2(int fba_postnum);



}
