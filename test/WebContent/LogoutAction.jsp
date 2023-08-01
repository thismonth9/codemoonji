<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
	request.setCharacterEncoding("UTF-8");
	HttpSession sessionObj = request.getSession();
	session.invalidate();
%>
 	<script>
        alert('로그아웃 되었습니다.');
        window.location.replace('Login.jsp'); // 로그인 페이지로 리다이렉트
    </script>