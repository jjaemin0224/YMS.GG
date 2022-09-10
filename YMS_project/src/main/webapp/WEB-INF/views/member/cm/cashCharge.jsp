<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>cashCharge.jsp(공통)</h1>
<a href="main">홈으로</a>
<a href="cmLogout">로그아웃</a>

<form name="cmCashChargeFrm" id="cmKakaoPay" action="cmKakaoPay" method="post">
	캐시 : <input id="m_cash" type="text" name="m_cash"> <br>
	<input type="button" id="cashChargeBtn" value="충전">
</form>

<script type="text/javascript">
var buyer_name = '${member.m_id}';
var buyer_email = '${member.m_email}';
var buyer_tel = '${member.m_phoneNum}';
var buyer_cash = $('#m_cash').val();
console.log(buyer_cash);
var { IMP } = window;
IMP.init('imp16447358');
$("#cashChargeBtn").click(function () {
	IMP.request_pay({
		pg : 'kakaopay',
	    pay_method : 'card',
	    name : 'yms.gg 캐시충전',
	    amount : $('#m_cash').val(),
	    buyer_email : buyer_email,
	    buyer_name : buyer_name,
	    buyer_tel : buyer_tel, 

	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '결제 금액 : ' + rsp.paid_amount +'원';
	        $("#cmKakaoPay").attr("action","cmCashCharge").submit();
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
});
</script>
</body>
</html>