package org.news.dao;


import org.news.entity.User;

public interface UserDao{
	/**
	 * 查找是否登录成功
	 * @param uname
	 * @param password
	 * @return
	 */
	public User findUser(String uname, String password);		 
}