<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>join.jsp</h1>
<form name="mmJoinFrm" action="mmJoin" method="post">

	아이디 : <input type="text" id="m_id" name="m_id"> <br>
	비밀번호 : <input type="text" id="m_pw" name="m_pw"> <br>
 	이름 : <input type="text" id="m_name" name="m_name"> <br>
	소환사명 : <input type="text" id="m_summonerName" name="m_summonerName"> <br>
	이메일 : <input type="text" id="m_email" name="m_email"> <br>
	생일 : <input type="text" id="m_birth" name="m_birth"> <br>
	전화번호 : <input type="text" id="m_phoneNum" name="m_phoneNum"> <br>
	<input type="submit" value="회원가입"> <br>
</form>

</body>
</html>