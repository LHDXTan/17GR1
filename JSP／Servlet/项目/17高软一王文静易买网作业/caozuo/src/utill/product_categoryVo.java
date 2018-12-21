package utill;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;



import entity.product;
import entity.product_category;
/**
 * Created by bdqn on 2016/4/25.
 */
public class product_categoryVo {

	//三個參數
	
	private product_category product_category;
	private List<product_category> productXiangzi;
	private List<product_categoryVo> productDaXiangzi;
	public product_category getProduct_category() {
		return product_category;
	}

	public void setProduct_category(product_category product_category) {
		this.product_category = product_category;
	}

	public List<product_category> getProductXiangzi() {
		return productXiangzi;
	}

	public void setProductXiangzi(List<product_category> productXiangzi) {
		this.productXiangzi = productXiangzi;
	}

	public List<product_categoryVo> getProductDaXiangzi() {
		return productDaXiangzi;
	}

	public void setProductDaXiangzi(List<product_categoryVo> productDaXiangzi) {
		this.productDaXiangzi = productDaXiangzi;
	}
	
	
    


   
}
