package com.qhit.entity;

/**
 * @author 订单详情表
 */
public class Order_Detail {

	
	private int id;			//编号
	private int orderld;	//订单ID
	private int productld;	//商品ID
	private int quantity;	//数量
	private float cost;		//金额
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderld() {
		return orderld;
	}
	public void setOrderld(int orderld) {
		this.orderld = orderld;
	}
	public int getProductld() {
		return productld;
	}
	public void setProductld(int productld) {
		this.productld = productld;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
}
