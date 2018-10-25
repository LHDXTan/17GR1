package com.javaBean;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import com.mysql.jdbc.Driver;
/**
 * @author 凯
 *	数据库操作基类
 */
public class BaseDao {
	public static String url;//连接数据库。
	public static String driver; //连接驱动类
	public static String name;//数据库用户名。
	public static String password;//数据库用密码。
	//静态代码块，与类同事加载。
	static{
		//创建Properties对象。
		Properties po = new Properties();
		//使用类加载器，加载kai.properties文件，处理IO异常
		InputStream io = BaseDao.class.getClassLoader().getResourceAsStream("kai.properties");
		try {
			//使用load方法读取kai.properties文件。
			if(po!=null){
				po.load(io);
			}
		} catch (IOException e2) {
			e2.printStackTrace();
		}
		//加载驱动
		driver=po.getProperty("Stringdriver");
		//连接数据库
		url=po.getProperty("Stringurl");
		//数据库用户名
		name=po.getProperty("Stringname");
		//数据库密码
		password=po.getProperty("Stringpassword");
	}
	//加载驱动、获取连接的方法。
	public static Connection quDong() {
		Connection connection = null;
		//处理类加载异常异常
		try {
			//加载驱动
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			//连接数据库
			connection = DriverManager.getConnection(url, name, password);
//			String sql = null;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return connection;
	}
	
	//关闭驱动、连接和查询结果 的方法
	public static void colseall(Connection connection,PreparedStatement ps,ResultSet rs){
		//处理SQL异常
		try {
			//if判断是否为空，不为空时关闭连接和驱动
			if(connection!=null){
				connection.close();
			}
			if(ps!=null){
				ps.close();
			}
			if(rs!=null){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//更新的方法，sql是执行的mysql语句，obj[]是执行mysql语句的条件，并返回影响的行数。
	public int update(String sql,Object[] obj) {
		//得到数据库
		Connection conne = quDong();
		//统计影响的行数。
		int executeUpdate = 0;
		//预编译，防止SQL注入。
		PreparedStatement ps = null;
		try {
			//得到PreparedStatement对象
			ps = conne.prepareStatement(sql);
			for (int i = 0; i < obj.length; i++) {
				ps.setObject((i+1), obj[i]);
			}
			//执行SQL语句，返回executeUpdate
			executeUpdate = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//return 影响的行数。
		return executeUpdate;
	}
	
	public static ArrayList<User> selectUser(){
		ArrayList<User> al = new ArrayList<User>();
		Connection quDong = quDong();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			String sql = "select uname,upwd from news_users";
			 ps = quDong.prepareStatement(sql);
			 rs= ps.executeQuery(sql);
			User user = null;
			while(rs.next()){
				user = new User(rs.getString(1), rs.getString(2));
				System.out.println(user.getName()+user.getPassword());
			}
			al.add(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		colseall(quDong , ps , rs);
 		return al;
	}
	public static void main(String[] args) {
		BaseDao sb = new BaseDao();
		ArrayList<User> selectUser = sb.selectUser();
		for (int i = 0; i < selectUser.size(); i++) {
			User user = selectUser.get(i);
			System.out.println(user.getName());
		}
	}
}
