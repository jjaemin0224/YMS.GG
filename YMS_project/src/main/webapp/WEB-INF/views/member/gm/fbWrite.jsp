<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피드백 요청 작성 페이지</title>
</head>
<body>

	<form action="gmFbReqWrite" id="gmFbReqWriteFrm" method="post">
		<div class="login-box">
			<h2>피드백 요청 작성하기</h2>
			<table class="content-from">
				<tr>
					<td><input type="text" id="fb_req_title" name="fb_req_title"
						placeholder="제목" class="title-box"></td>
					<td></td>
					<td></td>
					<td></td>
					<td><button type="submit" class="small_button" id="insertBt"
							name="insertBt">
							<span>요청하기</span>
						</button></td>
					<td><button type="button" onclick="location.href='./gmFeedbackList'"
							class="small_button">
							<span>내 피드백 목록</span>
							
						</button></td>
				</tr>
				<tr>
					<td colspan="3"><textarea name="fb_req_contents" cols="105"
							rows="20" placeholder="내용" class="content-box"></textarea></td>
				</tr>
			</table>
		</div>
	</form>


</body>
</html>