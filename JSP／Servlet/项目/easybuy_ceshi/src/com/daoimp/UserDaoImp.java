package com.daoimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.BaseDao;
import com.dao.UserDao;
import com.entity.User;

public class UserDaoImp extends BaseDao implements UserDao{

	@Override
	public int add_User(String loginName, String userName, String password,
			String sex, String identityCode, String email, String mobile,
			int type) {
		// TODO Auto-generated method stub
		Connection lianjie = super.lianjie();
		String sql = "insert into easybuy_user values(null,?,?,?,?,?,?,?,?)";
		PreparedStatement pr=null;
		int num=0;
		try {
			pr = lianjie.prepareStatement(sql);
			pr.setString(1, loginName);
			pr.setString(2, userName);
			pr.setString(3, password);
			pr.setString(4, sex);
			pr.setString(5, identityCode);
			pr.setString(6, email);
			pr.setString(7, mobile);
			pr.setInt(8, type);
			 num= pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.guanbi(null, pr, lianjie);
			return num;
	}

	@Override
	public User login(String name) {
		// TODO Auto-generated method stub
		Connection lianjie = super.lianjie();
		String sql = "select * from easybuy_user where loginName=?";
		PreparedStatement pr=null;
		ResultSet re=null;
		User user=null;
		try {
			 pr = lianjie.prepareStatement(sql);
			 pr.setString(1, name);
			 re= pr.executeQuery();
			 if(re!=null){
			 while(re.next()){
				user=new User(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getString(5),re.getString(6),re.getString(7),re.getString(8),re.getInt(9));
			  }
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.guanbi(re, pr, lianjie);
		return user;
	}

}
