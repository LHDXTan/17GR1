package Dao;
public class User {
private int uid;
private String upwd;

public User() {
	super();
	// TODO Auto-generated constructor stub
}

public User(int uid, String upwd) {
	super();
	this.uid = uid;
	this.upwd = upwd;
}

public int getUid() {
	return uid;
}

public void setUid(int uid) {
	this.uid = uid;
}

public String getUpwd() {
	return upwd;
}

public void setUpwd(String upwd) {
	this.upwd = upwd;
}

}
