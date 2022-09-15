package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
@Alias("FeedbackApplication")
public class FeedbackApplication {
	private int fba_postnum;
	private String fba_id;
	private String fba_portfolio;
	private int fba_check;
	private String fba_date;

}
