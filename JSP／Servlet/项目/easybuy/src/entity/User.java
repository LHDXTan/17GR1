package entity;

import java.util.Date;

public class User {
//用户表
 private int id;    
 private String loginName;  //用户名
 private String   userName ;//真实名字
 private String   password ;//密码
 private String   sex ;  //性别     1为男 2为女
 private String  email  ;//邮箱
 private String   mobile ;//手机号码
 private String identityCode ; //身份证号
 private  int type; //类型    1为 普通用户   2为管理员
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getLoginName() {
	return loginName;
}
public void setLoginName(String loginName) {
	this.loginName = loginName;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public String getIdentityCode() {
	return identityCode;
}
public void setIdentityCode(String identityCode) {
	this.identityCode = identityCode;
}
public int getType() {
	return type;
}
public void setType(int type) {
	this.type = type;
}
}
