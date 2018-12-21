package Serviceimp;

import java.util.ArrayList;
import java.util.List;
import utill.product_categoryVo;
import Daoimp.product_categoryDaoimp;
import Service.product_categoryDaoService;
import entity.product_category;

public class product_categoryDaoServiceimp implements
		product_categoryDaoService {

	// 查询全部商品
	@Override
	public List<product_categoryVo> queryAllProductCategoryList() {
		// TODO Auto-generated method stub
		product_categoryDaoimp p = new product_categoryDaoimp();
		List<product_categoryVo> productCategory1VoList = new ArrayList<product_categoryVo>();
		// 查询一级分类
		List<product_category> productCategory1List = p.yijishangpin();
		// 遍历一级分类
		for (product_category product1Category : productCategory1List) {
			// 封装一级分类
			product_categoryVo productCategoryVo = new product_categoryVo();
			productCategoryVo.setProduct_category(product1Category);

			// new一个list，把一级分类的孩子（二级）放进这个list
			List<product_categoryVo> productCategoryVo1ChildList = new ArrayList<product_categoryVo>();

			// 根据一级分类查询二级分类
			List<product_category> productCategory2List = p
					.getProductCategoriesid(product1Category.getId());

			// 遍历根据一级查询出来的二级
			for (product_category productCategory2 : productCategory2List) {

				product_categoryVo productCategoryVo2 = new product_categoryVo();
				// 把孩子（二级）放进list里面
				productCategoryVo1ChildList.add(productCategoryVo2);
				productCategoryVo2.setProduct_category(productCategory2);

				// new list 准备放二级的孩子（三级）
				List<product_categoryVo> productCategoryVo2ChildList = new ArrayList<product_categoryVo>();
				productCategoryVo2
						.setProductDaXiangzi(productCategoryVo2ChildList);

				// 根据二级分类查询三级分类的列表
				List<product_category> productCategory3List = p
						.getProductCategoriesid(productCategory2.getId());
				for (product_category productCategory3 : productCategory3List) {
					product_categoryVo productCategoryVo3 = new product_categoryVo();
					// 把三级放进vo里
					productCategoryVo3.setProduct_category(productCategory3);
					// 再把每一个vo都放进list里面
					productCategoryVo2ChildList.add(productCategoryVo3);
				}
			}
			// 把一级的孩子放进一级的vo
			productCategoryVo.setProductDaXiangzi(productCategoryVo1ChildList);
			// 再把vo放进一级的list里面
			productCategory1VoList.add(productCategoryVo);

		}
		// 返回一级的list
		return productCategory1VoList;
	}

}
