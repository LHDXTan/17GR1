package cn.easybuy.dao.product;
import cn.easybuy.dao.IBaseDao;
import cn.easybuy.entity.OrderDetail;
import cn.easybuy.entity.ProductCategory;
import cn.easybuy.entity.User;
import cn.easybuy.param.OrderDetailParam;
import cn.easybuy.param.ProductCategoryParam;
import cn.easybuy.utils.Params;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
public interface ProductCategoryDao extends IBaseDao {
	void deleteById(Integer parseLong);//删除商品分类
	//用id查商品
	public ProductCategory queryProductCategoryById(Integer id);
	public List<ProductCategory> queryProductCategorylist(ProductCategoryParam param);
	
	public List<ProductCategory> queryAllProductCategorylist(ProductCategoryParam param);
	
	public Integer save(ProductCategory productCategory) ;
	
	public Integer queryProductCategoryCount(ProductCategoryParam param);
	//修改
	public void update(ProductCategory productCategory) ;
}
