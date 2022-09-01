<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>resetPw.jsp</h1>
<form name="mmResetPwFrm" action="mmResetPw" method="post">
	아이디 : <input type="text" id="m_id" name="m_id" value="${searchedId}"> <br>
	비밀번호 : <input type="text" id="m_pw" name="m_pw"> <br>
	<input type="submit" value="비밀번호 재설정">
</form>
</body>
</html>