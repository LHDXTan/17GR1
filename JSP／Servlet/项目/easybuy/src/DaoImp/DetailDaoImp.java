package DaoImp;

import entity.Detail;
import Dao.BaseDao;
import Dao.DetailDao;

public class DetailDaoImp extends BaseDao implements DetailDao {

	@Override
	public int insertDetail(Detail detail) {
		String sql="insert into detail(orderId,productId,quantity,cost) values(?,?,?,?);";
		Object[] params={detail.getOrderId(),detail.getProductId(),detail.getQuantity(),detail.getCost()};
		
		return super.executeUpdate(sql, params);
	}

}
