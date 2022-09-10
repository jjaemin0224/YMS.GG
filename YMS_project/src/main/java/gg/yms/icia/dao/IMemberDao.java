package gg.yms.icia.dao;

import gg.yms.icia.bean.Member;
import gg.yms.icia.bean.Withdrawal;

public interface IMemberDao {

	Member getMemberInfo(String m_id);
	
	boolean mmJoin(Member mb);

	boolean mmLogin(Member mb);

	Member mmSearchMember(Member mb);

	boolean mmResetPw(Member mb);

	boolean cmMyInfoUpdate(Member mb);

	boolean cmMyInfoPwUpdate(Member mb);

	boolean cmMyInfoDelete(Member mb);

	boolean cmInsertWithdrawal(Withdrawal wd);

	boolean cmCashCharge(Member mb);
	
	int mmIdCheck (Member mb);

	

}
