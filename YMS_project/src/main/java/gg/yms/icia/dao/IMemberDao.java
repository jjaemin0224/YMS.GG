package gg.yms.icia.dao;

import gg.yms.icia.bean.Member;

public interface IMemberDao {

	Member getMemberInfo(String m_id);
	
	boolean mmJoin(Member mb);

	boolean mmLogin(Member mb);

	Member mmSearchMember(Member mb);

	boolean mmResetPw(Member mb);

	boolean cmMyInfoUpdate(Member mb);

	

}
