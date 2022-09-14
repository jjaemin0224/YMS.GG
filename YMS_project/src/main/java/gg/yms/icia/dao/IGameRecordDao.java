package gg.yms.icia.dao;

import java.util.List;

import gg.yms.icia.bean.GameRecord;

public interface IGameRecordDao {

	List<GameRecord> getGrList(String gr_summonerName);

	List<GameRecord> grGetOneBlueList(String gr_gameId);

	List<GameRecord> grGetOneRedList(String gr_gameId);

}
