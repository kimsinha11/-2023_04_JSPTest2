<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.KoreaIT.java.jam.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Article> articles = (List<Article>) request.getAttribute("articles");


int cPage = (int) request.getAttribute("page");
int totalPage = (int) request.getAttribute("totalPage");

// 페이지 링크를 클릭한 번호 / 현재 페이지
String pageNum = request.getParameter("pageNum");
if (pageNum == null) { // 클릭한게 없으면 1번 페이지
	pageNum = "1";
}
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
<title>게시물 리스트</title>
</head>
<body style="text-align: center;">
<%if(isLogined){ %>
	<div>
	<%=loginedMemberLoginId %>님 로그인중
	</div>
	<h1>게시물 리스트</h1>
	
	<div style="border: 1px solid black; display: inline-block; width: 10%; text-align: center;">
		<a style="display: block;" href="../home/main">메인페이지로 이동</a>
	</div>
	<div style="border: 1px solid black; display: inline-block; width: 10%; text-align: center;"class="write">
		<a style="display: block;" href="write">글쓰기</a>
	</div>
	<%} 
	%>
	
	<%if(!isLogined){ %>
	<h1>게시물 리스트</h1>
	<div style="border: 1px solid black; display: inline-block; width: 10%; text-align: center;">
		<a style="display: block;" href="../home/main">메인페이지로 이동</a>
	</div>
		<%} 
	%>
	
<br /><br />
<style type="text/css">
a {
 color: inherit;
 text-decoration: none;
}
.tr2:hover {
background-color: gray;
text-decoration: underline;
}
</style>

	<table style="border-collapse: collapse; border-color: green; width: 1500px; margin: auto; padding: auto; "
		border="2px">

		<tr style = "text-decoration: none;">

			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성날짜</th>

		<%
		for (Article article : articles) {
		%>
		<tr class="tr2" style="text-align: center;">
			<td style = "text-decoration: none; width: 150px;"><%=article.id%></td>
			<td style = "text-decoration: none; width: 150px;"><%=article.extra__writer%></td>
			<td><a style = "text-decoration: none; width: 300px;" href="detail?id=<%=article.id%>"><%=article.title%></a></td>
			<td style = "text-decoration: none; width: 300px;"><%=article.regDate%></td>

		<%
		}
		%>

	</table>

	<br />

	<br />
	<style type="text/css">
.page {
	background-color: gold;
}
.page>a {
	color: black;
}
.page>a:hover {
	background-color: gray;
}
.page>a.red {
	color: red;
}
</style>

	<div class="page">

	<%
		if (cPage > 1) {
		%>
		<a href="list?page=1">◀◀</a>
		<%
		}
		int pageSize = 5;
		int from = cPage - pageSize;
		if (from < 1) {
		from = 1;
		}
		int end = cPage + pageSize;
		if (end > totalPage) {
		end = totalPage;
		}
		for (int i = from; i <= end; i++) {
		%>
		<a class="<%=cPage == i ? "red" : ""%>" href="list?page=<%=i%>"><%=i%></a>
		<%
		}
		%>

		<%
		if (cPage < totalPage) {
		%>
		<a href="list?page=<%=totalPage%>">▶▶</a>
		<%
		}
		%>

	</div>

</body>
</html>