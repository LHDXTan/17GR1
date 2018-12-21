package entity;

import java.sql.Date;

import javax.xml.crypto.Data;

//�û���


public class User {
	// id
	private int id;
	// �Ñ���
	private String loginName;
	// �Ñ��挍����
	private String userName;
	// ����
	private String password;
	// �Ա�
	private String sex;
	// ���֤��
	private Data identityCode;
	// email
	private String email;
	public void setId(int id) {
		this.id = id;
	}

	// �ֻ��
	private String mobile;
	// ����1��ͨ�û�2����Ա�û�
	private int type;

	public int getId() {
		return id;
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

	public Data getIdentityCode() {
		return identityCode;
	}

	public void setIdentityCode(Data identityCode) {
		this.identityCode = identityCode;
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
