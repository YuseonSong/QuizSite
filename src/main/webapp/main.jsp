<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="main.css" />
<style>
div.q-container {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	
	padding: 60px 0px 60px 0px;
}
div.q-container > a {
	float: left;
	width: 300px;
	height: 300px;
	
	box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	margin-right: 20px;
	margin-left: 20px;
	
	display: flex;
	justify-content: center;
	align-items: center;
	
	text-decoration: none;
	color: gray;
	font-size: 24px;
	font-weight: 900;
	
	border-radius: 3px;
}
div.q-container > a:hover {
	box-shadow: rgba(38, 57, 77, 0.7) 0px 20px 30px -10px;
	color: rgba(20,20,20, 0.8);
}

</style>
<script type="text/javascript">	

	function load(URL) {
		window.open(URL, "mywin", "left=300, top=300, width=450, height=800");
	}
</script>
</head>

<body>
	<%
	String userID = (String) session.getAttribute("userID");
	String userName = (String) session.getAttribute("userName");
	String userNickname = (String) session.getAttribute("userNickname");
	%>
	<div id="wrapper">
		<header>
			<%
			//로그인하지 않았을 때 보여지는 화면
			if (userID == null) {
			%>
			<nav class="login">
				<ul>
					<li><a href="javascript:load('login.jsp')">로그인</a></li>
					<li><a href="javascript:load('join.jsp')">회원가입</a></li>
				</ul>
			</nav>
			<%

			} else {
			%>
			<nav class="login">
				<ul>
					<li><%=userID%>(<%=userNickname%>)님 안녕하세요:)</li>
					<li><a href="logoutAction.jsp">로그아웃</a></li>
				</ul>
			</nav>
			<%
			}
			%>
			<nav class="home">
				<ul>
					<li><a href="main.jsp">Home</a></li>
					
					
				</ul>
			</nav>
			
			<% 
			String custid= "";
			if(session.getAttribute("userID")!=null){
				custid = (String)session.getAttribute("userID");
			}
			%>
		
			
			<%
			//관리자페이지
			if(custid.equals("master")){
			%>
				<nav class="master">			
				<ul>
					<li><a href= "masterpage.jsp">마스터페이지</a></li>
				</ul>	
					</nav>
		
			
			<% } %>
	
		</header>

	<section>	
	<% if (userID != null) {		%>
		<div class="q-container">
			<a href ="problem.jsp" > <h2>퀴즈풀기</h2></a>
			<a href ="ranking.jsp" > <h2>랭킹정보</h2></a>
		<br>	
		</div>
			<%  } %>
	</section>		

	<footer>
	<h2>퀴즈사이트</h2>
	</footer>
	</div>
</body>
</html>