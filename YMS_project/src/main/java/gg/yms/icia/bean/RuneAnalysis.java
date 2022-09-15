package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;


@Data
@Alias("RuneAnalysis")
public class RuneAnalysis {
	
	private int ra_championId;
	private String ra_lane;
	private int ra_m1_rune1;
	private int ra_m2_rune1;
	private int ra_m3_rune1;
	private int ra_m4_rune1;
	private int ra_s1_rune1;
	private int ra_s2_rune1;
	private int ra_c1_rune1;
	private int ra_c2_rune1;
	private int ra_c3_runt1;
	private double ra_pickrate_rune1;
	private double ra_winrate_rune1;
	private int ra_m1_rune2;
	private int ra_m2_rune2;
	private int ra_m3_rune2;
	private int ra_m4_rune2;
	private int ra_s1_rune2;
	private int ra_s2_rune2;
	private int ra_c1_rune2;
	private int ra_c2_rune2;
	private int ra_c3_runt2;
	private double ra_pickrate_rune2;
	private double ra_winrate_rune2;

}
