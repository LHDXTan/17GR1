package entity;
//订单详情表
public class order_datail {
	//编号
	private int id;
	//订单id
	private int orderId;
	//商品id
	private int productId;
	//数量
	private int quanyity;
	//金额
	private float cost;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuanyity() {
		return quanyity;
	}
	public void setQuanyity(int quanyity) {
		this.quanyity = quanyity;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	

}
