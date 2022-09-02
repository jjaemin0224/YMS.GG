<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>myInfoUpdate.jsp(공통)</h1>
<a href="main">홈으로</a>
<a href="cmLogout">로그아웃</a> <br>


id : ${member.m_id}  <br>
name : ${member.m_name} <br>

<form action="cmMyInfoUpdate" method="post">
	<input type="text" name="m_summonerName" value="${member.m_summonerName}">
	<input type="text" name="m_birth" value="${member.m_birth}">
	<input type="text" name="m_phoneNum" value="${member.m_phoneNum}">
	<input type="text" name="m_email" value="${member.m_email}">
	<input type="submit" value="확인">
</form>

</body>
</html>