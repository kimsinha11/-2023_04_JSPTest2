<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.KoreaIT.java.jam.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Article> articles = (List<Article>) request.getAttribute("articles");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
	<div>
		<a href="../home/main">메인페이지로 이동</a>
	</div>
<%
		for (Article article : articles) {
		%>	
	<h1><%=article.id %>번 게시물 수정</h1>
	

	<form method="post" action="domodify">
	<div>
	번호 : 
	<input value="${param.id }"<%=article.id%>" type="hidden" name = "id"/>
	</div>
	<div>
	작성날짜 : 
	<%=article.regDate %>
	</div>
	<div>
	제목 :
	<input value="<%=article.title %>" type="text" name = "title" placeholder="제목을 입력해주세요"/>
	</div>
	<div>
	내용 : 
	<textarea type="text" name = "body" placeholder="내용을 입력해주세요"><%=article.body %></textarea>
	</div>
	<button type="submit">수정</button>
	</form>
		<%
		}
		%>
	<div>
	<a style="color: green" href="list">리스트로 돌아가기</a>
	</div>
</body>
</html>