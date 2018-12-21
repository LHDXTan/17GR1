package cn.easybuy.service.Impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import cn.easybuy.dao.UserDao;
import cn.easybuy.dao.Impl.UserDaoImpl;
import cn.easybuy.service.UserService;
import cn.easybuy.utils.DataSourceUtil;
import cn.easybuy.entity.User;

public class UserServiceImpl implements UserService {

	@SuppressWarnings("finally")
	@Override
	public boolean add(User user) {
		Connection connection = null;
		Integer count = 0;
		try {
			connection = DataSourceUtil.openConnection();
			UserDao userDao = new UserDaoImpl(connection);
			count = userDao.add(user);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return count > 0;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public boolean update(User user) {
		Connection connection = null;
		Integer count = 0;
		try {
			connection = DataSourceUtil.openConnection();
			UserDao userDao = new UserDaoImpl(connection);
			count = userDao.update(user);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return count > 0;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public boolean deleteUserById(Integer userId) {
		Connection connection = null;
		Integer count = 0;
		try {
			connection = DataSourceUtil.openConnection();
			UserDao userDao = new UserDaoImpl(connection);
			count = userDao.deleteUserById(userId + "");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return count > 0;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public User getUser(Integer userId, String loginName) {
		Connection connection = null;
		User user = null;
		try {
			connection = DataSourceUtil.openConnection();
			UserDao userDao = new UserDaoImpl(connection);
			user = userDao.getUser(userId, loginName);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return user;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public List<User> getUserList(Integer currentPageNo, Integer pageSize) {
		Connection connection = null;
		List<User> userList = null;
		try {
			connection = DataSourceUtil.openConnection();
			UserDao userDao = new UserDaoImpl(connection);
			userList = userDao.getUserList(currentPageNo, pageSize);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return userList;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public int count() {
		Connection connection = null;
		Integer count = null;
		try {
			connection = DataSourceUtil.openConnection();
			UserDao userDao = new UserDaoImpl(connection);
			count = userDao.count();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return count;
		}
	}
}
