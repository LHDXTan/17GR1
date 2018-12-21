package Dao;

import java.util.List;

import entity.Product;

public interface ProductDao {
  //查询所有商品
	 List<Product> getProductAll(String name);

	List<Product> getProductId(int id);

	Product selectProductID(int id);

	String selectParentId(Object caregoryLevel1);

	List<Product> selectProductList(Object i, Object j);

	int selectProductCount();

	int delectProduct(Object count);
}
