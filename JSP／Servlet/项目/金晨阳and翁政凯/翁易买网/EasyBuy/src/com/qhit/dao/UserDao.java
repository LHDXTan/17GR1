package com.qhit.dao;
import java.util.List;
import com.qhit.entity.User;

public interface UserDao {
	//用户注册
	public int inserUser_Dao(User user);
	//查询用户
	public User selectUser_Dao(String name,String password);
	//查询所有用户。
	public List<User> selectallUser_Dao();
	//查询此用户。
	public User selectUserGetid_Dao(int id);
}
