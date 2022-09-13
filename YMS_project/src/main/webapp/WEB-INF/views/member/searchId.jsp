<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
* {font-family: 'Nanum Pen Script';}

html {
	height: 100%;

}

body {
	margin: 0;
	padding: 0;
	font-family: 'Nanum Pen Script';
	font-size:20px;
	background: linear-gradient(#252a37, #252a37);
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
	box-shadow: 0 15px 25px rgba(0, 0, 0, .6);
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
	font-size: 20px;
	color: #fff;
	margin-bottom: 30px;
	border: none;
	border-bottom: 1px solid #fff;
	outline: none;
	background: transparent;
}

.login-box .user-box label {
	position: absolute;
	top: 0;
	left: 0;
	padding: 10px 0;
	font-size: 20	px;
	color: #fff;
	pointer-events: none;
	transition: .5s;
}

.login-box .user-box input:focus ~ label, .login-box .user-box input:valid 
	~ label {
	top: -25px;
	left: 0;
	color: #03e9f4;
	font-size: 20px;
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
	box-shadow: var(- -shadow-elevation-high);
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
	font-size:20px;
}

.button:hover {
	box-shadow: var(- -shadow-elevation-medium);
}

.button:hover::after {
	inset: 8px;
}
</style>

<a href="main"><img src="resources/img/yms.png" style="width: 200px; height: 200px"></a>

<body>

	<div class="login-box">
		<h2>아이디 찾기</h2>
		<form name="mmSearchIdFrm" action="mmSearchId" method="post">
			<div class="user-box">
				<input type="text" id="m_name" name="m_name" required=""> <label>이름</label>
			</div>
			<div class="user-box">
				<input type="text" id="m_birth" name="m_birth" required=""> <label>생년월일(6자리)</label>
			</div>
			<div class="user-box">
				<input type="text" id="m_phoneNum" name="m_phoneNum" required=""> <label>핸드폰 번호</label>
			</div>
			<div class="buttons">
				<button class="button" type="submit">
					<span>아이디 찾기</span>
				</button>
			</div>
		</form>
	</div>


</body>
</html>