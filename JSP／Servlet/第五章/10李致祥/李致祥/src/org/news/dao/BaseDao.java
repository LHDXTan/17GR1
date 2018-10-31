package org.news.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.news.util.DatabaseUtil;

/**
 * 执行数据库操作的工具类。
 * 
 * @author 北大青鸟
 */
public class BaseDao {

	protected Connection conn;
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	/**
	 * 获取数据库连接对象。
	 */
	public Connection getConnection(Connection conn) {
		Context ctx;
		// 获取连接并捕获异常
		try {
			ctx=new InitialContext();
			DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/news");
			conn=ds.getConnection();		
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}  
		return conn;
	}
    
    /**
     * 增、删、改操作
     * 
     * @param sql
     *            sql语句
     * @param prams
     *            参数数组
     * @return 执行结果
     * @throws SQLException 
     */
    protected int executeUpdate(String sql, Object... params) throws SQLException {
        int result = 0;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            DatabaseUtil.closeAll(null, pstmt, null);
        }
        return result;
    }

    /**
     * 查询操作
     * 
     * @param sql
     *            sql语句
     * @param params
     *            参数数组
     * @return 查询结果集
     * @throws SQLException 
     */
    protected ResultSet executeQuery(String sql, Object... params) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return rs;
    }
}
