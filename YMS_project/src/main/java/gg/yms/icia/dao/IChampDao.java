package gg.yms.icia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gg.yms.icia.bean.ChampAnalysisRate;
import gg.yms.icia.bean.ChampCounter;
import gg.yms.icia.bean.ChampImg;

public interface IChampDao {

	List<ChampImg> mainChampList();

	List<Integer> selectLaneChampionId(String lane);

	List<ChampImg> getChampImgList(List<Integer> champIdList);

	String getMainLane(int championId);

	ChampImg caChampionImg(int championId);

	List<ChampCounter> caChampCounterInfo(@Param("championId") int championId,@Param("lane") String lane);

	List<Integer> caChampCounterIdInfo(@Param("championId") int championId,@Param("lane") String lane);

	ChampCounter getFirstCounterId(ChampCounter cc);

	ChampCounter caChampMatchUp(@Param("championId") int championId,@Param("counterId") int counterId,@Param("lane") String lane);

	ChampImg getChampImg(@Param("championId") int championId);

	ChampAnalysisRate getChampAnalysisRate(@Param("championId") int championId,@Param("lane") String lane);

	List<ChampAnalysisRate> mainChampSideList(String lane);


}
