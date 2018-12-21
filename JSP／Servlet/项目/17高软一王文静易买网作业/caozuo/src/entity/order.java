package entity;

import javax.xml.crypto.Data;

//订单表
public class order {
	// 编号
	private int id;
	// 用户id
	private int userId;
	// 用户名
	private String loginName;
	// 用户地址
	private String userAddress;
	// 创建时间
	private Data createTime;
	// 金额
	private float cost;
	// 状态
	private int status;
	// 类型
	private int type;
	// 订单号
	private String seriaINumber;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
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

	public Data getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Data createTime) {
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

	public String getSeriaINumber() {
		return seriaINumber;
	}

	public void setSeriaINumber(String seriaINumber) {
		this.seriaINumber = seriaINumber;
	}

}
