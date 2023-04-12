package com.KoreaIT.java.jam.dao;

import java.sql.Connection;

public class MemberDao {
	private Connection conn;
	public MemberDao(Connection conn) {
		this.conn = conn;
	}

}
