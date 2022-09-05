<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>보드리스트</h1>
   <div id="bbBoardTable"></div>

   <table>
      <tr>
         <th>글번호</th>
         <th>작성자</th>
         <th>제목</th>
         <th>날짜</th>

      </tr>
      <c:forEach var="list" items="${bbList}">
         <tr>
            <td>${list.bb_postNum}</td>
            <td>${list.bb_id}</td>
            <td> <a href="bbBoardView?bb_postNum=${list.bb_postNum}">${list.bb_title}</a></td>
            <td>${list.bb_date}</td>
      </c:forEach>
   </table>
   ${paging}
</body>
</html>