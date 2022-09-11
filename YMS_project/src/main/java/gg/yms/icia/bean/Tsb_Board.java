package gg.yms.icia.bean;

import java.sql.Timestamp;


import org.apache.ibatis.type.Alias;


import lombok.Data;
import lombok.experimental.Accessors;
@Accessors(chain = true)
@Data
@Alias("Tsb_Board")

public class Tsb_Board {

	private int tsb_postNum ; 
	private String tsb_id ; 
	private String tsb_title;
	private String tsb_contents;
	private String tsb_que;
	private String tsb_tier;
	private String tsb_lane;
	private String tsb_time;
	private String tsb_voice;
	private Timestamp tsb_date; //
//	private List<BoardFile> bfList;

}
