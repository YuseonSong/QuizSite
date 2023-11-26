<%@page import="ac.honam.SolvedpbDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ac.honam.ProblemDTO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% 
		ProblemDTO problem = ((ProblemDTO) session.getAttribute("problem"));
		request.setCharacterEncoding("EUC-KR");
		String answer = request.getParameter("answer");
		
		System.out.println(problem.getProblemAnswer() + ", " + answer);
		if (problem.getProblemAnswer().equals(answer)) { 		
			new SolvedpbDAO().join((String) session.getAttribute("userID"), problem.getProblemNumber());
		%>
			<jsp:forward page="quizSucc.jsp"/>
		<% } else { %>
			<jsp:forward page="quizFail.jsp"/>
		<% } 
	%>


</body>
</html>