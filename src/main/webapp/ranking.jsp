<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ac.honam.SolvedpbDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랭킹정보</title>
<link rel="stylesheet" type="text/css" href="ranking.css" />
<link rel="stylesheet" type="text/css" href="quiz.css" />

</head>
<body>
<div id="ranking">
	<img src="photo/tropy.png" >

<%
	SolvedpbDAO dao = new SolvedpbDAO();
	Map<String,Integer> rankMap = dao.newSolvedpb();
%>
>
<%
for( String userId : rankMap.keySet() ){ 
	int rank = rankMap.get(userId);
	out.println( rank +"등: "+ userId + "<br>" );
}

%>
	

<a class ="surren" href ="main.jsp"> 메인으로<span>&#10230;</span> </a>
</div>
</body>
</html>