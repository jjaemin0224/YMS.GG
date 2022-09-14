<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

.champMainImg{
	width: 60px;
	height: 60px;
	border-radius: 10px;
}

.champMainImg_div{
	float:left;
	margin:10px;
}

</style>
<body>
	
	<div class="champMainImg_wrapper">
		<c:forEach var="list" items="${champImgList}">
			<div class="champMainImg_div" data-code="${list.ch_img_championId}" data-lane="${lane}">
				<img class="champMainImg" src="${list.ch_img_img1}">
			</div>
		</c:forEach>
	</div>
	
	
<script type="text/javascript">
	$(".champMainImg_div").click(function() {
		var championId = String($(this).attr("data-code"));
		var lane = String($(this).attr("data-lane"));
		location.href = "caAnalysis?cc_championId=" + championId + "&cc_lane=" + lane;
	});
</script>
	
	
	
	
</body>
</html>