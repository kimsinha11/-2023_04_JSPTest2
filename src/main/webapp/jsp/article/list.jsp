<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Map<String, Object>> articleRows = (List<Map<String, Object>>) request.getAttribute("articleRows");
int cPage = (int) request.getAttribute("page");
int totalCnt = (int) request.getAttribute("totalCnt");
int totalPage = (int) request.getAttribute("totalPage");
int pageSize = 10; // 한 페이지에 출력할 레코드 수
// 페이지 링크를 클릭한 번호 / 현재 페이지
String pageNum = request.getParameter("pageNum");
if (pageNum == null) { // 클릭한게 없으면 1번 페이지
	pageNum = "1";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body style="text-align: center;">

	<h1>게시물 리스트</h1>
	<div style="border: 1px solid black; display: inline-block; width: 10%; text-align: center;">
		<a style="display: block;" href="../home/main">메인페이지로 이동</a>
	</div>
	<div style="border: 1px solid black; display: inline-block; width: 10%; text-align: center;"class="write">
		<a style="display: block;" href="write">글쓰기</a>

	</div>
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
			<th>작성날짜</th>
			<th>제목</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
		for (Map<String, Object> articleRow : articleRows) {
		%>
		<tr class="tr2" style="text-align: center;">
			<td style = "text-decoration: none;"><%=articleRow.get("id")%></td>
			<td style = "text-decoration: none; width: 200px;"><%=articleRow.get("regDate")%></td>
			<td><a style = "text-decoration: none; width: 300px;" href="detail?id=<%=articleRow.get("id")%>"><%=articleRow.get("title")%></a></td>
			<td><a style = "text-decoration: none;" href="modify?id=<%=articleRow.get("id")%>">mod</a></td>
			<td><a style = "text-decoration: none;" href="dodelete?id=<%=articleRow.get("id")%>">del</a></td>
		</tr>
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

	<a class="first_page" style = "text-decoration: none;" href="list?page=1">[◀◀]</a>
<%	// 페이징  처리
						if(totalCnt > 0){
							// 총 페이지의 수
							int pageCount = totalCnt / pageSize + (totalCnt%pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 10;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((cPage-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
								<a style = "text-decoration: none;" href="list?page=<%=startPage - 10%>">[이전]</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == cPage){
					%>
									<a style = "text-decoration: none;" class="<%=cPage == i ? "red" : ""%>" href="list?page=<%=i%>">[<%=i %>]</a>
					<%									
								}else{ 
					%>
									<a style = "text-decoration: none;" class="<%=cPage == i ? "red" : ""%>" href="list?page=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a style = "text-decoration: none;" href="list?page=<%=startPage + 10 %>">[다음]</a>
					<%			
							}
						}
					%>

					<a class="first_page" style = "text-decoration: none;" href="list?page=<%=totalPage %>">[▶▶]</a>

	</div>

</body>
</html>