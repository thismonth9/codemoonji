<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDao main = new MemberDao();
	String id = (String)session.getAttribute("id");
	MemberDto listDto = main.select2(id);
	 int point1 = 100000;
    int point2 = 500000;
    int point3 = 300000;
%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/Mainpage.css">
    <script src="js/jquery-3.7.0.min.js"></script>
    <script>
    	$(function() {
    		$("#image1").click(function() {
    		    let point1 = <%=point1 %>;
    		    if (<%=listDto.getPoint()%> <= point1) {
    		        alert("포인트가 부족합니다. 광고를 클릭하세요.");
    		    } else {
    		        if (confirm("컨텐츠(intro)를 구입하시겠습니까?")) {
    		        	alert("컨텐츠(intro)를 구입하였습니다.");
    		            location.href = "DecreasePoint.jsp?id=<%=id %>&point=" + point1;
    		        }
    		    }
    		});

    		$("#image2").click(function() {
    		    let point2 = <%=point2 %>;
    		    if (<%=listDto.getPoint()%> <= point2) {
    		        alert("포인트가 부족합니다. 광고를 클릭하세요.");
    		    } else {
    		        if (confirm("컨텐츠(Java)를 구입하시겠습니까?")) {
    		        	alert("컨텐츠(Java)를 구입하였습니다.");
    		            location.href = "DecreasePoint.jsp?id=<%=id %>&point=" + point2;
    		        }
    		    }
    		});

    		$("#image3").click(function() {
    		    let point3 = <%=point3 %>;
    		    if (<%=listDto.getPoint()%> <= point3) {
    		        alert("포인트가 부족합니다. 광고를 클릭하세요.");
    		    } else {
    		        if (confirm("컨텐츠(C++)를 구입하시겠습니까?")) {
    		        	alert("컨텐츠(C++)를 구입하였습니다.");
    		            location.href = "DecreasePoint.jsp?id=<%=id %>&point=" + point3;
    		        }
    		    }
    		});
    		 $("#adver").click(function() {
                 let point = Math.floor(Math.random() * 1000) + 1;
                 alert(point + "점이 적립되었습니다.");

                 // 포인트 적립 처리
                 location.href = "IncreasePointAction.jsp?id=<%=id %>&point=" + point;
             });
    		 $("#logout-btn").click(function() {
    			location.href = "LogoutAction.jsp"; 
    		 });
    	});
    </script>
</head>
<body>
    <div class="main-container">
        <div class="header">
            <h1>메인페이지</h1>
            <div style="float:right">
            <p style="display:inline-block;"><span id="username"><%=listDto.getName() %>(<%=id %>)</span>님 안녕하세요</p>
            <button id="logout-btn">로그아웃</button>
            <p>포인트: <%=listDto.getPoint() %></p>
            </div>
        </div>
        <div class="content">
            <div class="image-container">
                 <img src="img/Intro_350_408.png" alt="Image 1" id="image1">
                <p class="point">포인트: <%=point1 %></p>
                <img src="img/Java_350_408.png" alt="Image 2"id="image2">
                <p class="point">포인트: <%=point2 %></p>
                <img src="img/Cpp_350_408.png" alt="Image 3"id="image3">
                <p class="point">포인트: <%=point3 %></p>
            </div>
        </div>
        <div class="advertisement">
            <img src="img/korea_it.png" alt="Advertisement" id="adver">
        </div>
    </div>
</body>
</html>