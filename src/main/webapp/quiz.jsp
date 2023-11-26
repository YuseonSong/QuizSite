<%@page import="java.util.Collections"%>
<%@page import="java.io.Serializable"%>
<%@page import="ac.honam.ProblemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@page import="ac.honam.ProblemDAO"%>
<%@page import="java.util.Collections" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="quiz.css" />
</head>
<body>

	<% 
	if (session.getAttribute("problems") == null) {
		request.setCharacterEncoding("UTF-8");
		ArrayList<ProblemDTO> problems = new ProblemDAO().newProblem((String) session.getAttribute("userID"), (String) request.getParameter("btn"));
		Collections.shuffle(problems);
		session.setAttribute("problems", problems);
	}
	%>
	<%
		ArrayList<ProblemDTO> problems = (ArrayList<ProblemDTO>) session.getAttribute("problems");	
		String req = request.getParameter("fval");
		if (req != null && req.equals("re")) {
			problems.add(0, (ProblemDTO) session.getAttribute("problem"));
		}
	%>
	<% 
		ProblemDTO problem = null;
		if (problems.size() > 0) {
			problem = problems.get(0);
			problems.remove(0);
		}
		session.setAttribute("problem", null);
	%>
	
	<%
		if (problem == null) {
	%>
	<div class="clear">
		<img src="photo/ddabong.png" alt="">
		<h3>모든 문제를 다 풀었어요!</h3>
		</div>
		<a class = "next1" href="main.jsp">홈으로 돌아가기<span>&#10230;</span></a>
		
	<% 
	} else { 
		session.setAttribute("problem", problem);
	%>
	<div class="pro">
	
		<form action="quizAction.jsp" method="post">
			<div class="input-group">
			<h2 class = "ace">문제</h2> : <h3 class = "problem">Q <%= problem.getProblem() %></h3><br/>
			<input class ="text" type="text" name="answer" required />
			<label for="name"></label>
		
			<input class ="correct" type="submit" value="입력" />
			<% request.setAttribute("problem", problem); %>
			</div>
		</form><br/>
		
		<% 
		String hint = "힌트가 없습니다"; 
		if (problem.getProblemHint() != null) {
			hint = problem.getProblemHint();
		}
		%>
		
		
		<button class="hint" onclick="document.getElementById('hint').style.display = 'block';">힌트보기</button>
		<a  class = "surren" href="quiz.jsp">  다음문제 <span>&#10230;</span></a>
		<p style="display: none;" id="hint"> <%= hint %> </p>
	<% } %>
	</div>
</body>
</html>