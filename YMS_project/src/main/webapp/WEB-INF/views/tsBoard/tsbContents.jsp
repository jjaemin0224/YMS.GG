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
	var chk = confirm("���� �����Ͻðڽ��ϱ� ? ")
	$ajax({
		url : "TsbDelete"
		type : 'POST',
		traditional : true ,
		data : :postnum,
		success : function(data){
			alert("�����Ǿ����ϴ�");
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
<!--  ������ �ۼ��� ť Ƽ�� ���� �÷��� �ð� ���̽� ���� , ������-->
		<tr height="30">
			<th width="100">����</th> <td align="center">${tsbContents.getTsb_title()}</td>
		</tr>
		<tr height="30">
			<th width="100">�ۼ���</th> <td align="center">${tsbContents.getTsb_id()}</td>
		</tr>
		<tr height="30">
			<th width="100">ť</th> <td align="center">${tsbContents.getTsb_que()}</td>
		</tr>
		<tr height="30">
			<th width="100">Ƽ��</th> <td align="center">${tsbContents.getTsb_tier()}</td>
		</tr>
		<tr height="30">
			<th width="100">����</th> <td align="center">${tsbContents.getTsb_lane()}</td>
		</tr>
		<tr height="30">
			<th width="100">�÷��̽ð�</th> <td align="center">${tsbContents.getTsb_time()}</td>
		</tr>
		<tr height="30">
			<th width="100">���̽� ����</th> <td align="center">${tsbContents.getTsb_voice()}</td>
		</tr>
		<tr height="30">
			<th width="100">�� ����</th>
		</tr>
		<tr height="100">
			<td align="center">${tsbContents.getTsb_contents()}</td>
		</tr>
		



		<tr>
			<td>
			<form action = "TsbList">
			<button>�۸��</button>
			</form>
			</td>
			<td>
			<input type="button" value="�� ����" onclick="deleteBt(${tsbContents.getTsb_postNum()})">
			</td>
		</tr>
		

	</table>
			</div>
</body>

</html>