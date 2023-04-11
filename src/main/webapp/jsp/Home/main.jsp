<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

 boolean isLogined = (boolean) request.getAttribute("isLogined");
 int loginedMemberId = (int) request.getAttribute("loginedMemberId");
 String loginedMemberLoginId = (String) request.getAttribute("loginedMemberLoginId");

%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>메인 페이지</title>

</head>

<body style="text-align: center;">
	<h1 style="text-align: center;">MAIN</h1>
	

	<%if(isLogined){ %>
	<div>
	<%=loginedMemberLoginId %>님 로그인중
	</div>
	<ul
		style="border: 1px solid black; display: inline-block; width: 10%; text-align: center;">
		<li><a style="display: block;" href="../member/doLogout">로그아웃</a></li>
	</ul>
	<%} 
	%>
	
	<%if(!isLogined){ %>
	<ul
		style="border: 1px solid black; display: inline-block; width: 10%; text-align: center;">
		<li><a style="display: block;" href="../member/join">회원가입</a></li>
	</ul>
	
	<ul
		style="border: 1px solid black; display: inline-block; width: 10%; text-align: center;">
		<li><a style="display: block;" href="../member/login">로그인</a></li>
	</ul>
	<%} 
	%>
	
	<ul
		style="border: 1px solid black; display: inline-block; width: 10%; text-align: center;">
		<li><a style="display: block;" href="../article/list">게시물 리스트</a></li>
	</ul>
	
	<br />
	<img
		src="https://image.aladin.co.kr/product/8555/38/cover500/g592438753_1.jpg"
		alt="" />



	<style type="text/css">
ul, li {
	list-style: none;
}
</style>

</body>

</html>