<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="join.css">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<br>
	<h2>회원가입</h2>
	<br>
	<div id="container">
	<form method="post" action="joinAction.jsp">
			<div id="inner">
				아이디<br>
					<input type="text" class="form-control" name="userID" maxlength="20" placeholder="UserID"><br>
				비밀번호<br>
    				<input type="password" class="form-control" name="userPassword" id="inputPassword" placeholder="Password"><br>
				이름<br>
					<input type="text" class="form-control" name="userName" maxlength="20" placeholder="Name"><br>
				닉네임<br>
					<input type="text" class="form-control" name ="userNickname" maxlength="10" placeholder ="Nickname"><br>
				성별<br>
  					<input class="form-check-input" type="radio" name="userGender" id="inlineRadio1" value="여성">
  					<label class="form-check-label" for="inlineRadio1">여성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
  					<input class="form-check-input" type="radio" name="userGender" id="inlineRadio2" value="남성">
					<label class="form-check-label" for="inlineRadio2">남성</label><br><br>
					<button type="submit" class="btn btn-outline-primary">가입하기</button>
					
			</div>
		</form>
	</div>
		<br>
		<br>
		<br>
	</body>
</html>