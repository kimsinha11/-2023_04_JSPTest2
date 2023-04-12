package com.KoreaIT.java.jam.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.KoreaIT.java.jam.config.Config;
import com.KoreaIT.java.jam.controller.ArticleController;
import com.KoreaIT.java.jam.util.DBUtil;
import com.KoreaIT.java.jam.util.SecSql;

@WebServlet("/s/*")
public class DispatcherServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestUri = request.getRequestURI();
		
		String[] requestUriBits = requestUri.split("/");
		//  ~~/~~/s/article/list
		// [0]/[1]/[2]/[3]/[4]
		
		if(requestUriBits.length < 5) {
			response.getWriter().append("올바른 요청이 아닙니다.");
			return;
		}
		
		
		String controllerName = requestUriBits[3];
		String actionMethodName = requestUriBits[4];
		
		
		// DB 연결
				Connection conn = null;

				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					System.out.println("예외 : 클래스가 없습니다");
					System.out.println("프로그램을 종료합니다");
					return;
				}
				try {
					conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUser(), Config.getDBPassword());
					// 모든 요청의 응답하기 전에 무조건 해야함
					HttpSession session = request.getSession();

					boolean isLogined = false;
					int loginedMemberId = -1;
					String loginedMemberLoginId = null;
					
					if (session.getAttribute("loginedMemberId") != null) {
						isLogined = true;
						loginedMemberId = (int) session.getAttribute("loginedMemberId");
						loginedMemberLoginId = (String) session.getAttribute("loginedMemberLoginId");
					}

					request.setAttribute("isLogined", isLogined);
					request.setAttribute("loginedMemberId", loginedMemberId);
					request.setAttribute("loginedMemberLoginId", loginedMemberLoginId);
					
					
					if (controllerName.equals("article")) {
						ArticleController articleController = new ArticleController(request, response, conn);
						
						if(actionMethodName.equals("list")) {
							articleController.showList();
						} else if(actionMethodName.equals("detail")) {
							articleController.showDetail();
						} else if(actionMethodName.equals("write")) {
							articleController.doWrite();
						} else if(actionMethodName.equals("modify")) {
							articleController.doModify();
						}
					} else if(controllerName.equals("member")) {
						
					}
					
					
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						if (conn != null && !conn.isClosed()) {
							conn.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
		
		
		
		

		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}