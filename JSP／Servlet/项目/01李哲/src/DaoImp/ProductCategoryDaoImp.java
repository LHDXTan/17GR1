package DaoImp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.news.util.ProductCategoryVo;

import Dao.BaseDao;
import Dao.ProductCategoryDao;
import entity.ProductCategory;

public class ProductCategoryDaoImp extends BaseDao implements ProductCategoryDao{

	@Override
	public List<ProductCategory> getProductCategoryName(Object... pro) {
		String sql="select * from product_category where type=3";
		ResultSet rs = super.executeQuery(sql, pro);
		List<ProductCategory> products=new ArrayList<ProductCategory>();
		if(rs!=null){
			try {
				while(rs.next()){
					ProductCategory produ = new 	ProductCategory();
					produ.setId(rs.getInt("id"));
					produ.setName(rs.getString("name"));
					produ.setParentld(rs.getInt("parentld"));
					produ.setType(rs.getInt("type"));
					products.add(produ);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return products;
	}
	@Override
	public List<ProductCategory> getProductCategory(Object... pro) {
		String sql="select * from product_category where parentld=? ";
		ResultSet rs = super.executeQuery(sql, pro);
		List<ProductCategory> products=new ArrayList<ProductCategory>();
		if(rs!=null){
			try {
				while(rs.next()){
				  ProductCategory produ = new 	ProductCategory();
				  produ.setId(rs.getInt("id"));
				  produ.setName(rs.getString("name"));
				  produ.setParentld(rs.getInt("parentld"));
				  produ.setType(rs.getInt("type"));
				  products.add(produ);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return products;
	}

	@Override
	public List<ProductCategoryVo> getProvo() {
		//最终三级 VoList 储存箱
		List<ProductCategoryVo> VoList = new ArrayList<ProductCategoryVo>();
		//查询第一ID 集合
		List<ProductCategory> list =getProductCategory(0);
		//便利一级
		for (ProductCategory productCategory : list) {
			//一级vo  里面要加 入 本级商品列表  和2级VO集合
			ProductCategoryVo vo = new ProductCategoryVo();
			//把商品列表加入进去
			vo.setProductCategory(productCategory);
			//创建vo2二级 储存箱
			List<ProductCategoryVo> VoList2=new ArrayList<ProductCategoryVo>();
			//2级商品列表
			List<ProductCategory> list2 = getProductCategory(productCategory.getId());
			//便利2级
			for (ProductCategory productCategory2 : list2) {
				//2级vo  里面要加 入 本级商品列表  和3级VO集合
				ProductCategoryVo vo2 = new ProductCategoryVo();
				  vo2.setProductCategory(productCategory2);
				  
				  //创建vo2二级 储存箱
				  List<ProductCategoryVo> VoList3=new ArrayList<ProductCategoryVo>();
				  //2级商品列表
				  List<ProductCategory> list3 = getProductCategory(productCategory2.getId());
				  for (ProductCategory productCategory3 : list3) {
					  //3级vo  里面要加 入 本级商品列表  
					  ProductCategoryVo vo3 = new ProductCategoryVo();
					  vo3.setProductCategory(productCategory3);
					  VoList3.add(vo3);
					
				}
				  vo2.setProductCategoryVoList(VoList3);
				  VoList2.add(vo2);
			}
			
			
			
			vo.setProductCategoryVoList(VoList2);
			
			VoList.add(vo);
		}
		
		
		
		
		/*int i=0;
		for (ProductCategoryVo productCategoryVo : Vo1) {
			i++;
			ProductCategory productCategory = productCategoryVo.getProductCategory();
			if(productCategory!=null){
				System.out.println(productCategory.getName());
				
			}
		}
		System.out.println(i);*/
		return VoList;
	}

}
