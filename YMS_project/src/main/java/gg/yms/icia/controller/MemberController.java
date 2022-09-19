package gg.yms.icia.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gg.yms.icia.bean.Member;
import gg.yms.icia.bean.Withdrawal;
import gg.yms.icia.service.MemberMM;

@Controller
public class MemberController {

   @Autowired
   private MemberMM mm;

   ModelAndView mav;

   // 회원가입 페이지로 이동
   @RequestMapping(value = "/mmJoinMv", method = RequestMethod.GET)
   public String mmJoinMv() {
      return "member/join";
   }

   // 회원가입
   @PostMapping(value = "/mmJoin")
   public ModelAndView mmJoin(@ModelAttribute Member mb) {
      mav = mm.mmJoin(mb);
      return mav;
   }
   
   //아이디 중복 체크
    @ResponseBody // 값 변환을 위해 꼭 필요함
      @GetMapping("/mmIdCheck") // 아이디 중복확인을 위한 값으로 따로 매핑
      public String mmIdCheck(@ModelAttribute Member mb) {
         int result = mm.mmIdCheck(mb); // 중복확인한 값을 int로 받음
         System.out.println("resultttt:" + result);
         return Integer.toString(result); 
      }
 
   // 로그인 페이지로 이동
   @RequestMapping(value = "/mmLoginMv", method = RequestMethod.GET)
   public String mmLoginMv() {
      return "member/login";
   }

   // 로그인
   @PostMapping(value = "/mmLogin")
   public ModelAndView mmLogin(@ModelAttribute Member mb, HttpSession session, RedirectAttributes attr) {
      mav = mm.mmLogin(mb, session, attr);
      return mav;
   }

   // 아이디 찾기 페이지로 이동
   @RequestMapping(value = "/mmSearchIdMv", method = RequestMethod.GET)
   public String mmSearchIdMv() {
      return "member/searchId";
   }

   // 아이디 찾기
   @PostMapping(value = "/mmSearchId")
   public ModelAndView mmSearchId(@ModelAttribute Member mb) {
      mav = mm.mmSearchId(mb);
      return mav;
   }

   // 비밀번호 찾기 페이지로 이동
   @RequestMapping(value = "/mmSearchPwMv", method = RequestMethod.GET)
   public String mmSearchPwMv() {
      return "member/searchPw";
   }

   // 비밀번호 찾기
   @PostMapping(value = "/mmSearchPw")
   public ModelAndView mmSearchPw(@ModelAttribute Member mb) {
      mav = mm.mmSearchPw(mb);
      return mav;
   }

   // 비밀번호 변경
   @PostMapping(value = "/mmResetPw")
   public ModelAndView mmResetPw(@ModelAttribute Member mb) {
      mav = mm.mmResetPw(mb);
      return mav;
   }
   
   // 휴대폰 인증 이동
   @RequestMapping(value = "/mmPhoneCheckMv", method = RequestMethod.GET)
   public String mmPhoneCheckMv() {
      return "member/phoneCertification";
   }
   
   // 휴대폰 인증
   @RequestMapping(value = "/mmPhoneCheck",  method = RequestMethod.GET)
   @ResponseBody
   public String sendSMS(@RequestParam("m_phoneNum") String userPhoneNumber) { // 휴대폰 문자보내기
      int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
      System.out.println(randomNumber);
      mm.mmCertifiedPhoneNumber(userPhoneNumber,randomNumber);
      
      return Integer.toString(randomNumber);
   }

//   (공통회원)---------------------------------------------------------------------------------------------------------------------

   // 로그아웃
   @RequestMapping(value = "/cmLogout", method = RequestMethod.GET)
   public ModelAndView cmLogout(HttpSession session) {
      mav = mm.cmLogout(session);
      return mav;
   }

   // 마이페이지 이동
   @RequestMapping(value = "/cmMyPageMv", method = RequestMethod.GET)
   public ModelAndView cmMyPageMv(HttpSession session) {
      mav = mm.cmMyPageMv(session);
      return mav;
   }

