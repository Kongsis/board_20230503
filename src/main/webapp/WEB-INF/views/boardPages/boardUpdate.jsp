<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
    <div id="section">
        <form action="/board/update" method="post" name="updateForm">
            <input type="text" name="id" value="${board.id}" readonly> <br>
            <input type="text" name="boardTitle" value="${board.boardTitle}"> <br>
            <input type="text" name="boardWriter" value="${board.boardWriter}" readonly> <br>
            <input type="text" name="boardPass" id="board-pass" placeholder="비밀번호를 입력하세요"> <br>
            <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea> <br>
            <input type="button" value="수정" onclick="update_req()">
        </form>
    </div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const update_req = () => {
        const passInput = document.getElementById("board-pass").value;
        const passDB = '${board.boardPass}';
        if(passInput == passDB) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다.");
        }
    }
</script>
</html>