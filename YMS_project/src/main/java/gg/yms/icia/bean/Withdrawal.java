package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
@Alias("Withdrawal")
public class Withdrawal {
	
	private String wd_id;
	private String wd_reason;

}