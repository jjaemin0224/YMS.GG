<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<h1>일반회원 피드백페이지(member/gm/feedback.jsp)</h1>

<div id="gmFeedbackList"></div>

<a href="gmFeedbackReqMv">피드백요청</a>
<a href="gmFeedbackAccountReqMv">피드백계정 신청</a>

<script type="text/javascript">
	$(function(){
		Aj('gmFeedbackList', '#gmFeedbackList')
	})
	
	function Aj(url, position){
		$.ajax({ 
			url: url,
			type: 'get',
			dataType: 'html',
		}).done((data)=>{$(position).html(data);})
		  	.fail((err)=>console.log(err));
	} //Aj End
	
	

</script>

</body>
</html>