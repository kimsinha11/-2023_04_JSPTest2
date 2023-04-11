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
import com.KoreaIT.java.jam.exception.SQLErrorException;
import com.KoreaIT.java.jam.util.DBUtil;
import com.KoreaIT.java.jam.util.SecSql;

@WebServlet("/member/doLogin")
public class MemberDoLoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

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

			request.setCharacterEncoding("UTF-8");

			String loginId = request.getParameter("loginId");
			String loginPw = request.getParameter("loginPw");

			SecSql sql = SecSql.from("SELECT *");
			sql.append("FROM `member`");
			sql.append("WHERE loginId = ?;", loginId);
			

			Map<String, Object> memberRow = DBUtil.selectRow(conn, sql);
			//0이면 true 아이디 사용해도 괜찮아
			if(memberRow.isEmpty()) {
				response.getWriter().append(String.format("<script>alert('%s는 없는 아이디입니다'); location.replace('../member/login');</script>", loginId));
				return;
			} 
			
			if(memberRow.get("loginPw").equals(loginPw)==false) {
				response.getWriter().append(String.format("<script>alert('비밀번호가 일치하지 않습니다.'); location.replace('../member/login');</script>"));
				return;
			} 
			
			HttpSession session = request.getSession();
			session.setAttribute("loginedMemberLoginId", memberRow.get("loginId"));
			session.setAttribute("loginedMemberId", memberRow.get("id"));
			
			response.getWriter().append(
					String.format("<script>alert('%s님 환영합니다'); location.replace('../article/list');</script>",  memberRow.get("name")));

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (SQLErrorException e) {
			e.getOrigin().printStackTrace();
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}