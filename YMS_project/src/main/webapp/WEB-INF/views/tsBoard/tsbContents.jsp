<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
function deleteBt(postnum){
	var chk = confirm("정말 삭제하시겠습니까 ? ")
	$ajax({
		url : "TsbDelete"
		type : 'POST',
		traditional : true ,
		data : :postnum,
		success : function(data){
			alert("삭제되었습니다");
			location.replace("/tsbList")
		}
		error:function(error){			
	         console.log(error);
	      }
	});
}
</script>

<div>
<table>
<!--  글제목 작성자 큐 티어 라인 플레이 시간 보이스 여부 , 컨텐츠-->
		<tr height="30">
			<th width="100">제목</th> <td align="center">${tsbContents.getTsb_title()}</td>
		</tr>
		<tr height="30">
			<th width="100">작성자</th> <td align="center">${tsbContents.getTsb_id()}</td>
		</tr>
		<tr height="30">
			<th width="100">큐</th> <td align="center">${tsbContents.getTsb_que()}</td>
		</tr>
		<tr height="30">
			<th width="100">티어</th> <td align="center">${tsbContents.getTsb_tier()}</td>
		</tr>
		<tr height="30">
			<th width="100">라인</th> <td align="center">${tsbContents.getTsb_lane()}</td>
		</tr>
		<tr height="30">
			<th width="100">플레이시간</th> <td align="center">${tsbContents.getTsb_time()}</td>
		</tr>
		<tr height="30">
			<th width="100">보이스 여부</th> <td align="center">${tsbContents.getTsb_voice()}</td>
		</tr>
		<tr height="30">
			<th width="100">글 내용</th>
		</tr>
		<tr height="100">
			<td align="center">${tsbContents.getTsb_contents()}</td>
		</tr>
		



		<tr>
			<td>
			<form action = "TsbList">
			<button>글목록</button>
			</form>
			</td>
			<td>
			<input type="button" value="글 삭제" onclick="deleteBt(${tsbContents.getTsb_postNum()})">
			</td>
		</tr>
		

	</table>
			</div>
</body>

</html>