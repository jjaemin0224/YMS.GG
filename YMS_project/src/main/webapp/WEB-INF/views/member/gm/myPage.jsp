<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>myPage.jsp(일반회원)</h1>
<a href="main">홈으로</a>
<a href="cmLogout">로그아웃</a> <br>

아이디 : ${member.m_id} <br>
비밀번호 : ${member.m_pw} <br>
이름 : ${member.m_name} <br>
전화번호 : ${member.m_phoneNum} <br>
생년월일 : ${member.m_birth} <br>
이메일 : ${member.m_email} <br>
소환사명 : ${member.m_summonerName} <br>
회원등급 : ${member.m_rating} <br>
캐시 : ${member.m_cash} <br>
가입날짜 : ${member.m_creationDate} <br>

<a href="cmMyInfoLoginMv">회원정보수정</a>
<a href="cmMyInfoPwUpdateMv">비밀번호변경</a>
<a href="cmMyInfoDeleteMv">회원탈퇴</a>
<a href="cmCashChargeMv">캐시충전</a>
<a href="gmFeedbackMv">내 피드백</a>


</body>
</html>