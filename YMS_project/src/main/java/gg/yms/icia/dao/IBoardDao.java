package gg.yms.icia.dao;

import java.util.List;

import gg.yms.icia.bean.BbReply;
import gg.yms.icia.bean.Board;
import lombok.NonNull;

public interface IBoardDao {

	List<Board> bbBulletinBoardList(Integer pageNum);

	int getBoardCount();

	Board bbBoardView(@NonNull Integer postNum);

	boolean bbBoardWrite(Board board);

	List<BbReply> bbReplyView(Integer bb_postNum);

	boolean bbReplyInsert(BbReply bbReply);

}
