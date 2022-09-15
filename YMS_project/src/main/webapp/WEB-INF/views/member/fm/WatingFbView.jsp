<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피드백 요청 글 상세 보기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<div>
	글번호 : ${watingFb.fb_postNum}
	<br>
	<br> 피드백 요청자 : ${watingFb.fb_req_id}
	<br>
	<br> 제목 : ${watingFb.fb_req_title}
	<br>
	<br> 요청자 소환사명 : ${watingFb.fb_req_summonerName}
	<br>
	<br> 요청자 받고자하는 게임 : ${watingFb.fb_req_gameId}
	<br>
	<br> 요청 내용 : ${watingFb.fb_req_contents}
	<br>
	<br>
	<br>
	<br>
	<br>
	<br> 요청 날짜 : ${watingFb.fb_req_date}
	<br>
	<br>
	<br>
	<div class = "FbAccept" id = "FbAccept"> 
	<button class="FbAcceptBt" id = "FbAcceptBt">피드백 요청 수락</button>
	</div>
</div>
	
	<script type = "text/javascript">
		var fbAcceptPostNum = ${watingFb.fb_postNum};
		$('.FbAcceptBt').click(function(){
			$.ajax({
				type : 'post',
				url : 'FbAccept',
				data : { "fb_postNum" :fbAcceptPostNum},
				success : function (data){
					console.log (" 수락 성공 ! ");
					location.href="fmWaitingFbList";
				},error : function (err) {
					console.log(err);
				}
			}); // ajax end
		});
		
	</script>
	
	

</body>
</html>