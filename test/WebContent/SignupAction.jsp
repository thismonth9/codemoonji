<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    int point = Integer.parseInt(request.getParameter("point"));
    
    MemberDao sign = new MemberDao();
    sign.signup(id, pw, name, point);
%>
<script>
	alert("가입되었습니다. 로그인 해주세요")
	location.href ="Login.jsp";
</script>
