package com.qhit.entity;

/**
 * @author 商品分类表
 */
public class Product_Category {

	private int id;			//编号
	private String name;	//名字
	private int parentld;	//父分类
	private int type;		//类型   1:一级分类    2:二级分类    3:三级分类
	
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
	public int getParentld() {
		return parentld;
	}
	public void setParentld(int parentld) {
		this.parentld = parentld;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
