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
		
		List<Article> articles = articleService.getForSelectArticle(id);
	
		response.getWriter().append(articles.toString());
	
		request.setAttribute("articles", articles);
		
		request.getRequestDispatcher("/jsp/article/detail.jsp").forward(request, response);

		
	}

	public void doWrite() throws ServletException, IOException {
		request.getRequestDispatcher("/jsp/article/write.jsp").forward(request, response);
		
	}

	public void doModify() throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		
		

		List<Article> articles = articleService.getForModifyArticle(id);
		

		int loginedId =  (int) session.getAttribute("loginedMemberId");
		
		

		response.getWriter().append(articles.toString());

		request.setAttribute("articles", articles);
		request.getRequestDispatcher("/jsp/article/modify.jsp").forward(request, response);
		
	}
}
