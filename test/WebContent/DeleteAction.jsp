<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	  if ("admin".equals(id)) {%>
	<script> 
		alert("관리자 계정은 삭제할 수 없습니다.")
		location.href="AdminPage.jsp";
	</script>
	
<% 
    } else {
        MemberDao memberDao = new MemberDao();
        memberDao.delete(id);
%>
	<script>
		alert("삭제되었습니다.");
		location.href="AdminPage.jsp";
	</script>
     <%  }%>
