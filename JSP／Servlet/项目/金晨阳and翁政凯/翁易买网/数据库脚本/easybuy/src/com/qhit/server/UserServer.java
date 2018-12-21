package com.qhit.server;

import com.qhit.entity.User;

public interface UserServer {
	//注册
	public int inserUser_Server(User user);
	//查询用户
	public User selectUser_Server(String name,String password);
}
