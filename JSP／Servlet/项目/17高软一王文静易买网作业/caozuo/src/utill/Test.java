package utill;

import java.util.List;

import Serviceimp.product_categoryDaoServiceimp;
import entity.product_category;
import utill.product_categoryVo;

public class Test {
public static void main(String[] args) {
	product_categoryDaoServiceimp p=new product_categoryDaoServiceimp();
	List<product_categoryVo> queryAllProductCategoryList = p.queryAllProductCategoryList();
	for(product_categoryVo v: queryAllProductCategoryList){
		   product_category product_category = v.getProduct_category();
		System.out.println(product_category.getName());
		System.out.println(":");
		List<product_categoryVo> productDaXiangzi = v.getProductDaXiangzi();
		for(product_categoryVo x: productDaXiangzi){
			product_category xx = x.getProduct_category();
			System.out.print(xx.getName());
			System.out.print(":");
			List<product_categoryVo> productDaXiangzi2 = x.getProductDaXiangzi();
			
		
		}
	
		
	}
	
}
}
