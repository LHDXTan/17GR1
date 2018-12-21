package com.qhit.dao;
import java.util.List;

import com.qhit.entity.Product;
import com.qhit.entity.Product_Category;
import com.qhit.util.ProductCategoryVo;

/**
 * @author 凯
 * 商品DAO
 */
public interface Product_CategoryDao {
	//查询商品分类列表
	public List<Product_Category> selectVo_Dao();
	//根据三级查询商品列表
	public List<Product> selectProductDao(int id);
	//根据ID查询商品列表
	public List<Product> selectId_ProductDao(int id);
	//加入後無車
	public Product addProductDao(int id);
	//查询全部商品
	public List<Product> selectallProductDao();
	//查询商品分类列表
	public List<Product_Category> selectProduct_Category_Dao(int id);
	//商品添加
	public int insertProduct_Dao(Product product);
	//查询全部商品分类列表
	public List<Product_Category> selectProduct_Category_Dao();
	//删除分类商品
	public int deteleProduct_Category_Dao(int id);
	//删除商品
	public int deteleProduct_Dao(int id);
}