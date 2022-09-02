<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>myInfoDelete.jsp(공통)</h1>
<a href="main">홈으로</a>
<a href="cmLogout">로그아웃</a>

<form name="cmMyInfoDeleteFrm" action="cmMyInfoDelete" method="post">
	비밀번호 : <input type="password" name="m_pw"> <br>
	탈퇴사유 : <input type="text" name="wd_reason"> <br>
	<input type="submit" value="탈퇴">
</form>
</body>
</html>