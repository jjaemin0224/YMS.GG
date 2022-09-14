package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain=true)
@Data
@Alias("GameRecord")
public class GameRecord {
	
	private String gr_gameId;
	private String gr_gameDuration;
	private String gr_gameEndTime;
	private String gr_gameType;
	private int gr_participantId;
	private String gr_lane;
	private int gr_champLevel;
	private int gr_championId;
	private String gr_championName;
	private String gr_championNameKr;
	private String gr_champImg1;
	private String gr_summonerName;
	private int gr_teamId;
	private String gr_win;
	private int gr_damageDealt;
	private int gr_spell1;
	private int gr_spell2;
	private int gr_item1;
	private int gr_item2;
	private int gr_item3;
	private int gr_item4;
	private int gr_item5;
	private int gr_item6;
	private int gr_accessories;
	private int gr_kills;
	private int gr_deaths;
	private int gr_assists;
	private int gr_totalCS;
	private int gr_baronK;
	private int gr_dragonK;
	private int gr_wardsK;
	private int gr_wardsP;
	private int gr_mainRune1;
	private int gr_subRune1;
	private int gr_gtotal;
}
