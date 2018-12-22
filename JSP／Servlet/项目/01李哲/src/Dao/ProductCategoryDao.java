package Dao;

import java.util.List;

import org.news.util.ProductCategoryVo;

import entity.ProductCategory;

public interface ProductCategoryDao {
    //
	public List<ProductCategory> getProductCategory(Object...pro) ;
	
	public List<ProductCategoryVo> getProvo();
	public List<ProductCategory> getProductCategoryName(Object... pro);
}
