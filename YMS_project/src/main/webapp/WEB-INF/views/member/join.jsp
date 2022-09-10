<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
				<button type="button" id="m_idCheck">ID중복체크</button>
				<span id="m_idCheckMsg"></span>
			</div>
			<div class="user-box">
				<input type="password" id="m_pw" name="m_pw" class="pw" required=""> <label>비밀번호</label>
				<button type="button" id="m_pwCheck">비밀번호 확인</button>
				<span id="m_pwCheckMsg"></span>
			</div>
			<div class="user-box">
				<input type="password" id="m_pwCheck2" name="m_pwCheck2" class="pw" required=""> <label>비밀번호확인</label>
				<span id="m_pwCheckMsg2"></span>
			</div>
			<div class="user-box">
				<input type="text" id="m_name" name="m_name" required=""> <label>이름</label>
				<span id="m_nameCheckMsg"></span>
			</div>
			<div class="user-box">
				<input type="text" id="m_summonerName" name="m_summonerName" required=""> <label>소환사 닉네임</label>
				<span id="m_summonerNameCheckMsg"></span>
			</div>
			<div class="user-box">
				<input type="text" id="m_email" name="m_email" required=""> <label>이메일</label>
				<span id="m_emailCheckMsg"></span>
			</div>
			<div class="user-box">
				<input type="date" id="m_birth" name="m_birth"  required=""> <label>생년월일</label>
				<span id="m_birthCheckMsg"></span>
			</div>
			<div class="user-box">
				<input type="text" id="m_phoneNum" name="m_phoneNum" required=""> <label>전화번호</label>
				<a href="mmPhoneCheckMv">휴대폰 인증</a>
				<span id="m_phoneNumCheckMsg"></span>
			</div>
			
			<div class="buttons">
        <button id="joinBtn" class="button" type="submit">
          <span>회원가입</span>
        </button>
			</div>

		</form>
	</div>
<script type="text/javascript">
/* 아이디 중복체크 */
$("#m_idCheck").click(function() {
	$.ajax({
		url : "mmIdCheck",
		type : "get",
		async: false,
		data : {"m_id" : $("#m_id").val()},
		success : function(data){
			if(data == "1"){
				$("#m_idCheckMsg").text("중복된 아이디입니다.");
				 $("#m_idCheckMsg").css("color","red");
			}else if(data == "0"){
				$("#m_idCheckMsg").text("사용 가능한 아이디입니다.");
				 $("#m_idCheckMsg").css("color","green");
			}
		}
	})
});

//비밀번호 체크
$("#m_pwCheck").click(function() {
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
	  return true;
	 }
});

//비밀번호 확인
 $('.pw').focusout(function(){   
	var m_pw = $('#m_pw').val();
	var m_pwCheck2 = $('#m_pwCheck2').val();
	if ( m_pw != '' && m_pwCheck2 == '' ) {
        null;
	}else if (m_pw != "" || m_pwCheck2 != "") {
        if (m_pw == m_pwCheck2) {
        	$("#m_pwCheckMsg2").text("비밀번호가 일치합니다.");
   			$("#m_pwCheckMsg2").css("color","green");
        } else {
        	$("#m_pwCheckMsg2").text("비밀번호가 일치하지 않습니다.");
   			$("#m_pwCheckMsg2").css("color","red");
        }
    }
});

//이메일 정규식 체크
var userid = document.querySelector('#m_email')
userid.addEventListener('change',(e)=>{  
    validEmail(e.target)
})

function validEmail(obj){
    console.log(obj)
    if(validEmailCheck(obj)==false){
    	$("#m_emailCheckMsg").text("올바른 이메일 주소를 입력해주세요.");
		$("#m_emailCheckMsg").css("color","red");
        obj.value='';
        obj.focus();
        return false;
    }else{
    	$("#m_emailCheckMsg").text("올바른 이메일 주소입니다.");
		$("#m_emailCheckMsg").css("color","green");
    }
}

function validEmailCheck(obj){
    var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    return (obj.value.match(pattern)!=null)
}


</script>
</body>
</html>