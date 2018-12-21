package com.service;

import java.util.List;

import com.util.ProductCategoryVo;

public interface ProductCategoryService {

	//查询全部商品分类
	
	public List<ProductCategoryVo> queryAllProductCategoryList();
	
}
