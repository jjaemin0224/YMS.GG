package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("StartItem")
public class StartItem {
	
	private int si_championId;
	private String si_lane;
	private String si_startitem1;
	private double si_pickrate1;
	private double si_winrate1;
	private String si_startitem2;
	private double si_pickrate2;
	private double si_winrate2;
	
}
