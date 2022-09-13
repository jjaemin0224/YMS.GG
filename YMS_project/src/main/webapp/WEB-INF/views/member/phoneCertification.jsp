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

<body>
	<div class="login-box">
		<form name="mmPhoneCertificationFrm" action="mmPhoneCheck" method ="get">
			<input id="m_phoneNum" type="text" name="m_phoneNum" title="전화번호 입력" required/>
			<button id="phoneChk" type="button" class="button">인증번호 보내기</button><br/>
			<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/>
			<button id="phoneChk2" type="button" class="button">본인인증</button> <br>
			<span class="successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
			<input type="hidden" id="phoneDoubleChk"/>
		</form>
	</div>
<script type="text/javascript">
var code2 = "";
$("#phoneChk").click(function(){
	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
	var phone = $("#m_phoneNum").val();
	$.ajax({
        type:"GET",
        url:"mmPhoneCheck?m_phoneNum=" + phone,
        cache : false,
        success:function(data){
        	if(data == "error"){
        		alert("휴대폰 번호가 올바르지 않습니다.")
				$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
				$(".successPhoneChk").css("color","red");
				$("#m_phoneNum").attr("autofocus",true);
        	}else{	        		
        		$("#phone2").attr("disabled",false);
        		$("#phoneChk2").css("display","inline-block");
        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
        		$(".successPhoneChk").css("color","green");
        		$("#m_phoneNum").attr("readonly",true);
        		code2 = data;
        	}
        }
    });
});

$("#phoneChk2").click(function(){
	if($("#phone2").val() == code2){
		alert("인증번호가 일치합니다.");
		$(".successPhoneChk").css("color","green");
		$("#phoneDoubleChk").val("true");
		$("#phone2").attr("disabled",true);
		history.back();
	}else{
		$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".successPhoneChk").css("color","red");
		$("#phoneDoubleChk").val("false");
		$(this).attr("autofocus",true);
	}
});
</script>
</body>
</html>