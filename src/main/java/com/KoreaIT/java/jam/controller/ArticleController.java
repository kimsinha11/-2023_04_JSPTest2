package com.KoreaIT.java.jam.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.KoreaIT.java.jam.dto.Article;
import com.KoreaIT.java.jam.service.ArticleService;
import com.KoreaIT.java.jam.util.DBUtil;
import com.KoreaIT.java.jam.util.SecSql;

public class ArticleController {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private Connection conn;
	private ArticleService articleService;
	
	public ArticleController(HttpServletRequest request, HttpServletResponse response, Connection conn) {
		this.conn = conn;
		this.request = request;
		this.response = response;
		
		this.articleService = new ArticleService(conn);
	}

	public void showList() throws ServletException, IOException {
	
		int page = 1;

		if (request.getParameter("page") != null && request.getParameter("page").length() != 0) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int itemsInAPage = articleService.getItemsInAPage();
		int totalPage = articleService.getTotalPage();


		List<Article> articles =articleService.getForPrintArticles(page);

		request.setAttribute("page", page);

		request.setAttribute("totalPage", totalPage);
		request.setAttribute("articles", articles);

		request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
		
	}

	public void showDetail() throws ServletException, IOException {
		
		HttpSession session = request.getSession();


		
		int id = Integer.parseInt(request.getParameter("id"));
		
		SecSql sql = SecSql.from("SELECT article.id, article.memberId, member.name, article.regDate, article.title, article.body");
		sql.append("FROM article");
		sql.append("INNER JOIN `member`");
		sql.append("ON member.id = article.memberId");
		sql.append("WHERE article.id = ? ;", id);

		Map<String, Object> articleRow = DBUtil.selectRow(conn, sql);
	
		response.getWriter().append(articleRow.toString());
	
		request.setAttribute("articleRow", articleRow);
		
		request.getRequestDispatcher("/jsp/article/detail.jsp").forward(request, response);

		
	}

	public void doWrite() throws ServletException, IOException {
		request.getRequestDispatcher("/jsp/article/write.jsp").forward(request, response);
		
	}

	public void doModify() throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		
		SecSql sql = SecSql.from("SELECT *");
		sql.append("FROM article");
		sql.append("WHERE id = ? ;", id);

		Map<String, Object> articleRow = DBUtil.selectRow(conn, sql);

		int loginedId =  (int) session.getAttribute("loginedMemberId");
		if(articleRow.get("memberId").equals(loginedId)==false) {
			response.getWriter().append(String.format("<script>alert('권한이 없습니다..'); location.replace('../article/list');</script>"));
			return;
		} 
		

		response.getWriter().append(articleRow.toString());

		request.setAttribute("articleRow", articleRow);
		request.getRequestDispatcher("/jsp/article/modify.jsp").forward(request, response);
		
	}
}
