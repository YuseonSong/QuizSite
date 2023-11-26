<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ac.honam.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="ac.honam.UserDTO" %>
<%
request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = (String) request.getParameter("floatingInput");
	String userPassWord = (String) request.getParameter("floatingPassword");
	UserDAO UserDAO = new UserDAO();
	UserDTO result = UserDAO.login(userID, userPassWord); 
	
	
	if (result.getUserID() == "a") { //비밀번호 오류
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다:(')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result.getUserPassWord() == "b") { //아이디 없음
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다!')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result.getUserName() == "c") { //데이터베이스 오류였을 때
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Database error')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	else { //로그인 성공했을 때
		PrintWriter script = response.getWriter();
		session.setAttribute("userID", result.getUserID());
		session.setAttribute("userPassword", result.getUserPassWord());
		session.setAttribute("userNickname", result.getUserNickname());
		script.println("<script>");
		script.println("javascript:window.close();");
		script.println("opener.parent.location.reload();");
		script.println("</script>");
		
	}
	%>
	
<jsp:useBean id="user" class="ac.honam.UserDTO" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userNickname" />


</body>
</html>