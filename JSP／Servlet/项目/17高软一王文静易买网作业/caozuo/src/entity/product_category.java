package entity;
//商品分类表
public class product_category {
//	编号
private int id;	
//名字
private String name;	
//父分类
private int parentId;	
//类型 1一级分类 2二级分类 3三级分类
private int type;
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
