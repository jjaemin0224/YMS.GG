<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>
		<form name="mmPhoneCertificationFrm" action="mmPhoneCheck" method ="get">
			<input id="m_phoneNum" type="text" name="m_phoneNum" title="전화번호 입력" required/>
			<button id="phoneChk" type="button" class="doubleChk">인증번호 보내기</button><br/>
			<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/>
			<button id="phoneChk2" type="button" class="doubleChk">본인인증</button> <br>
			<span class="successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
			<input type="hidden" id="phoneDoubleChk"/>
		</form>

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