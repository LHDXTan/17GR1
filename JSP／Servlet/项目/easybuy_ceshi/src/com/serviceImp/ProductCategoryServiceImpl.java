package com.serviceImp;

import java.util.ArrayList;
import java.util.List;

import com.daoimp.ProductDaoImp;
import com.entity.Product_category;
import com.service.ProductCategoryService;
import com.util.ProductCategoryVo;

public class ProductCategoryServiceImpl implements ProductCategoryService{
	
	/*
	 * 查询全部商品列表(non-Javadoc)
	 * @see com.service.ProductCategoryService#queryAllProductCategoryList()
	 */
	@Override
	public List<ProductCategoryVo> queryAllProductCategoryList() {
		// TODO Auto-generated method stub
		ProductDaoImp p=new ProductDaoImp();
		List<ProductCategoryVo> productCategory1VoList=new ArrayList<ProductCategoryVo>();
		//查询一级分类
		List<Product_category> productCategory1List  = p.yiji_fenlei();
		//遍历一级分类
		for(Product_category product1Category:productCategory1List){
			//封装一级分类
            ProductCategoryVo productCategoryVo = new ProductCategoryVo();
            productCategoryVo.setProduct_category(product1Category);
            
            //new一个list，把一级分类的孩子（二级）放进这个list
            List<ProductCategoryVo> productCategoryVo1ChildList = new ArrayList<ProductCategoryVo>();
            
            //根据一级分类查询二级分类
            List<Product_category> productCategory2List  = p.parentId_fenlei(product1Category.getId());
            
            //遍历根据一级查询出来的二级
            for(Product_category productCategory2:productCategory2List){
            	
            	 ProductCategoryVo productCategoryVo2 = new ProductCategoryVo();
            	 //把孩子（二级）放进list里面
            	 productCategoryVo1ChildList.add(productCategoryVo2);
            	 productCategoryVo2.setProduct_category(productCategory2);
            	//new list 准备放二级的孩子（三级）
            	 List<ProductCategoryVo> productCategoryVo2ChildList = new ArrayList<ProductCategoryVo>();
            	 productCategoryVo2.setProductDaXiangzi(productCategoryVo2ChildList);
            	 
            	 //根据二级分类查询三级分类的列表
            	 List<Product_category> productCategory3List  = p.parentId_fenlei(productCategory2.getId());
            	 for(Product_category productCategory3:productCategory3List){
            		 ProductCategoryVo productCategoryVo3 = new ProductCategoryVo();
            		//把三级放进vo里
                     productCategoryVo3.setProduct_category(productCategory3);
                   //再把每一个vo都放进list里面
                     productCategoryVo2ChildList.add(productCategoryVo3);
            	 }
            }
            //把一级的孩子放进一级的vo
            productCategoryVo.setProductDaXiangzi(productCategoryVo1ChildList);
            //再把vo放进一级的list里面
            productCategory1VoList.add(productCategoryVo);
            
		}
		//返回一级的list
		return productCategory1VoList;
	}

}
