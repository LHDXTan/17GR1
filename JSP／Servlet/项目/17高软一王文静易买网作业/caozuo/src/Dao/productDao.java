package Dao;

import java.util.List;

import entity.product;

public interface productDao {
	//用id 查找三級分类下的商品的信息
	public List<product> select_shanji_id(int id);
	//用id查找商品
	public product select_id(int id);
	
	

}
