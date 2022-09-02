<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> myInfoLogin.jsp(공통) </h1>
<a href="main">홈으로</a>
<a href="cmLogout">로그아웃</a>

<form name="cmMyInfoLoginFrm" action="cmMyInfoLogin" method="post">
	<input type="text" name="m_pw">
	<input type="submit" value="확인">
</form>
</body>
</html>