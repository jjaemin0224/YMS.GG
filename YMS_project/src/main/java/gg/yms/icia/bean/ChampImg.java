package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
@Alias("ChampImg")
public class ChampImg {
	
	private String ch_img_championId;
	private String ch_img_championNameEg;
	private String ch_img_championNameKr;
	private String ch_img_img1;
	private String ch_img_img2;
	private String ch_img_img3;
	
}
