package com.qinhuaDAO;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class BaseDao {
	private static String user;
	private static String pass;
	private static String DriverName;
	private static String url;
	
    static{
    	Properties pr=new Properties();
    	FileReader io;
		try {
			io = new FileReader(new File("F:\\Myeclips_Java´úÂë\\JSP\\JS-2\\src\\t.properties"));
			pr.load(io);
			url=pr.getProperty("url");
			user=pr.getProperty("username");
			DriverName=pr.getProperty("driver");
			pass=pr.getProperty("password");
			  
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    public Connection getcon(){
    	Connection conn=null;
    	try {
			Class.forName(DriverName);
			 conn= DriverManager.getConnection(url,user,pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return conn;
    }
    public int gen(String sql,Object[] pams){
    	 Connection con = getcon();
    	 try {
			PreparedStatement ps = con.prepareStatement(sql);
			for (int i = 0; i < pams.length; i++) {
				ps.setObject(i+1, pams[i]);
			}
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
    	
    }
    public void Close(Connection con,PreparedStatement ps,ResultSet rs){
			try {
				if(con!=null)con.close();
				if(ps!=null)ps.close();
				if(rs!=null)rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
    }
    
    
    
    public static void main(String[] args) {
    	BaseDao bs=new BaseDao();
		/*if(bs.getcon()!=null){
			System.out.println(1);
		}*/
    	String sql="insert into news_users(uname,upwd) values(?,?)";
    	Object[] o={1,1};
    	int i=bs.gen(sql,o);
    	if(i!=0){
//    		System.out.println("chenggong ");
    	}
	}
    
    
}
