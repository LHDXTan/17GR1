package Daoimp;
import java.sql.ResultSet;
import java.sql.SQLException;
import Dao.BaseDao;
import Dao.UserDao;
import entity.User;
public class UserDaoImp extends BaseDao implements UserDao {
	public User findUser(String uname, String password) {
		User user = null;
		ResultSet rs = null;
		// 根据用户名密码查找匹配的用户
		String sql = "select * from easybuy_user where loginName=? and password=?";
		try {
			Object[] objects = {uname,password};
			 rs = this.executeQuery(sql, objects);
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt("Id"));
				user.setUserName(rs.getString("userName"));
				user.setLoginName(rs.getString("loginName"));
				user.setMobile(rs.getString("mobile"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getString("sex"));
				user.setType(rs.getInt("type"));
				user.setEmail(rs.getString("email"));
				//user.setIdentityCode(rs.getDate("identityCode"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, null, rs);
		}
		return user;
	}

	// 查名字是否存在
	@Override
	public User SelectName(String name) {
		ResultSet resultSet = null;
		User user = null;
		Object[] objects = { name };
		String sql = "select * from easybuy_user where loginName=?";
		resultSet = this.executeQuery(sql, objects);
		try {
			if (resultSet.next()) {
				user = new User();
				user.setId(resultSet.getInt("Id"));
				user.setUserName(resultSet.getString("userName"));
				user.setLoginName(resultSet.getString("loginName"));
				user.setMobile(resultSet.getString("mobile"));
				user.setPassword(resultSet.getString("password"));
				user.setSex(resultSet.getString("sex"));
				user.setType(resultSet.getInt("type"));
				user.setEmail(resultSet.getString("email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(conn, null, resultSet);
		}
		return user;
	}

	// 添加用戶
	@Override
	public int SelectUser(User user) {
		int update = 0;
		Object[] object = {user.getLoginName(),user.getPassword(),
				user.getEmail(), user.getMobile()};
		String sql = "insert into easybuy_user(loginName,password,email,mobile) value(?,?,?,?)";
		update = this.executeUpdate(sql, object);
		return update;
	}
}
