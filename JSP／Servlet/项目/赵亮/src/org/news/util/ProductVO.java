package org.news.util;

import java.util.List;

import entity.Product;
import entity.ProductCategory;

public class ProductVO {
   private List<Product> productList;
   private  ProductCategory  pro;
   private Product product;
   private  NameSan names;
   
public NameSan getNames() {
	return names;
}

public void setNames(NameSan names) {
	this.names = names;
}

public Product getProduct() {
	return product;
}

public void setProduct(Product product) {
	this.product = product;
}


public List<Product> getProductList() {
	return productList;
}

public void setProductList(List<Product> productList) {
	this.productList = productList;
}

public ProductCategory getPro() {
	return pro;
}

public void setPro(ProductCategory pro) {
	this.pro = pro;
}


   
} 
