<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.KoreaIT.java.jam.dto.Article"%>
<%
List<Article> articles = (List<Article>) request.getAttribute("articles");
%>
<%

 boolean isLogined = (boolean) request.getAttribute("isLogined");
 int loginedMemberId = (int) request.getAttribute("loginedMemberId");
 String loginedMemberLoginId = (String) request.getAttribute("loginedMemberLoginId");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>
<body style = "text-align: center;">
	

	<h1>게시물 상세보기</h1>
<%
		for (Article article : articles) {
		%>	
	<div>
	번호 : 
	<%=article.id%>
	</div>
	<div>
	작성날짜 : 
	<%=article.regDate %>
	</div>
	<div>
	제목 :
	<%=article.title %>
	</div>
	<div>
	내용 : 
	<%=article.body %>

	<div><a href= "modify?id=<%=article.id%>">수정</a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href= "dodelete?id=<%=article.id%>">삭제</a></div>

	</div>
	
		<%
		}
		%>
	<div>
		<a style="color: green" href="list">리스트로 돌아가기</a>
	</div>


</body>
</html>