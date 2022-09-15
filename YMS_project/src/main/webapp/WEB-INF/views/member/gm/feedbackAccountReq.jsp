<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<h1>feedbackAccountReq.jsp</h1>
	<form id="gmFeedbackAccountReq" name="gmFeedbackAccountReqFrm" action="gmFeedbackAccountReq" method="post">

		<table>
			<tr>
				<td colspan="3"><textarea name="fba_portfolio" cols="105"
						rows="20" placeholder="내용" class="content-box"></textarea></td>
				
				<td><button id="feedbackAccBtn" type="button" class="small_button">
                    <span>신청</span> </button> </td>
			</tr>
			

		</table>

	</form>
<script type="text/javascript">
$("#feedbackAccBtn").click(function() {
	alert("피드백 계정 신청을 하시겠습니까?")
	$("#gmFeedbackAccountReq").submit();
	location.href="cmMyPageMv";
	
});

</script>
</body>
</html>