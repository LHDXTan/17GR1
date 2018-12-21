package entity;
  //商品表
public class Product {
	private  int id;   //商品编号
	private  String name; //商品名字
	private String description; //商品描述
	private double price; //商品价格
	private int stock; //商品库存
	private int caregoryLevel1; //所属一级分类ID
	private int caregoryLevel2;//所属二级分类ID
	private String caregoryLevel3;//所属三级分类ID
	private String fileName;//上传文件名
	private int isDelete;//是否删除  1删除   0未删除 
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getCaregoryLevel1() {
		return caregoryLevel1;
	}
	public void setCaregoryLevel1(int caregoryLevel1) {
		this.caregoryLevel1 = caregoryLevel1;
	}
	public int getCaregoryLevel2() {
		return caregoryLevel2;
	}
	public void setCaregoryLevel2(int caregoryLevel2) {
		this.caregoryLevel2 = caregoryLevel2;
	}
	public String getCaregoryLevel3() {
		return caregoryLevel3;
	}
	public void setCaregoryLevel3(String caregoryLevel3) {
		this.caregoryLevel3 = caregoryLevel3;
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
