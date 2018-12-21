package Dao;

import entity.User;
public interface UserDao{
	//查找是否登录成功
	public User findUser(String userName, String password);	
	//判斷手機號
	public User SelectName(String name);
	//添加用戶信息
	public int SelectUser(User user);
	
}