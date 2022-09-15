<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<h1> gmFeedbackConfirm.jsp </h1>
<div id="gmFeedbackConfirmList"></div>
<script type="text/javascript">

	$(function(){
		Aj('gmFeedbackConfirmList', '#gmFeedbackConfirmList')
	})

	function Aj(url, position){
		$.ajax({ 
			url: url,
			type: 'post',
			dataType: 'html',
		}).done((data)=>{$(position).html(data);})
		  	.fail((err)=>console.log(err));
	} 
</script>
</body>
</html>