   // 회원정보수정 전 로그인 페이지 이동
   @RequestMapping(value = "/cmMyInfoLoginMv", method = RequestMethod.GET)
   public String cmMyInfoLoginMv() {
      return "member/cm/myInfoLogin";
   }

   // 회원정보수정 전 로그인
   @PostMapping(value = "/cmMyInfoLogin")
   public ModelAndView cmMyInfoLogin(@ModelAttribute Member mb, HttpSession session) {
      mav = mm.cmMyInfoLogin(mb, session);
      return mav;
   }

   // 회원정보수정
   @PostMapping(value = "/cmMyInfoUpdate")
   public ModelAndView cmMyInfoUpdate(@ModelAttribute Member mb, HttpSession session) {
      mav = mm.cmMyInfoUpdate(mb, session);
      return mav;
   }

   // 마이페이지 비밀번호 변경 페이지 이동
   @RequestMapping(value = "/cmMyInfoPwUpdateMv", method = RequestMethod.GET)
   public String cmMyInfoPwUpdateMv() {
      return "member/cm/myInfoPwUpdate";
   }

   // 마이페이지 비밀번호 변경
   @PostMapping(value = "/cmMyInfoPwUpdate")
   public ModelAndView cmMyInfoPwUpdate(@ModelAttribute Member mb, HttpSession session) {
      mav = mm.cmMyInfoPwUpdate(mb, session);
      return mav;
   }

   // 마이페이지 회원탈퇴 페이지 이동
   @RequestMapping(value = "/cmMyInfoDeleteMv", method = RequestMethod.GET)
   public String cmMyInfoDeleteMv() {
      return "member/cm/myInfoDelete";
   }

   // 마이페이지 회원탈퇴
   @PostMapping(value = "/cmMyInfoDelete")
   public ModelAndView cmMyInfoDelete(@ModelAttribute Member mb, @ModelAttribute Withdrawal wd, HttpSession session) {
      mav = mm.cmMyInfoDelete(mb, wd, session);
      return mav;
   }

   // 내캐시충전 페이지 이동
   @RequestMapping(value = "/cmCashChargeMv", method = RequestMethod.GET)
   public ModelAndView cmCashChargeMv(HttpSession session) {
      mav = mm.cmCashChargeMv(session);
      System.out.println("mmCon: " + mav);
      return mav;
   }

   
   //카카오페이
   @RequestMapping(value = "/cmKakaoPay", method = RequestMethod.POST)
   public ModelAndView cmKakaoPay(@ModelAttribute Member mb, HttpSession session) {
	  System.out.println("kakaoCon: "+ mb);
      mav = mm.cmKakaoPay(mb,session);
      System.out.println("kakaoMav: "+ mav);
      return mav;
   }
   
   
   // 관리자 계정
   @RequestMapping(value = "/amGetMemberinfo" , method = RequestMethod.GET , produces = "application/json;charset=utf-8")
   public ModelAndView amGetMemberinfo() {
      System.out.println("컨트롤러 관리자 계정 멤버 정보 ");
      mav = mm.amGetMemberinfo();
      return mav;
   }
   
   @RequestMapping(value = "/amGetMemberinfoMv", method = RequestMethod.GET)
   public String amGetMemberinfoMv() {
      return "member/am/MemberInfo";
   }
   
   
   @RequestMapping(value = "/amGetBbList", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
   public ModelAndView bbList(@Nullable Integer pageNum) {
      System.out.println("CONSOLE");
      mav = mm.getBbList(pageNum);
      return mav;
   }

   @RequestMapping(value = "/amGetTsbList", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
   public ModelAndView tsbList(@Nullable Integer pageNum) {
      System.out.println("CONSOLE");
      mav = mm.getTsbList(pageNum);
      return mav;
   }



}