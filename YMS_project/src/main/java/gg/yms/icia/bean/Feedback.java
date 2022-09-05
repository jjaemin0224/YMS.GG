package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
@Alias("Feedback")
public class Feedback {
	
	private int fb_postNum;
	private String fb_req_id;
	private String fb_req_gameId;
	private String fb_req_title;
	private String fb_req_summonerName;
	private String fb_req_contents;
	private String fb_req_date;
	private String fb_ans_id;
	private String fb_ans_contents;
	private String fb_ans_date;
	private boolean fb_flag;

}
