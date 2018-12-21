package com.util;

import java.util.List;

import com.entity.Product_category;
import com.serviceImp.ProductCategoryServiceImpl;

public class Demo {

	public static void main(String[] args) {
		
		ProductCategoryServiceImpl p=new ProductCategoryServiceImpl();
		List<ProductCategoryVo> queryAllProductCategoryList = p.queryAllProductCategoryList();
		for(ProductCategoryVo v: queryAllProductCategoryList){
			Product_category product_category = v.getProduct_category();
			System.out.println(product_category.getName());
			System.out.print(":");
			List<ProductCategoryVo> productDaXiangzi = v.getProductDaXiangzi();
			
		for(ProductCategoryVo x: productDaXiangzi){
				Product_category xx = x.getProduct_category();
				System.out.print(xx.getName());
				System.out.print(":");
				List<ProductCategoryVo> productDaXiangzi2 = x.getProductDaXiangzi();
				for(ProductCategoryVo y: productDaXiangzi2){
					Product_category yy = x.getProduct_category();
					System.out.print(yy.getName());
					
					
				
				}
			
				
				
				
				
			}
		
			
		}
		
	}
}
