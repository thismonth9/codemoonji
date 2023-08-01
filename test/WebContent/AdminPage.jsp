<%@page import="java.util.ArrayList"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <link rel="stylesheet" href="css/AdminPage.css">
    <script src="js/jquery-3.7.0.min.js"></script>
	<script>
		$(function() {
			$("#login-btn").click(function() {
				location.href="Login.jsp";
			});
		   	 $(".edit-btn").click(function() {
		   		var idText = $(this).closest("tr").find(".id").text();
		   		 location.href= "AdminUpdatePage.jsp?id="+idText;
		   	 });
		   	$(".delete-btn").click(function() {
		   		var idText = $(this).closest("tr").find(".id").text();
		   		 location.href= "DeleteAction.jsp?id="+idText;
		   	 });
		   	$(".scheduler-btn").click(function() {
		   		
		   	});
		});
	</script>
</head>
<body>
 <div class="admin-container">
        <div class="admin-header">
            <div class="admin-title">회원 관리</div>
            <button id="login-btn">로그인</button>
        </div>
        <div class="admin-content">
            <table class="user-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>PW</th>
                        <th>Name</th>
                        <th>Point</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                	<% MemberDao memberDao = new MemberDao();
                    ArrayList<MemberDto> memberList = memberDao.select1();
                    for (MemberDto member : memberList) {
                	 %>
                    <tr>
                        <td class="id"><%=member.getId() %></td>
                        <td><%=member.getPw() %></td>
                        <td><%=member.getName() %></td>
                        <td><%=member.getPoint() %></td>
                        <td><button class="edit-btn">수정</button></td>
                        <td><button class="delete-btn">삭제</button></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
        <div class="scheduler-container">
            <button id="start-scheduler-btn" class="scheduler-btn">스케줄러 실행 시작</button>
            <button id="stop-scheduler-btn" class="scheduler-btn">스케줄러 실행 종료</button>
        </div>
    </div>
</body>
</html>