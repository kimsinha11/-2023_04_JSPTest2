package com.KoreaIT.java.jam.config;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.KoreaIT.java.jam.exception.SQLErrorException;

public class Config {
	public static String getDBUrl() {
		return "jdbc:mysql://127.0.0.1:3306/JSPAM?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeNehavior=convertToNull";
	}
	
	public static String getDBUser() {
		return "root";
	}
	
	public static String getDBPassword() {
		return "";
	}
	
	public static String getDBDriverClassName() {
		return "com.mysql.jdbc.Driver";
	}
}