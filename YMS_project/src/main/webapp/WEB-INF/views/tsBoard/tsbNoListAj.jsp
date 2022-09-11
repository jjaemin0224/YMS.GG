<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table>
	<thead>
		<tr height="30">
			<th width="100">번호</th>
			<th width="100">제목</th>
			<th width="100">작성자</th>
			<th width="100">플레이 시간</th>
			<th width="100">티어</th>
			<th width="100">큐</th>
			<th width="100">라인</th>
			<th width="100">작성 시간 </th>
<!--  			<th width="100">조회수</th>  -->
		</tr>
	</thead>
	<tbody>
		

		<tr>
			<td>
			<form action = "tsbWriteFrm">
			<button>글작성</button>
			</form>
			</td>
		</tr>
		
	</tbody>
		
		<tfoot class="tsbPaging">
			<tr>
				<td></td>
				<td></td>
				<td>${tsbPaging}</td>
			</tr>
		</tfoot>

	</table>
</body>
</html>