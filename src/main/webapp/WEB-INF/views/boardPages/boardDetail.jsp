<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <h2>boardDetail.jsp</h2>
    <div id="section">
        <table>
            <tr>
                <th>id</th>
                <th>작성자</th>
                <th>글비밀번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성시간</th>
                <th>조회수</th>
                <th>첨부파일</th>
                <th>삭제</th>
            </tr>
            <tr>
                <td>${board.id}</td>
                <td>${board.boardWriter}</td>
                <td>${board.boardPass}</td>
                <td>${board.boardTitle}</td>
                <td>${board.boardContents}</td>
<%--                <td>${board.boardCreatedDate}</td>--%>
                <td><fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                <td>${board.boardHits}</td>
                <td>${board.fileAttached}</td>
<%--                <td><button onclick="board_delete('${board.id}')">삭제</button></td>--%>
            </tr>
        </table>
        <button onclick="board_list()">목록</button>
        <button onclick="board_update()">수정</button>
        <button onclick="board_delete('${board.id}')">삭제</button>
    </div>
<%@include file="../component/footer.jsp" %>
</body>
<script>
    const board_list = () => {
        location.href = "/board/";
    }
    const board_update = () => {
        const id = '${board.id}';
        location.href = "/board/update?id="+id;
    }
    const board_delete = (id) => {
        location.href = "/board/delete-check?id="+id;
    }
</script>
</html>
