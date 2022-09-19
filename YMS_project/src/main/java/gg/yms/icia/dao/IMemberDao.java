package gg.yms.icia.dao;

import java.util.List;

import gg.yms.icia.bean.Board;
import gg.yms.icia.bean.Member;
import gg.yms.icia.bean.Tsb_Board;
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

   String mmEncoderPw(String m_id);

   void cashDeduction(String req_id);
   
   List<Member> amGetMemberinfo();

   boolean amMemberDelete(String m_id);

   int getBoardCount();
   
   int getTsbBoardCount();

   List<Tsb_Board> getTsbList(Integer pageNum);

   boolean amTsbDelete(Integer postNum);

   List<Board> getBbList(Integer pageNum);

   boolean amBbDelete(Integer postNum);

}