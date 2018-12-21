package com.qhit.server;
import java.util.List;

import com.qhit.entity.Product;
import com.qhit.util.ProductCategoryVo;

public interface ProductServer {
	//查询全部的商品分类
	public List<ProductCategoryVo> queryAllProductCategoryList();
	//根据三级ID查询商品列表
	public List<Product> selectProductSer(int id);
	//根据ID查询商品列表
	public List<Product> selectId_ProductSer(int id);
	//加入後無車
	public Product addProductSer(int id);
	
}
