package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Shoes")
public class Shoes {
	private int sh_championId;
	private String sh_lane;
	private int sh_shoes1;
	private double sh_pickrate1;
	private double sh_winrate1;
	private int sh_shoes2;
	private double sh_pickrate2;
	private double sh_winrate2;
}
