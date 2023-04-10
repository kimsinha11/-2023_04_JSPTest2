<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
	<div>
		<a href="../home/main">메인페이지로 이동</a>
	</div>

	<h1>게시물 작성</h1>

	<form method="post" action="dowrite">
	<div>제목 : 
	<input type="text" placeholder="제목을 입력해주세요" name = "title"/>
	</div>
	<div>내용 : 
	<textarea type="text" placeholder="내용을 입력해주세요" name = "body"/></textarea>
	<!--<textarea name="" id="" cols="30" rows="10"></textarea>*/-->
	</div>
	<button type="submit">글쓰기</button>
	</form>
	
</body>
</html>