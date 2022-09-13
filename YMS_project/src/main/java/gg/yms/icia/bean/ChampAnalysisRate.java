package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ChampAnalysisRate")
public class ChampAnalysisRate {
	
	private int ca_championId;
	private String ca_championName;
	private String ca_lane;
	private double ca_pickrate;
	private double ca_winrate;
	private double ca_banrate;
	private String ca_championNameKr;
	private String ca_champImg1;
	private int ca_tier;
}
