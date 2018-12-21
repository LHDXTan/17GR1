package com.entity;

public class Product_category {

	private int id;
	private String name;
	private int parentId;//父分类
	private int type;//1一级分类 2二级分类 3三级分类
	
	
	public Product_category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product_category(int id, String name, int parentId, int type) {
		super();
		this.id = id;
		this.name = name;
		this.parentId = parentId;
		this.type = type;
	}
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
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
	
}
