
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ac.honam.UserDTO"%>
<%@ page import="ac.honam.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassWord = null;
	String userName = null;
	String userNickname = null;
	String userGender = null;
	
	

	if (request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
	} 

	if (request.getParameter("userPassword") != null) {
		userPassWord = (String) request.getParameter("userPassword");
	}
	
	if (request.getParameter("userName") != null) {
		userName = (String) request.getParameter("userName");
	}
	
	if (request.getParameter("userNickname") != null) {
		userNickname = (String) request.getParameter("userNickname");
	} 
	
	
	if (request.getParameter("userGender") != null) {
		userGender = (String) request.getParameter("userGender");
	} 
	




	if (userID == null || userPassWord == null || userName == null ||  userNickname == null || userGender == null  ) {
		System.out.printf(userPassWord);
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("alert('모든 정보를 입력해주세요:(')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}

	UserDAO UserDAO = new UserDAO();
	int result = UserDAO.join(userID, userPassWord, userName,  userNickname,userGender);
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입을 축하합니다:)')");
		script.println("javascript:window.close();");
		script.println("opener.parent.location.reload();");
		script.println("</script>");
		script.close();
	}
	else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Database error')");
		script.println("javascript:window.close();");
		script.println("</script>");
		script.close();
	}
%>
