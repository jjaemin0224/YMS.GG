<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>login.jsp</h1>
<form name="mmLoginFrm" action="mmLogin" method="post">

	아이디 : <input type="text" id="m_id" name="m_id"> <br>
	비밀번호 : <input type="text" id="m_pw" name="m_pw"> <br>
	<input type="submit" value="로그인"> <br>
</form>

<a href="mmSearchIdMv">아이디찾기</a>
<a href="mmSearchPwMv">비밀번호찾기</a>

</body>
</html>