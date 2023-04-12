package com.KoreaIT.java.jam.service;

import java.sql.Connection;

import com.KoreaIT.java.jam.dao.MemberDao;

public class MemberService {
	private Connection conn;
	private MemberDao memberDao;
	
	public MemberService(Connection conn) {
		this.conn = conn;
		this.memberDao =  new MemberDao(conn);
	}
}
