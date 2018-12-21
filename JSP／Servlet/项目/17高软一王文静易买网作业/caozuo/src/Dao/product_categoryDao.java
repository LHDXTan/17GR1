package Dao;
import java.util.List;
import entity.product;
import entity.product_category;
public interface product_categoryDao{
	//void deleteById(Integer parseLong);//删除商品分类
	//查询一级分类商品
	public List<product_category> yijishangpin();
//查询子分类  根据父id查询子id
	public List<product_category> getProductCategoriesid(int parentId);
//根据三级id查询所属商品
	public List<product> shanjishangpin(int id);
//根据id查找商品
	public product idshangpin(int id);
	
}
