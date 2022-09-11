<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<h3>팀원 찾기</h3>
 	<form action = "tsbWrite" id ="tsbWritefrm" method = "post"> 
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" id="tsb_title" name="tsb_title"></td>
			</tr>
			<tr>
				<td>
					<select name="tsb_que" id ="tsb_que">
						<option value="상관없음">큐상관 없음</option>
						<option value="솔로랭크">솔로랭크</option>
						<option value="자유랭크">자유랭크</option>
						<option value="일반">일반</option>
						<option value="칼바람">칼바람</option>
					</select>
				</td>
				<td>
					<select name="tsb_tier" id ="tsb_tier" >
						<option value="상관없음">티어 상관 없음</option>
						<option value="언랭">언랭</option>
						<option value="브론즈">브론즈</option>
						<option value="실버">실버</option>
						<option value="골드">골드</option>
						<option value="플래티넘">플래티넘</option>
						<option value="다이아몬드">다이아몬드</option>
						<option value="그랜드마스터">그랜드마스터</option>
						<option value="챌린저">챌린저</option>
					</select>
				</td>
				<td>
					<select name="tsb_lane" id ="tsb_lane" >
						<option value="상관없음">라인 상관 없음</option>
						<option value="탑">탑</option>
						<option value="미드">미드</option>
						<option value="정글">정글</option>
						<option value="원딜">원딜</option>
						<option value="서폿">서폿</option>
					</select>
				</td>
				<td>
					<input type="time" id = "tsb_time" name = "tsb_time">
				</td>
				<td>
					<select name="tsb_voice" id= "tsb_voice">
						<option value="사용">ON</option>
						<option value="사용 안 함">OFF</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="60" id="tsb_contents" name="tsb_contents" required></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" id ="insertBt" name ="insertBt" value="글작성">
					<input type="reset" id="reset" value="취소">
					<input type="button" onclick="location.href='./TsbList'" value="글목록"> 
				</td>
			</tr>

		</table>
 	</form>	  
<!--
	<script type="text/javascript">

	$("#insertBt").click (function formData(){
	let formData = new FormData();
	formData.append("tsb_title",$('#tsb_title').val());
	formData.append("tsb_que",$('#tsb_que').val());
	formData.append("tsb_tier",$('#tsb_tier').val());
	formData.append("tsb_lane",$('#tsb_lane').val());
	formData.append("tsb_time",$('#tsb_time').val());
	formData.append("tsb_voice",$('#tsb_voice').val());
	formData.append("tsb_contents",$('#tsb_contents').val());
	console.log(formData);
	$.ajax({
		type : 'post' , 
		url : 'tsbWrite',
		data : formData , 
		processData : false ,
		contentType : false , 
		
		dataType:'json',
		success : function(){
			console.log(data);
		},error : function(err){
			console.log(err);
		}
	});
	
	}
	);
	
	</script>
-->

</body>

</html>