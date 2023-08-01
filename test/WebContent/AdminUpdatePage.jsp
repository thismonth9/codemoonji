<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 			
	MemberDao memberDao = new MemberDao();
    String id = request.getParameter("id");
    MemberDto memberDto = memberDao.select2(id);
 %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/UpdatePage.css">
</head>
<body>
    <div class="update-container">
        <div class="update-header">
            회원관리-수정관리자
        </div>
        <div class="update-content">
            <form action="UpdateAction.jsp" method="post">
                <div class="input-container">
                    <label for="id">ID:</label>
                    <input type="text" id="id" name="id" value="<%= memberDto.getId() %>" readonly>
                </div>
                <div class="input-container">
                    <label for="password">PW:</label>
                   	<input type="text" id="password" name="pw" value="<%= memberDto.getPw() %>" required>
                </div>
                <div class="input-container">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= memberDto.getName() %>" required>
                </div>
                <div class="input-container">
                    <label for="point">Point:</label>
                    <input type="number" id="point" name="point" value="<%= memberDto.getPoint() %>" required>
                </div>
                <input type="submit" value="제출">
            </form>
        </div>
    </div>
</body>
</html>