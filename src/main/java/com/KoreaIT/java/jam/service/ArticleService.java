package com.KoreaIT.java.jam.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.KoreaIT.java.jam.dao.ArticleDao;
import com.KoreaIT.java.jam.dto.Article;
import com.KoreaIT.java.jam.util.SecSql;

public class ArticleService {
	private Connection conn;
	private ArticleDao articleDao;
	
	public ArticleService(Connection conn) {
		this.conn = conn;
		this.articleDao =  new ArticleDao(conn);
	}

	public int getItemsInAPage() {
		return 10;
	}

	public int getTotalPage() {
		int itemsInAPage = getItemsInAPage();

		int totalCnt = articleDao.getTotalCnt();
		int totalPage = (int) Math.ceil((double) totalCnt / itemsInAPage);
		return totalPage;
	}

	public List<Article> getForPrintArticles(int page) {
		int itemsInAPage = getItemsInAPage();

		int limitFrom = (page - 1) * itemsInAPage;

		List<Article> articles = articleDao.getArticles(limitFrom, itemsInAPage);

		return articles;
	}

	public List<Article> getForSelectArticle(int id) {
		
		List<Article> articles = articleDao.getArticles(id);
		return articles;
	}

	public List<Article> getForModifyArticle(int id) {

		List<Article> articles = articleDao.getForModifyArticle(id);
		return articles;
	}

}