package com.KoreaIT.java.jam.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.KoreaIT.java.jam.service.ArticleService;
import com.KoreaIT.java.jam.service.MemberService;
import com.KoreaIT.java.jam.util.DBUtil;
import com.KoreaIT.java.jam.util.SecSql;

public class MemberController {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private Connection conn;
	private MemberService memberservice;
	
	public MemberController(HttpServletRequest request, HttpServletResponse response, Connection conn) {
		this.conn = conn;
		this.request = request;
		this.response = response;
		
		this.memberservice = new MemberService(conn);
	}

	
	public void doJoin() throws ServletException, IOException {
		request.getRequestDispatcher("/jsp/member/join.jsp").forward(request, response);
		
	}


	public void doLogin() throws ServletException, IOException {
		request.getRequestDispatcher("/jsp/member/login.jsp").forward(request, response);
		
	}
}
