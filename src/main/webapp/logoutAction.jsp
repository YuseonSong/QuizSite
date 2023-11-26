<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	session.invalidate();
	%>
	<script>
		location.href = "main.jsp";
		script.println("alert('로그아웃 됩니다')");
	</script>
</body>
</html>