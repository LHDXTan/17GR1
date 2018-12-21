package com.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class BaseDao {




	public static String Driver;
	public static String url;
	public static String user;
	public static String password;
	
	static{
		
		Properties pr = new Properties();
		InputStream in = BaseDao.class.getClassLoader().getResourceAsStream("a.Properties");
		try {
			pr.load(in);
			Driver = pr.getProperty("Driver");
			url = pr.getProperty("url");
			user = pr.getProperty("user");
			password = pr.getProperty("password");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public Connection lianjie(){
		try {
			Class.forName(Driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection co=null;
		try {
			co = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return co;
		
	}
	public void guanbi(ResultSet re,PreparedStatement pr,Connection co){
		
		if(re!=null){
			try {
				re.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pr!=null){
			try {
				pr.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(co!=null){
			try {
				co.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	
	public int update(String sql,Object[] ob){
		
		Connection lianjie = lianjie();
		PreparedStatement pr =null;
		int num=0;
		try {
			 pr = lianjie.prepareStatement(sql);
			 if(pr!=null){
			 for(int i=0;i<ob.length;i++){
				 pr.setObject(i+1, ob[i]);
			 }
			 }
			 num = pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		guanbi(null, pr, lianjie);
		return num;
		
		
	}
	
	
	
	

	

}
