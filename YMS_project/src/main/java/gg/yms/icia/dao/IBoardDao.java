package gg.yms.icia.dao;

import java.util.List;

import gg.yms.icia.bean.Board;

public interface IBoardDao {

	List<Board> bbBulletinBoardList(Integer pageNum);

	int getBoardCount();

}
