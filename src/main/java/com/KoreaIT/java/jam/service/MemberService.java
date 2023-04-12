package com.KoreaIT.java.jam.service;

import java.sql.Connection;

import com.KoreaIT.java.jam.dao.ArticleDao;

public class MemberService {


	private Connection conn;
	private MemberDao articleDao;
	
	public MemberService(Connection conn) {
		this.conn = conn;
		this.memberDao =  new MemberDao(conn);
	}
}
