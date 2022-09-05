package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
@Alias("Board")
public class Board {
	
	private int bb_postNum;
	private String bb_id;
	private String bb_title;
	private String bb_content;
	private String bb_date;
	private int bb_like;

}
