package com.qhit.entity;
import java.util.Date;

/**
 * @author 用户表
 */
public class User {
	
	private int id;
	private String loginName;//用户名
	private String userName;//用户真实姓名
	private String password;//密码
	private int sex;		//性别   1为男，0为女
	private Date identityCode;//身份证号
	private String emali;   //邮箱
	private String mobile; 	//手机号
	private int type;  //类型 ,1为普通用户，2为管理员
	
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
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public Date getIdentityCode() {
		return identityCode;
	}
	public void setIdentityCode(Date identityCode) {
		this.identityCode = identityCode;
	}
	public String getEmali() {
		return emali;
	}
	public void setEmali(String emali) {
		this.emali = emali;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
