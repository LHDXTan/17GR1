package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BastDao {
	public static Connection LianJie() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String user = "root";
		String url = "jdbc:mysql:///newsmanagersystem";
		String password = "123";
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(url, user, password);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
		System.out.println("aaaaaaaaaaaaaa");
		return connection;
	}
	// 查找的方法
	public int updatefangfa(String sql, Object[] object) {
		Connection connection = LianJie();
		PreparedStatement prepareStatement = null;
		int hangshu = 0;
		try {
			prepareStatement = connection.prepareStatement(sql);// 进行预编译
			if (object != null) {
				for (int i = 0; i < object.length; i++) {
					prepareStatement.setObject(i + 1, object[i]);
				}
			}
			hangshu = prepareStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeAll(connection, prepareStatement, null);
		}

		return hangshu;
	}

	// 关闭的方法();
	public void closeAll(Connection connection,
			PreparedStatement prepareStatement, ResultSet resultSet) {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		if (prepareStatement != null) {
			try {
				prepareStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// idcha

	}
}
