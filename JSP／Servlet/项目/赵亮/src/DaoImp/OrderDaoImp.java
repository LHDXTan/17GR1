package DaoImp;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.BaseDao;
import Dao.OrderDao;
import entity.Order;
public class OrderDaoImp extends BaseDao implements OrderDao{

	@Override
	public int InsertOrder(Order order) {
		String sql="insert into orders(userId,loginName,userAddress,createTime,cost,status,type,serialNumber) values(?,?,?,?,?,?,?,?)" ;
		Object[] params ={order.getUserId(),order.getLoginName(),order.getUserAddress(),order.getCreateTime(),order.getCost(),order.getStatus(),order.getType(),order.getSerialNumber()};
		return super.executeUpdate(sql, params);
		 
	}

	@Override
	public Order selectId(String serialNumber) {
		String sql="select * from orders where serialNumber=?";
		ResultSet rs = super.executeQuery(sql, serialNumber);
		
		Order  order=null;
		if(rs!=null){
			try {
				while(rs.next()){
					order = new Order();
					order.setCost(rs.getDouble("cost"));
					order.setCreateTime(rs.getDate("createTime"));
					order.setId(rs.getInt("id"));
					order.setLoginName(rs.getString("loginName"));
					order.setSerialNumber(rs.getString("serialNumber"));
					order.setStatus(rs.getInt("status"));
					order.setType(rs.getInt("type"));
					order.setUserAddress(rs.getString("userAddress"));
					order.setUserId(rs.getString("userId"));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return order;
	}

	@Override
	public List<Order> selectList(Object id) {
		String sql="select * from orders where userId=?";
		ResultSet rs = super.executeQuery(sql, id);
		List<Order> list =new ArrayList<Order>();
		
		Order  order=null;
		if(rs!=null){
			try {
				while(rs.next()){
					order = new Order();
					order.setCost(rs.getDouble("cost"));
					order.setCreateTime(rs.getDate("createTime"));
					order.setId(rs.getInt("id"));
					order.setLoginName(rs.getString("loginName"));
					order.setSerialNumber(rs.getString("serialNumber"));
					order.setStatus(rs.getInt("status"));
					order.setType(rs.getInt("type"));
					order.setUserAddress(rs.getString("userAddress"));
					order.setUserId(rs.getString("userId"));
					list.add(order);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<Order> selectList() {
		String sql="select * from orders";
		ResultSet rs = super.executeQuery(sql);
		List<Order> list =new ArrayList<Order>();
		
		Order  order=null;
		if(rs!=null){
			try {
				while(rs.next()){
					order = new Order();
					order.setCost(rs.getDouble("cost"));
					order.setCreateTime(rs.getDate("createTime"));
					order.setId(rs.getInt("id"));
					order.setLoginName(rs.getString("loginName"));
					order.setSerialNumber(rs.getString("serialNumber"));
					order.setStatus(rs.getInt("status"));
					order.setType(rs.getInt("type"));
					order.setUserAddress(rs.getString("userAddress"));
					order.setUserId(rs.getString("userId"));
					list.add(order);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	

	

}
