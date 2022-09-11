<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr height="30">
				<th width="100">��ȣ</th>
				<th width="100">����</th>
				<th width="100">�ۼ���</th>
				<th width="100">�÷��� �ð�</th>
				<th width="100">Ƽ��</th>
				<th width="100">ť</th>
				<th width="100">����</th>
				<th width="100">�ۼ� �ð�</th>
				<!--  			<th width="100">��ȸ��</th>  -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${tsbList}">
				<tr height="25">
					<td align="center">${board.tsb_postNum}</td>
					<td align="center"><a href="#"
						onclick="articleView(${board.tsb_postNum})">${board.tsb_title}</a></td>
					<td align="center">${board.tsb_id}</td>
					<td align="center">${board.tsb_time}</td>
					<td align="center">${board.tsb_tier}</td>
					<td align="center">${board.tsb_que}</td>
					<td align="center">${board.tsb_lane}</td>
					<td align="center">${board.tsb_date}</td>
				</tr>
			</c:forEach>


			<tr>
				<td>
					<form action="tsbWriteFrm">
						<button>���ۼ�</button>
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