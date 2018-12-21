package Dao;

import java.util.List;

import entity.User;

public interface  UserDao {
  //验证用户名和密码
	public  User denglu(Object...user);

	public int regist(User user);

	public User selectName(String loginName);

	public List<User> selectUserAll();

	public int deleteUser(Object id);
}
