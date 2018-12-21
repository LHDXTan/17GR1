package com.entity;

public class Order {

	private int id;
	private String userId;
	private String loginName;
	private String userAddress;
	private String createTime;
	private float cost;
	private int status;//1代审核 2审核通过 3配货 4卖家已发货 5已收货
	private int type;
	private int serilNumber;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getSerilNumber() {
		return serilNumber;
	}
	public void setSerilNumber(int serilNumber) {
		this.serilNumber = serilNumber;
	}

	
	
}
