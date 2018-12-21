package DaoImp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.BaseDao;
import Dao.ProductDao;
import entity.Product;

public class ProductDaoImp  extends BaseDao implements ProductDao{

	@Override
	public List<Product> getProductAll(String name) {
		String sql="select * from product p1,product_category p2 where p1.caregoryLevel3=p2.id and p2.name=?";
		ResultSet rs = super.executeQuery(sql, name);
		List<Product> lists=new ArrayList<Product>();
		
//		if(rs!=null){
			try {
				while(rs.next()){
					Product product = new Product();
					product.setCaregoryLevel1(rs.getInt("caregoryLevel1"));
					product.setCaregoryLevel2(rs.getInt("caregoryLevel2"));
					product.setCaregoryLevel3(rs.getString("caregoryLevel3"));
					product.setDescription(rs.getString("description"));
					product.setFileName(rs.getString("fileName"));
					product.setId(rs.getInt("id"));
					product.setIsDelete(rs.getInt("isDelete"));
					product.setName(rs.getString("name"));
					product.setPrice(rs.getDouble("price"));
					product.setStock(rs.getInt("stock"));
					lists.add(product);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//		}
		return lists;
	}
	@Override
	public List<Product> getProductId(int id) {
		String sql="select *  from product where caregoryLevel3=?";
		ResultSet rs = super.executeQuery(sql, id);
		List<Product> lists=new ArrayList<Product>();
		
//		if(rs!=null){
		try {
			while(rs.next()){
				Product product = new Product();
				product.setCaregoryLevel1(rs.getInt("caregoryLevel1"));
				product.setCaregoryLevel2(rs.getInt("caregoryLevel2"));
				product.setCaregoryLevel3(rs.getString("caregoryLevel3"));
				product.setDescription(rs.getString("description"));
				product.setFileName(rs.getString("fileName"));
				product.setId(rs.getInt("id"));
				product.setIsDelete(rs.getInt("isDelete"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getDouble("price"));
				product.setStock(rs.getInt("stock"));
				lists.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		}
		return lists;
	}
	@Override
	public Product selectProductID(int id) {
		String sql="select *  from product where id=?";
		ResultSet rs = super.executeQuery(sql, id);
		Product product=null;
//		if(rs!=null){
		try {
			while(rs.next()){
				product = new Product();
				product.setCaregoryLevel1(rs.getInt("caregoryLevel1"));
				product.setCaregoryLevel2(rs.getInt("caregoryLevel2"));
				product.setCaregoryLevel3(rs.getString("caregoryLevel3"));
				product.setDescription(rs.getString("description"));
				product.setFileName(rs.getString("fileName"));
				product.setId(rs.getInt("id"));
				product.setIsDelete(rs.getInt("isDelete"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getDouble("price"));
				product.setStock(rs.getInt("stock"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		}
		return product;
	}
	@Override
	public String selectParentId(Object caregoryLevel1) {
		String sql="select name from product_category where id=?";
		ResultSet rs = super.executeQuery(sql, caregoryLevel1);
		String name=null;
		if(rs!=null){
			try {
				while(rs.next()){
					name=rs.getString("name");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return name;
	}

}
