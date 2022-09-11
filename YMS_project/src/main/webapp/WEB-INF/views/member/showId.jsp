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
html {
  height: 100%;
}
body {
  margin:0;
  padding:0;
  font-family: 'Nanum Pen Script';
  font-size:25px;	
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
  font-size: 25px;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}

.button {
  border: none;
  background: transparent;
  cursor: pointer;
  font-family: 'Nanum Pen Script';
  font-size: 25px;
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
</style>

<body>

	<a href="main"><img src="resources/img/yms.png"	style="width: 200px; height: 200px"></a>


	<div class="login-box">
		<h2>아이디는 ${searchedId}입니다.</h2>
		<form name="mmLoginFrm" action="mmLogin" method="post">
			<div class="buttons">
				<button onclick = "location.href='mmLoginMv'" class="button" type="button">
					<span>로그인 하기</span>
				</button> 
				<p><a href="mmSearchPwMv" style="color: #fff">비밀번호찾기</a></p>
			</div>
		</form>
	</div>

</body>
</html>