package org.news.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.news.dao.BaseDao;
import org.news.dao.UserDao;
import org.news.entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {
    public User findUser(String uname, String password) {
    	Connection con=getConnection();
    	PreparedStatement ps=null;
        User user = null;
        // 根据用户名密码查找匹配的用户
        String sql = "select * from NEWS_USERS where uname=? and upwd=?";
        try {
        	
        	ps = con.prepareStatement(sql);			
			ps.setString(1,uname);
			ps.setString(2,password);
			rs = ps.executeQuery();	
            if (rs.next()) {
                user = new User();
                user.setUid(rs.getInt("uid"));
                user.setUname(uname);
                user.setUpwd(password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(conn, ps, rs);
        }
        return user;
    }
}
