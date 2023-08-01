<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/signup.css">
</head>
<body>
    <div class="signup-container">
        <form action="SignupAction.jsp">
        <h1>회원가입</h1>
            <div class="input-container">
                ID : <input type="text" name="id" class="btn" placeholder="Enter your ID">
            </div>
            <div class="input-container">
               PW : <input type="password" name="pw"class="btn" placeholder="Enter your password">
            </div>
            <div class="input-container">
               NAME : <input type="text" name="name"class="btn" placeholder="Enter your name">
            </div>
            <input type="hidden" name="point" value="1000"/>
            <input type="submit" value="작성완료" class="submit-btn">
        </form>
    </div>
</body>
</html>