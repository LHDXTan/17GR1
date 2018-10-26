package com.si;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Main {
	private static String driver;
	private static String url;
	private static String user;
	private static String password;
	static{
		driver = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://localhoat:3306/NewsManagerSystem";
		user = "root";
		password = "root";
	}
	
	public static Connection getconn() {
			try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection connection = null;
		try {
			 connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	public static void colseAll(Connection connection,ResultSet rs,PreparedStatement ps) {
		
			try {
				if (rs!=null) {
				rs.close();
				}
				if (ps!=null) {
					ps.close();
				}
				if (connection!=null) {
					connection.close();
					}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	public int update_(String sql,Object[] oo) {
		Connection connection = getconn();
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		int hs = 0;
		try {
			for (int i = 0; i < oo.length; i++) {
				ps.setObject(i+1, oo[i]);
			}
			hs = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hs;
	}
}
