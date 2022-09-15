<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page --> feedback</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	${msg}

	<div class="headcontainer">
		<select name="FbReqSort" id="FbReqSort" class="FbReqListSort">
			<option value="선택없음" selected="selected">선택 없음</option>
			<option value="요청">요청</option>
			<option value="대기">대기</option>
			<option value="답변완료">답변완료</option>
		</select>
	</div>
	<div id="gmFeedbackList" class="container">
		<table class="rwd-table">
			<tr height="30">
				<th width="100">요청일자</th>
				<th width="100">제목</th>
				<th width="100">요청 내용</th>
				<th width="100">요청 현황</th>

				<!--  			<th width="100">조회수</th>  -->
			</tr>
			<c:forEach var="FbBoard" items="${gmFeedbackList}">
				<tr height="25">
					<td align="center">${FbBoard.fb_req_date}</td>
					<td align="center"><a href="#"
						onclick="fbView(${FbBoard.fb_postNum})">${FbBoard.fb_req_title}</a></td>
					<td align="center">${FbBoard.fb_req_contents}</td>
					<td align="center">${FbBoard.fb_check}</td>

				</tr>
			</c:forEach>

		</table>
		<h3>${FbPaging}</h3>
	</div>
	<form action="gmFbReqWriteFrm">
		<button class="wsbWrite-button">피드백 요청</button>
	</form>
	<a href="gmFeedbackAccountReqMv">피드백계정 신청</a>


	<script type="text/javascript">

$('.FbReqListSort').on('change' ,function () {
	console.log($('#FbReqSort').val());
	
	if ($('#FbReqSort').val() == "선택없음") {
		var fb_check =5 ;
	}
	else if ($('#FbReqSort').val() == "요청") {
		var fb_check = 1 ; 
	}
	else if ($('#FbReqSort').val() == "대기") {
		var fb_check = 2;
	}
	else if($('#FbReqSort').val() == "답변완료")  {
		var fb_check = 3 ;
	}
	
	   console.log(fb_check);

   $.ajax({
	   type:'get',
	   url:'gmFeedbackList',
	   data : {'fb_check' : fb_check},
	   dataType: 'html',
   }).done((data)=>{$("#gmFeedbackList").html(data);})
   .fail((err)=>console.log(err));
	  	   
});


</script>

</body>
</html>