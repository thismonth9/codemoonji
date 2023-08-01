<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    int point = Integer.parseInt(request.getParameter("point"));

    MemberDao memberDao = new MemberDao();
    memberDao.decreasePoint(id, point);

    // 감소된 포인트를 다시 읽어오기 위해 MemberDto를 가져옴
    MemberDto listDto = memberDao.select2(id);

    // 포인트가 감소된 후 다시 메인 페이지로 리다이렉트
    response.sendRedirect("MainPage.jsp");
%>