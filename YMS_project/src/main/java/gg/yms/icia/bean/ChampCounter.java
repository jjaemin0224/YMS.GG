package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ChampCounter")
public class ChampCounter {
	
	private int cc_rank;
	private int cc_championId;
	private String cc_lane;
	private double cc_pickrate;
	private double cc_winrate;
	private double cc_banrate;
	private int cc_championId_counter;
	private String cc_championName_counter;
	private String cc_champImg1_counter;
	private double cc_winrate_org;
	private double cc_winrate_counter;
	private double cc_lanewinrate_org;
	private double cc_lanewinrate_counter;
	private double cc_kda_org;
	private double cc_kda_counter;
	private double cc_killengagerate_org;
	private double cc_killengagerate_counter;

}
