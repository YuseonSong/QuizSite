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
		<h3>��� ������ �� Ǯ�����!</h3>
		</div>
		<a class = "next1" href="main.jsp">Ȩ���� ���ư���<span>&#10230;</span></a>
		
	<% 
	} else { 
		session.setAttribute("problem", problem);
	%>
	<div class="pro">
	
		<form action="quizAction.jsp" method="post">
			<div class="input-group">
			<h2 class = "ace">����</h2> : <h3 class = "problem">Q <%= problem.getProblem() %></h3><br/>
			<input class ="text" type="text" name="answer" required />
			<label for="name"></label>
		
			<input class ="correct" type="submit" value="�Է�" />
			<% request.setAttribute("problem", problem); %>
			</div>
		</form><br/>
		
		<% 
		String hint = "��Ʈ�� �����ϴ�"; 
		if (problem.getProblemHint() != null) {
			hint = problem.getProblemHint();
		}
		%>
		
		
		<button class="hint" onclick="document.getElementById('hint').style.display = 'block';">��Ʈ����</button>
		<a  class = "surren" href="quiz.jsp">  �������� <span>&#10230;</span></a>
		<p style="display: none;" id="hint"> <%= hint %> </p>
	<% } %>
	</div>
</body>
</html>