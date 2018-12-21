package Service;

import java.util.List;

import utill.product_categoryVo;
import entity.product_category;

public interface product_categoryDaoService {
//查询全部商品		
	public List<product_categoryVo> queryAllProductCategoryList();
	

}
