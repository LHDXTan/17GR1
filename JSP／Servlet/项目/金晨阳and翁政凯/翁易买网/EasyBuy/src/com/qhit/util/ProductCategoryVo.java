package com.qhit.util;

import java.util.List;

import com.qhit.entity.Product_Category;

public class ProductCategoryVo {

	public Product_Category ProductCategory;
	
	public List<ProductCategoryVo> ProductCategoryVoList;

	public Product_Category getProductCategory() {
		return ProductCategory;
	}
	public void setProductCategory(Product_Category productCategory) {
		ProductCategory = productCategory;
	}
	public List<ProductCategoryVo> getProductCategoryVoList() {
		return ProductCategoryVoList;
	}

	public void setProductCategoryVoList(
			List<ProductCategoryVo> productCategoryVoList) {
		ProductCategoryVoList = productCategoryVoList;
	}
}
