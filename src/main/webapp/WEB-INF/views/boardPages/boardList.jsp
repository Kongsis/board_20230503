<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
  <div id="section">
    <table>
      <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성시간</th>
        <th>조회수</th>
      </tr>
      <c:forEach items="${boardList}" var="board">
        <tr>
          <td>${board.id}</td>
          <td><a href="/board?id=${board.id}">${board.boardTitle}</a></td>
          <td>${board.boardWriter}</td>
<%--          <td>${board.boardCreatedDate}</td>--%>
          <td><fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
          <td>${board.boardHits}</td>
        </tr>
      </c:forEach>
    </table>
  </div>
<%@include file="../component/footer.jsp" %>
</body>
<script>

</script>
</html>