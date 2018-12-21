package com.qhit.dao;
import com.qhit.entity.User;

public interface UserDao {
	//用户注册
	public int inserUser_Dao(User user);
	//查询用户
	public User selectUser_Dao(String name,String password);
}
