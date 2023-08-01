<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = "";
    int point = 0;
    
    MemberDao login = new MemberDao();
    boolean loginSuccess = login.loginCheck(id, pw);

    if (loginSuccess) {
        // 세션에 로그인 정보 저장
        MemberDto dto = new MemberDto(id,pw,name,point);
        session.setAttribute("id", dto.getId());
        session.setAttribute("pw", dto.getPw());
        String welcomeMessage = dto.getId() + "님, 환영합니다.";
	 	if(id.equals("admin")){ %>  
	 		<script>
	 			alert("<%=welcomeMessage%>");
	 			location.href = "AdminPage.jsp";
	 		</script>
 		<%} else {%>
        <script>
            alert("<%= welcomeMessage %>");
            window.location.href = "MainPage.jsp";
        </script>
        <%} %>
     

<%
    } else {
%>
        <script>
            alert("아이디/비밀번호를 다시 확인하세요");
            location.href="Login.jsp"
        </script>
     <%  } %>
