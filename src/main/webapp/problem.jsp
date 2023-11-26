<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="problem.css" />


</head>
<body>
<h2> 퀴즈목록</h2>
<br>
	<% session.setAttribute("problems", null); %>
		<div class="container">
		
	<form action="quiz.jsp" method="post">
	    <button type="submit" value="한국사" name="btn" class="btn btn1">한국사 <span>&#10230;</span></button>
	    <button type="submit" value="과학" name="btn" class="btn btn2">과학</button>
	    <button type="submit" value="넌센스" name="btn" class="btn btn3">넌센스</button>
	</form>
</div>




</body>
</html>