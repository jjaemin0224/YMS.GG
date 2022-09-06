package gg.yms.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Accessors(chain=true)
@Data
@Alias("GameRecord")
public class GameRecord {
	
	private String gr_gameId;
	private String gr_summonerName;
	private String gr_kill;

}
