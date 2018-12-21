package com.qhit.entity;
import java.util.Date;

/**
 * @author 订单表
 */
public class Order {

	private int id;				//订单编号
	private String userld;		//用户ID
	private String loginName;	//用户名
	private String userAddress; //用户地址
	private Date createTime;	//创建时间
	private float cost;			//金额
	private int status;			//状态1待审核，2审核通过   3配货，4卖家已发货，5已收货
	private int type;			//类型
	private String serialNumber;//订单号
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserld() {
		return userld;
	}
	public void setUserld(String userld) {
		this.userld = userld;
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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
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
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
}
