package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
@Alias("BoardLike")
public class BoardLike {
	private int bbl_like;
	private int bbl_postnum;
	private String bbl_Id;
	private int bbl_likeNum;
}
