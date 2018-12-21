package com.qhit.server.imp;

import com.qhit.dao.imp.UserDaoImp;
import com.qhit.entity.User;
import com.qhit.server.UserServer;

public class UserServerImp implements UserServer{
	
	UserDaoImp ud = new UserDaoImp();
	//注册
	public int inserUser_Server(User user) {
		int inserUser_Dao = ud.inserUser_Dao(user);
		if(inserUser_Dao >= 1){//注册成功，-->查询用户。
			return inserUser_Dao;
		}else{
			return 0;
		}
	}
	
	//查询用户，登陆
	public User selectUser_Server(String name, String password) {
		User selectUser_Dao = ud.selectUser_Dao(name, password);
		if(selectUser_Dao != null){//用户存在
			if(name.equals(selectUser_Dao.getLoginName())&&password.equals(selectUser_Dao.getPassword())){//账号密码正确
				return selectUser_Dao;
			}else{//账号密码错误
				return null;
			}
		}else{//用户不存在
			return null;
		}
	}
}
