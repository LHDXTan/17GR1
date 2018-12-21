package DaoImp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.BaseDao;
import Dao.DetailDao;
import entity.Detail;

public class DetailDaoImp extends BaseDao implements DetailDao {

	@Override
	public int insertDetail(Detail detail) {
		String sql="insert into detail(orderId,productId,quantity,cost) values(?,?,?,?);";
		Object[] params={detail.getOrderId(),detail.getProductId(),detail.getQuantity(),detail.getCost()};
		
		return super.executeUpdate(sql, params);
	}

	@Override
	public List<Detail> selectDetail(Object id) {
		String sql="select * from detail where orderId=?";
		Object[] obj={id};
		ResultSet rs = super.executeQuery(sql, obj);
		List<Detail> list =new ArrayList<Detail>();
		
		Detail detail=null;
		if(rs!=null){
			try {
				while(rs.next()){
					detail=new Detail();
					detail.setCost(rs.getDouble("cost"));
					detail.setId(rs.getInt("id"));
					detail.setOrderId(rs.getInt("orderId"));
					detail.setProductId(rs.getInt("productId"));
					detail.setQuantity(rs.getInt("quantity"));
					list.add(detail);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return list;
	}

}
