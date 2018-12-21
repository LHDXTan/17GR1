package Daoimp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.BaseDao;
import Dao.product_categoryDao;
import entity.product;
import entity.product_category;

public class product_categoryDaoimp extends BaseDao implements
		product_categoryDao {
	// 查询一级分类
	@Override
	public List<product_category> yijishangpin() {
		Object[] objects = {};
		product_category product_category = null;
		ResultSet resultSet = null;
		ArrayList<product_category> list = new ArrayList<product_category>();
		String sql = "select * from easybuy_product_category where type='1'";
		resultSet = this.executeQuery(sql, objects);
		try {
			while (resultSet.next()) {
				product_category = new product_category();
				product_category.setParentId(resultSet.getInt("id"));
				product_category.setName(resultSet.getString("name"));
				product_category.setParentId(resultSet.getInt("parentId"));
				product_category.setType(resultSet.getInt("type"));
				list.add(product_category);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeAll(conn, null, resultSet);
		}
		return list;
	}

	// 根据id 查询子
	@Override
	public List<product_category> getProductCategoriesid(int parentId) {
		Object[] objects = {parentId};
		product_category product_category = null;
		ArrayList<product_category> list = new ArrayList<product_category>();
		ResultSet rs = null;
		String sql = "select * from easybuy_product_category where parentId=?";
		// TODO Auto-generated method stub
		rs = this.executeQuery(sql, objects);
		try {
			while (rs.next()) {
				product_category = new product_category();

				product_category.setParentId(rs.getInt("id"));
				product_category.setName(rs.getString("name"));
				product_category.setParentId(rs.getInt("parentId"));
				product_category.setType(rs.getInt("type"));
				list.add(product_category);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeAll(conn, null, rs);
		}
		return list;
	}

	// 根据三级id查询所属商品
	@Override
	public List<product> shanjishangpin(int id) {
		Object[] objects = { id };
		String sql = "select * from easybuy_product where categoryLevel3=?";
		ResultSet resultSet = null;
		resultSet = this.executeQuery(sql, objects);
		ArrayList<product> list = new ArrayList<product>();
		product product = null;
		try {
			while (resultSet.next()) {
				product = new product();
				product.setId(resultSet.getInt("id"));
				product.setName(resultSet.getString("name"));
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getFloat("price"));
				product.setStock(resultSet.getInt("stock"));
				product.setCategoryLevel1(resultSet.getInt("categoryLevel1"));
				product.setCategoryLevel2(resultSet.getInt("categoryLevel2"));
				product.setCategoryLevel3(resultSet.getInt("categoryLevel3"));
				product.setFileName(resultSet.getString("fileName"));
				product.setIsDelete(resultSet.getInt("isDelete"));
				list.add(product);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeAll(conn, null, resultSet);
		}
		return list;
	}

	// 根据id查找商品类的商品
	@Override
	public product idshangpin(int id) {
		Object[] objects = { id };
		product product = null;
		String sql = "select * from easybuy_product where id=?";
		// TODO Auto-generated method stub
		ResultSet resultSet = this.executeQuery(sql, objects);
		try {
			while (resultSet.next()) {
				product = new product();
				product.setId(resultSet.getInt("id"));
				product.setName(resultSet.getString("name"));
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getFloat("price"));
				product.setStock(resultSet.getInt("stock"));
				product.setCategoryLevel1(resultSet.getInt("categoryLevel1"));
				product.setCategoryLevel2(resultSet.getInt("categoryLevel2"));
				product.setCategoryLevel3(resultSet.getInt("categoryLevel3"));
				product.setFileName(resultSet.getString("fileName"));
				product.setIsDelete(resultSet.getInt("isDelete"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}

}
