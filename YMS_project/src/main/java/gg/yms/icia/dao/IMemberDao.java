package gg.yms.icia.dao;

import gg.yms.icia.bean.Member;

public interface IMemberDao {

	boolean mmJoin(Member mb);

	boolean mmLogin(Member mb);

	Member mmSearchMember(Member mb);

	boolean mmResetPw(Member mb);

}
