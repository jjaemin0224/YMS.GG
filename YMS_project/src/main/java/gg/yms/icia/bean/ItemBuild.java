package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ItemBuild")
public class ItemBuild {

	private int ib_championId;
	private String ib_lane;
	private int ib_item1_1;
	private int ib_item2_1;
	private int ib_item3_1;
	private double ib_pickrate_itembuild_1;
	private double ib_winrate_itembuild_1;
	private int ib_item1_2;
	private int ib_item2_2;
	private int ib_item3_2;
	private double ib_pickrate_itembuild_2;
	private double ib_winrate_itembuild_2;
	private int ib_item1_3;
	private int ib_item2_3;
	private int ib_item3_3;
	private double ib_pickrate_itembuild_3;
	private double ib_winrate_itembuild_3;
	
}
