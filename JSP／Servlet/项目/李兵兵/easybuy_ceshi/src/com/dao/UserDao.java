package com.dao;

import com.entity.User;

public interface UserDao {
	//注册
	public int add_User(String loginName,String userName,String password,String sex,String identityCode,String email,String mobile,int type);
	//登录
	public User login(String name);

}
