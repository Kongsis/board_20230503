<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-04-28
  Time: 오후 2:04
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
            <th>id</th>
            <td>${board.id}</td>
        <tr>
            <th>writer</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>date</th>
            <td>
                <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
            </td>
        </tr>
        <tr>
            <th>hits</th>
            <td>${board.boardHits}</td>
        </tr>
        <tr>
            <th>title</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>contents</th>
            <td>${board.boardContents}</td>
        </tr>
        <c:if test="${board.fileAttached == 1}">
            <tr>
                <th>image</th>
                <td>
                    <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}" alt="">
                </td>
            </tr>
        </c:if>
    </table>
    <button onclick="board_list()">목록</button>
    <button onclick="board_update()">수정</button>
    <button onclick="board_delete()">삭제</button>
</div>
<%@include file="../component/footer.jsp" %>
</body>
<script>
    const board_list = () => {
        location.href = "/board/";
    }
    const board_update = () => {
        const id = '${board.id}';
        location.href = "/board/update?id=" + id;
    }
    const board_delete = () => {
        const id = '${board.id}';
        location.href = "/board/delete-check?id=" + id;
    }
</script>
</html>
