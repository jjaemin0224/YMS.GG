<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap')
	;

html {
	height: 100%;
}

body {
	margin: 0;
	padding: 0;
	font-family: 'Nanum Pen Script';
	font-size: 25px;
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
	font-size: 25px;
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
	font-size: 25px;
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
	font-size: 22px;
	color: #fff;
	pointer-events: none;
	transition: .5s;
}

.login-box .user-box input:focus ~ label, .login-box .user-box input:valid 
	~ label {
	top: -20px;
	left: 0;
	color: #03e9f4;
	font-size: 18px;
}

.button {
	font-family: 'Nanum Pen Script';
	font-size: 20px;
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
}

.button:hover {
	box-shadow: var(- -shadow-elevation-medium);
}

.button:hover::after {
	inset: 8px;
}
</style>

<body>

	<a href="main"><img src="resources/img/yms.png"
		style="width: 200px; height: 200px"></a>

	<div class="login-box">
		<h2>비밀번호 재설정</h2>
		<form name="mmResetPwFrm" action="mmResetPw" method="post">
			<div class="user-box">
				<input type="text" id="m_id" name="m_id" required=""
					value="${searchedId}"> <label>Username</label>
			</div>
			<div class="user-box">
				<input type="password" id="m_pw" name="m_pw" required=""> <label>Password</label>
				<span id="m_pwCheckMsg"></span> <br>
			</div>
			비밀번호 재확인 : <input type="password" id="m_pwRe" name="m_pwRe"
				class="pw"> <br> <span id="m_pwCheckMsgRe"></span> <br>
			<div class="buttons">
				<button class="button" type="submit" id="m_pwResetBtn" disabled="disabled">
					<span>비밀번호 재설정</span>
				</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
//비밀번호 체크
$("#m_pw").focusout(function() {
    var pw = $("#m_pw").val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    if(pw.length < 8 || pw.length > 20){
     $("#m_pwCheckMsg").text("8자리 ~ 20자리 이내로 입력해주세요.");
     $("#m_pwCheckMsg").css("color","red");
     return false;
    }else if(pw.search(/\s/) != -1){
       $("#m_pwCheckMsg").text("비밀번호는 공백 없이 입력해주세요.");
       $("#m_pwCheckMsg").css("color","red");
     return false;
    }else if(num < 0 || eng < 0 || spe < 0 ){
       $("#m_pwCheckMsg").text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
       $("#m_pwCheckMsg").css("color","red");
     return false;
    }else {
       $("#m_pwCheckMsg").text("사용 가능한 비밀번호입니다.");
       $("#m_pwCheckMsg").css("color","green");
       //$("#m_pwResetBtn").attr("disabled", false)
     return true;
    }
});

//비밀번호 재확인
 $('.pw').focusout(function(){   
   var m_pw = $('#m_pw').val();
   var m_pwRe = $('#m_pwRe').val();
   if ( m_pw != '' && m_pwRe == '' ) {
        null;
   }else if (m_pw != "" || m_pwRe != "") {
        if (m_pw == m_pwRe ) {
           $("#m_pwCheckMsgRe").text("비밀번호가 일치합니다.");
            $("#m_pwCheckMsgRe").css("color","green");
            $("#m_pwResetBtn").attr("disabled", false);
        } else {
           $("#m_pwCheckMsgRe").text("비밀번호가 일치하지 않습니다.");
            $("#m_pwCheckMsgRe").css("color","red");
        }
    }
});


</script>
</body>
</html>