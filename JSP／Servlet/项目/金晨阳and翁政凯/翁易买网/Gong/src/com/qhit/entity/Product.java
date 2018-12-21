package com.qhit.entity;

/**
 * @author 商品表
 */
public class Product {

	private int id;				//商品编号
	private String name;		//商品名字
	private String desciption;	//商品描述
	private float price;		//商品价格
	private int stock;			//商品库存
	private int categorylevel1; //所属一级分类ID
	private int categorylevel2; //所属二级分类ID
	private String categorylevel3;//所属三级分类ID
	private String fileName;		//上传的文件名
	private int isDelete;			//是否删除    1:删除 0:未删除
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesciption() {
		return desciption;
	}
	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getCategorylevel1() {
		return categorylevel1;
	}
	public void setCategorylevel1(int categorylevel1) {
		this.categorylevel1 = categorylevel1;
	}
	public int getCategorylevel2() {
		return categorylevel2;
	}
	public void setCategorylevel2(int categorylevel2) {
		this.categorylevel2 = categorylevel2;
	}
	public String getCategorylevel3() {
		return categorylevel3;
	}
	public void setCategorylevel3(String categorylevel3) {
		this.categorylevel3 = categorylevel3;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
}