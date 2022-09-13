package gg.yms.icia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gg.yms.icia.bean.BbReply;
import gg.yms.icia.bean.Board;
import gg.yms.icia.bean.BoardLike;
import lombok.NonNull;

public interface IBoardDao {

	List<Board> bbBulletinBoardList(Integer pageNum);

	int getBoardCount();

	Board bbBoardView(@NonNull Integer postNum);

	boolean bbBoardWrite(Board board);

	List<BbReply> bbReplyView(Integer bb_postNum);

	boolean bbReplyInsert(BbReply bbReply);

	int findLikeNum(@Param("bbl_postnum") Integer bbl_postnum,@Param("bbl_Id") String bbl_Id );

	int getLike(Integer bbl_postnum);

	boolean bblUp(@Param("bbl_postnum") Integer bbl_postnum,@Param("bbl_Id") String bbl_Id );

	boolean bblDown(@Param("bbl_postnum") Integer bbl_postnum,@Param("bbl_Id") String bbl_Id );

	void bb_likeUp(int bbl_postnum);

	BoardLike getbbl(@Param("bbl_postnum") Integer bbl_postnum,@Param("bbl_Id") String bbl_Id );

	void bb_likeDown(int bbl_postnum);

}