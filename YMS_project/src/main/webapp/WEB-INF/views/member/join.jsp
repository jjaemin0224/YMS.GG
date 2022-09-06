<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

html {
  height: 100%;
}
body {
  margin:0;
  padding:0;
  font-family: sans-serif;
  background: linear-gradient(#252a37,#252a37);
}

.login-box {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: rgba(27, 27, 27, 0.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}

.login-box .user-box {
  position: relative;
}

.login-box .user-box input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #fff;
  outline: none;
  background: transparent;
}
.login-box .user-box label {
  position: absolute;
  top:0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  pointer-events: none;
  transition: .5s;
}

.login-box .user-box input:focus ~ label,
.login-box .user-box input:valid ~ label {
  top: -20px;
  left: 0;
  color: #03e9f4;
  font-size: 12px;
}


.button {
  border: none;
  background: transparent;
  cursor: pointer;
}
.button:not(:last-child) {
  margin-bottom: 2rem;
}

.button {
  border: none;
  background: transparent;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0.8rem 2rem;
  overflow: hidden;
  border-radius: 100vmax;
  box-shadow: var(--shadow-elevation-high);
  transition: box-shadow 0.2s ease-in-out;
}
.button::after, .button::before {
  content: "";
  position: absolute;
  inset: 0;
  background-color: red;
}
.button::before {
  z-index: 1;
  right: -100%;
  background: linear-gradient(to right, #9900F0 0%, #FF85B3 50%, #9900F0 100%);
  background-size: 50% 100%;
  -webkit-animation: scroll 1.2s infinite linear;
          animation: scroll 1.2s infinite linear;
}
.button::after {
  z-index: 2;
  inset: 5px;
  border-radius: 100vmax;
  background-color: black;
  transition: inset 0.2s ease-in-out;
}
.button span {
  z-index: 3;
  color: white;
  text-transform: uppercase;
}
.button:hover {
  box-shadow: var(--shadow-elevation-medium);
}
.button:hover::after {
  inset: 8px;
}

p {
  font-weight: 500;
  font-size: 14px;
  line-height: 1.7;
}


</style>

<body>
<a href="main"><img src="resources/img/yms.png" style = "width:200px; height:200px"></a>

	<div class="login-box">
		<form name="mmJoinFrm" action="mmJoin" method="post">
			<div class="user-box">
				<input type="text" id="m_id" name="m_id" required=""> <label>아이디</label>
			</div>
			<div class="user-box">
				<input type="password" id="m_pw" name="m_pw" required=""> <label>비밀번호</label>
			</div>
			<div class="user-box">
				<input type="password" id="" name="" required=""> <label>비밀번호확인</label>
			</div>
			<div class="user-box">
				<input type="text" id="m_name" name="m_name" required=""> <label>이름</label>
			</div>
			<div class="user-box">
				<input type="text" id="m_summonerName" name="m_summonerName" required=""> <label>소환사 닉네임</label>
			</div>
			<div class="user-box">
				<input type="text" id="m_email" name="m_email" required=""> <label>이메일</label>
			</div>
			<div class="user-box">
				<input type="date" id="m_birth" name="m_birth"  required=""> <label>생년월일</label>
			</div>
			<div class="user-box">
				<input type="text" id="m_phoneNum" name="m_phoneNum" required=""> <label>전화번호</label>
			</div>
			
			<div class="buttons">
        <button class="button" type="submit">
          <span>회원가입</span>
        </button>
			</div>

		</form>
	</div>

</body>
</html>