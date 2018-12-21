package Dao;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import entity.product_category;
public class BaseDao {
	protected Connection conn;
	private static String url;
	private static String driver;
	private	static String user;
	private static String password;
	static{
		Properties p = new Properties();
		InputStream is = BaseDao.class.getClassLoader().getResourceAsStream("database.properties");
		try {
			p.load(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		url = p.getProperty("url"); 
		driver = p.getProperty("driver");
		user = p.getProperty("user");
		password = p.getProperty("password");
	}
	
	public  Connection getConn(){
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public void closeAll(Connection con , PreparedStatement ps , ResultSet rs){
			try {
				if(con !=null){
				con.close();
				}
				if(ps!=null){
					ps.close();
				}
				if(rs!=null){
					rs.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public int executeUpdate(String sql , Object[] object){
		Connection con = null;
		PreparedStatement ps = null;
		int num = 0;
		con = this.getConn();
		try {
			ps = con.prepareStatement(sql);
			for (int i = 0; i < object.length; i++) {
				ps.setObject(i+1, object[i]);
			}
			num = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll(null, ps, null);
		}
		
		return num;
		
	}
	public ResultSet executeQuery(String sql , Object[]objects ){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = this.getConn();
		try {
			ps = con.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				ps.setObject(i+1, objects[i]);
			}
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
	
}
