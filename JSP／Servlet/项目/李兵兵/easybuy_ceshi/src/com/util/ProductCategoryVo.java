package com.util;

import java.util.List;

import com.entity.Product_category;

public class ProductCategoryVo {
	private Product_category product_category;
	private List<Product_category> productXiangzi;
	private List<ProductCategoryVo> productDaXiangzi;

	public Product_category getProduct_category() {
		return product_category;
	}

	public void setProduct_category(Product_category product_category) {
		this.product_category = product_category;
	}

	public List<Product_category> getProductXiangzi() {
		return productXiangzi;
	}

	public void setProductXiangzi(List<Product_category> productXiangzi) {
		this.productXiangzi = productXiangzi;
	}

	public List<ProductCategoryVo> getProductDaXiangzi() {
		return productDaXiangzi;
	}

	public void setProductDaXiangzi(List<ProductCategoryVo> productDaXiangzi) {
		this.productDaXiangzi = productDaXiangzi;
	}

	
	
}
