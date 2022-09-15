package gg.yms.icia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gg.yms.icia.bean.Board;
import gg.yms.icia.bean.Feedback;
import gg.yms.icia.bean.FeedbackApplication;
import gg.yms.icia.bean.Tsb_Board;
import lombok.NonNull;

public interface IFeedbackDao {

	List<Feedback> gmFeedbackListfirst(@Param("FB_REQ_ID") String m_id, @Param("pageNum") Integer pageNum);

	List<Feedback> gmFeedbackList(@Param("FB_REQ_ID") String m_id, @Param("pageNum") Integer pageNum,
			@Param("FB_CHECK") int fb_check);

	boolean gmFeedbackReq(Feedback fb);

	Feedback getFeedbackInfo(String fb_req_id);

	boolean gmFeedbackAccount(FeedbackApplication fab);

	List<Board> gmFeedbackConfirmList(Integer pageNum);

	FeedbackApplication gmFeedbackConfirmView(@NonNull Integer fba_postnum);

	boolean gmFeedbackTransUpdate(int fba_postnum);

	boolean gmFeedbackTransDelete(int fba_postnum);

	boolean gmFeedbackTransUpdate2(int fba_postnum);

	boolean gmFbReqWrite(Feedback req_fb);

	int getBoardCount(int fb_check);

	int getWatingFbCount();

	Tsb_Board getFbreq(int postnum);

	List<Feedback> fmFeedbackList(Integer pageNum);

	Feedback fmWatingFbView(@NonNull Integer fb_postNum);

	boolean FbAccept(@Param("FB_POSTNUM") int fb_postNum, @Param("FB_ANS_ID") String sessionId);

	int getAcceptFbCount(String fb_ans_id);

	List<Feedback> fmAcceptFbList(@Param("pageNum") Integer pageNum, @Param("FB_ANS_ID") String fb_ans_id);

	Feedback feedbackWritebView(@NonNull Integer fb_postNum);

	int getFirstPaging();

	boolean fbWrite(@Param("FB_POSTNUM") int fb_postNum, @Param("FB_ANS_CONTENTS") String fb_ans_contents);

}
