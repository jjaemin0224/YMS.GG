<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피드백 요청 글 상세 보기 & 피드백 답변</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<div>
		글번호 : ${WriteFb.fb_postNum} <br> <br> 피드백 요청자 :
		${WriteFb.fb_req_id} <br> <br> 제목 : ${WriteFb.fb_req_title}
		<br> <br> 요청자 소환사명 : ${WriteFb.fb_req_summonerName} <br>
		<br> 요청자 받고자하는 게임 : ${WriteFb.fb_req_gameId} <br> <br>
		요청 내용 : ${WriteFb.fb_req_contents} <br> <br> <br> <br>
		<br> <br> 요청 날짜 : ${WriteFb.fb_req_date} <br> <br>
		<br>
	</div>

	<div class="login-box">
		<h2>피드백 답변하기</h2>
		<table class="content-from">
			<tr>

				<td></td>
				<td></td>
				<td></td>
				<td><button type="button" class="small_button" id="fbWriteBt"
						name="fbWriteBt">
						<span>답변하기</span>
					</button></td>
				<td><button type="button"
						onclick="location.href='./fmAcceptFbList'" class="small_button">
						<span>수락한 피드백 목록</span>

					</button></td>
			</tr>
			<tr>
				<td colspan="3"><textarea name="fb_ans_contents"
						id="fb_ans_contents" cols="105" rows="20" placeholder="내용"
						class="content-box"></textarea></td>
			</tr>
		</table>
	</div>




	<script type="text/javascript">
	$('#fbWriteBt').click(function () {
			let obj = {};
			var fb_postNum = ${WriteFb.fb_postNum};
			var fb_ans_contents = $('#fb_ans_contents').val();
			console.log(fb_postNum);
			console.log(fb_ans_contents);
			$.ajax({
				method : 'post', //json넘길시 post
				url : 'feedbackWrite',
				data : {"fb_postNum" : fb_postNum , "fb_ans_contents" : fb_ans_contents},
				success : function(data) {
					location.href="fmAcceptFbList";
					console.log(data);
					
					},
				error : function(err) {
					console.log(err);
				}
			}); //ajax End	 
		}//
		);
	</script>
</body>
</html>