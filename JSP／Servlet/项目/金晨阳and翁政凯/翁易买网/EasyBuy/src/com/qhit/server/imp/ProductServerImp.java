package com.qhit.server.imp;
import java.util.ArrayList;
import java.util.List;

import com.qhit.dao.imp.Product_CategoryDaoImp;
import com.qhit.entity.Product;
import com.qhit.entity.Product_Category;
import com.qhit.server.ProductServer;
import com.qhit.util.MemcachedUtils;
import com.qhit.util.ProductCategoryVo;

public class ProductServerImp implements ProductServer{
	
	Product_CategoryDaoImp pacd = new Product_CategoryDaoImp();
	//查询全部的商品分类
	public List<ProductCategoryVo> queryAllProductCategoryList() {
		//查询一级分类的列表
		List<ProductCategoryVo> productCategory1VoList = new ArrayList<ProductCategoryVo>();
		 //查询一级分类
		List<Product_Category> selectVo_Dao = pacd.selectVo_Dao();
		 //遍历一级分类,根据一级ID查询二级分类-->id默认为 1
		for (Product_Category product_Category : selectVo_Dao) {
			//util工具类
			ProductCategoryVo productCategoryVo = new ProductCategoryVo();
			//productCategoryVo里Product_Category(商品分类表)--》查询处对象放到util里
			productCategoryVo.setProductCategory(product_Category);
			//存放二级对象的list集合
			List<ProductCategoryVo> productCategoryVo1ChildList = new ArrayList<ProductCategoryVo>();
			//根据一级商品 ID查询二级分类
			List<Product_Category> productCategory2List = pacd.selectVo_Dao_er(product_Category.getId());
			//遍历productCategory2List
			for (Product_Category product_Category2 : productCategory2List) {
				ProductCategoryVo productCategoryVo2 = new ProductCategoryVo();
				//查询二、三级对象。存放到集合中
				productCategoryVo1ChildList.add(productCategoryVo2);
				//对象存放到工具类当中。
				productCategoryVo2.setProductCategory(product_Category2);
				//存放三级结果的list集合
				List<ProductCategoryVo> productCategoryVo2ChildList = new ArrayList<ProductCategoryVo>();
				//productCategoryVo2中属性，集合list.将结果放到productCategoryVo2中
				productCategoryVo2.setProductCategoryVoList(productCategoryVo2ChildList);
				//查询三级商品
				List<Product_Category> selectVo_Dao_er = pacd.selectVo_Dao_er(product_Category2.getId());
				//遍历三级商品
				for (Product_Category product_Category3 : selectVo_Dao_er) {
					ProductCategoryVo productCategoryVo3 = new ProductCategoryVo();
					//将对象存放到productCategoryVo中
					 productCategoryVo3.setProductCategory(product_Category3);
					 //将对象存放到list中--》productCategoryVo
					 productCategoryVo2ChildList.add(productCategoryVo3);
				}
			}
		//把一级对象list集合方法放到productCategoryVo中
		productCategoryVo.setProductCategoryVoList(productCategoryVo1ChildList);
        //再把productCategoryVo放进一级的list里面-->做返回，这样就返回了所有的一级、二级、三级商品。
        productCategory1VoList.add(productCategoryVo);
		}
		return productCategory1VoList;
	}
	//查询新闻列表
	public List<Product> selectProductSer(int id) {
		return pacd.selectProductDao(id);
	}
	
	//根据ID查询商品列表
	public List<Product> selectId_ProductSer(int id) {
		return pacd.selectId_ProductDao(id);
	}
	
	//加入後無車
	public Product addProductSer(int id) {
		//根据id查询商品，返回对象
		Product addProductDao = pacd.addProductDao(id);
		//把商品对象添加到集合中。
		MemcachedUtils.add("Product", addProductDao);
		//取出商品对象，返回一个对象。
		Product object =(Product) MemcachedUtils.get("Product");
		System.out.println("servcei\t"+object);
		return object;
	}
	
}
