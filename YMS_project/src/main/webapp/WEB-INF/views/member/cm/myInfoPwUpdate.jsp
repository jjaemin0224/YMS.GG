<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>myInfoPwUpdate.jsp</h1>
<a href="main">홈으로</a>
<a href="cmLogout">로그아웃</a>

<form name="cmMyInfoPwUpdateFrm" action="cmMyInfoPwUpdate" method="post">
	현재 비밀번호 입력 : <input type="password"> <br>
	변경 비밀번호 입력 : <input type="password" name="m_pw"> <br>
	변경 비밀번호 확인 : <input type="password"> <br>
	<input type="submit" value="확인">
</form>
</body>
</html>