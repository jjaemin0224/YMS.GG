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
<h1>feedbackConfirmView</h1>

<form id="gmFeedbackConfirmView" method = post >
<table>
		<tr>
			<th>신청 번호</th> 
			<th>${fa.fba_postnum}</th>		
		</tr>
		<tr>
			<th>신청자</th>
			<th>${fa.fba_id}</th>
		</tr>
		<tr>
			<th>신청 날짜</th>
			<th>${fa.fba_date}</th>
		</tr>
		<tr>		
			<td colspan="2">
			<td>내용:  ${fa.fba_portfolio} </td>
		</tr>
</table>

<input id="update" type="button" value="수락" >
<input id="delete" type="button" value="거절">

 </form>
 
 <script type="text/javascript">

 $("#update").click(function() {
	 var fab_postnum = ${fa.fba_postnum};
	 alert("피드백 계정을 수락하시겠습니까?");
	 $.ajax({
		 	type : "POST",
			url : "gmFeedbackTransUpdate?fba_postnum=" + fab_postnum,
			data : fab_postnum,
			success : function(data){
				console.log("1 success");
				alert("피드백 계정 신청이 수락되었습니다.");
				location.href="gmFeedbackConfirmMv";
			}
		});
 });
 
 $("#delete").click(function() {
	 var fab_postnum = ${fa.fba_postnum};
	 alert("피드백 계정을 거절하시겠습니까?");
	 $.ajax({
		 	type : "POST",
			url : "gmFeedbackTransDelete?fba_postnum=" + fab_postnum,
			data : fab_postnum,
			success : function(data){
				alert("피드백 계정 신청이 거절되었습니다.");
				location.href="gmFeedbackConfirmMv";
			}
		});
 });
	</script>

</body>
</html>