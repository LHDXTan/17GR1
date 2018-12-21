package com.dao;

import java.util.List;

import com.entity.Product;
import com.entity.Product_category;

public interface ProductDao {

	//鏌ヨ涓�骇鍒嗙被鍒楄〃
	public List<Product_category> yiji_fenlei();
	
	//鏍规嵁涓婄骇id鏌ヨ鐖跺垎绫籭d涓轰笂绾d鍒嗙被鐨勫垪琛�
	public List<Product_category> parentId_fenlei(int id);
	
	//鏍规嵁涓夌骇id鏌ヨ鎵�睘鍟嗗搧
	public List<Product> sjid_select(int id);
	
	//鏍规嵁鏍规嵁id鏌ヨ鍟嗗搧
	public Product id_select_shangpin(int id);
}
