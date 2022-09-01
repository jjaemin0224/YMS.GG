package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
@Alias("Member")
public class Member {
	
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_phoneNum;
	private String m_birth;
	private String m_summonerName;
	private String m_rating;
	private int m_cash;
	private String m_creationDate;
	

}
