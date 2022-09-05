package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
@Alias("BbReply")
public class BbReply {
	
	private int bbr_postNum;
	private int bbr_replyNum;
	private String bbr_content;
	private String bbr_id;
	private String bbr_date;
}
