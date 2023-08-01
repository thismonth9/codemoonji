<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String password = request.getParameter("pw");
    String name = request.getParameter("name");
    int point = Integer.parseInt(request.getParameter("point"));

    MemberDao memberDao = new MemberDao();
    MemberDto memberDto = new MemberDto(id, password, name, point);
    memberDao.update(memberDto);
%>
<script>
	alert("수정되었습니다.");
	location.href="AdminPage.jsp";
</script>
    