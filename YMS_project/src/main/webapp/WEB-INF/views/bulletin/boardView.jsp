<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<h1>boardView.jsp</h1>

	${board.bb_postNum}
	<br> 
	${board.bb_id}
	<br> 
	${board.bb_title}
	<br> 
	${board.bb_content}
	<br> 
	${board.bb_date}
	<br> 
	${board.bb_like}
	<br>
	<table id="bReplyTable">
		<c:forEach var="list" items="${bReplyList}">
			<tr>
				<td>${list.bbr_id}</td>
				<td>${list.bbr_content}</td>
				<td>${list.bbr_date}</td>
		</c:forEach>
	</table>
	<form name="bbReplyFrm" id="bbReplyFrm">
		<table>
			<tr>
				<td><textarea rows="3" cols="50" name="bbr_content"
						id="bbr_content"></textarea></td>
				<td><input type="button" value="댓글전송"
					onclick="replyInsert(${board.bb_postNum})"></td>
			</tr>
		</table>
	</form>

	<script type="text/javascript">
		function replyInsert(bbr_postNum){
		 
			let obj = {}; 
			obj.bbr_postNum = bbr_postNum;  
		 	obj.bbr_content = $('#bbr_content').val();
			
			$.ajax({
				method:'post',  //json넘길시 post
				url: 'bbReplyInsert',
				data: JSON.stringify(obj), 		 
				contentType:'application/json; charset=UTF-8',    //서버에서 @RequestBody로 받을것.
				dataType: 'json',//xml, html... //생략 가능 서버에서 리턴타입을 결정함
				success: function(data){
					let rlist='';
					$.each(data, function(i, bbReply) {
					rlist+='<tr height="25" align="center">'
						+'<td width="100">'+bbReply.bbr_id+'</td>'
						+'<td width="200">'+bbReply.bbr_content+'</td>'
						+'<td width="200">'+bbReply.bbr_date+'</td></tr>';	
					}); 
					$('#bReplyTable').html(rlist); 
				
					$('#bbr_content').val('').focus();
				},error: function(err){
					console.log(err);
					$('#rTable').html(err.responseText); //예외 메세지 출력
				}
			}); //ajax End	 
		}//replyInsert End
</script>


</body>
</html>