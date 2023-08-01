<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/Login.css">
    <script src="js/jquery-3.7.0.min.js"></script>
    <script>
    	$(function() {
    		$(".signbtn").click(function() {
    			location.href="Signup.jsp";
    		});
    	});
    </script>
    
</head>
<body>
    <div class="login-container">
        <form action="LoginAction.jsp" method="post">
            <h1>로그인</h1>
            <div class="input-container">
                ID :  <input type="text" class="login" name="id" placeholder="Enter your username">
            </div>
            <div class="input-container">
               PW : <input type="password" class="login" name="pw" placeholder="Enter your password">
            </div>
            <input type="submit" value="로그인"/>
        </form>
        <button class="signbtn">회원가입</button>
    </div>
</body>
</html>