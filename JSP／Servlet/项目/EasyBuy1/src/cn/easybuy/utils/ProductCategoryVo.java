package cn.easybuy.utils;

import cn.easybuy.entity.Product;
import cn.easybuy.entity.ProductCategory;

import java.io.Serializable;
import java.util.List;

public class ProductCategoryVo implements Serializable {

	private static final long serialVersionUID = 5639709797629577150L;
	private ProductCategory productCategory;
	private List<ProductCategoryVo> productCategoryVoList;
	private List<Product> productList;

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	public List<ProductCategoryVo> getProductCategoryVoList() {
		return productCategoryVoList;
	}

	public void setProductCategoryVoList(
			List<ProductCategoryVo> productCategoryVoList) {
		this.productCategoryVoList = productCategoryVoList;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
}
