package Daoimp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.product;
import Dao.BaseDao;
import Dao.productDao;

public class productDaoimp extends BaseDao implements productDao {
	@Override
	public List<product> select_shanji_id(int id) {
		ResultSet rs = null;
		product product = null;
		ArrayList<product> list = new ArrayList<product>();
		Object[] objects = { id };
		String sql = "select * from easybuy_product where categoryLevel3Id=?";
		// TODO Auto-generated method stub
		rs = this.executeQuery(sql, objects);
		try {
			while (rs.next()) {
				product = new product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setPrice(rs.getFloat("price"));
				product.setStock(rs.getInt("stock"));
				product.setCategoryLevel1(rs.getInt("categoryLevel1"));
				product.setCategoryLevel2(rs.getInt("categoryLevel2"));
				product.setCategoryLevel3(rs.getInt("categoryLevel3"));
				product.setFileName(rs.getString("fileName"));
				product.setIsDelete(rs.getInt("isDelete"));
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeAll(conn, null, rs);
		}

		return list;
	}

	@Override
	public product select_id(int id) {
		Object[] objects = { id };
		String sql = "select * from easybuy_product where id=?";
		// TODO Auto-generated method stub
		ResultSet rs = null;
		product product = null;
		rs = this.executeQuery(sql, objects);
		try {
			while (rs.next()) {
				product = new product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setPrice(rs.getFloat("price"));
				product.setStock(rs.getInt("stock"));
				product.setCategoryLevel1(rs.getInt("categoryLevel1"));
				product.setCategoryLevel2(rs.getInt("categoryLevel2"));
				product.setCategoryLevel3(rs.getInt("categoryLevel3"));
				product.setFileName(rs.getString("fileName"));
				product.setIsDelete(rs.getInt("isDelete"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeAll(conn, null, rs);
		}
		return product;
	}

}
