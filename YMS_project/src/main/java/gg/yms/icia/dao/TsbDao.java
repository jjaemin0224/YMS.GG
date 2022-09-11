package gg.yms.icia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gg.yms.icia.bean.Tsb_Board;

public interface TsbDao {
	
//	Tsb_Board setTsbBoard(Tsb_Board tsb_postNum);
	
	List<Tsb_Board> getTsbList (Integer pageNum);
	
	boolean tsbWrite(Tsb_Board tsb);
	
	Tsb_Board getTsb(int tsb_postNum);

	boolean tsbDelete(int tsb_postNum);

	int getBoardCount();

	List<Tsb_Board> getTsbListSort(@Param("pageNum") Integer pageNum ,@Param("lane") String lane ,
			@Param("que")  String que, @Param("tier") String tier );

	int getSortBoardCount(@Param("lane") String lane, @Param("que")  String que, @Param("tier") String tier ) ;

}
