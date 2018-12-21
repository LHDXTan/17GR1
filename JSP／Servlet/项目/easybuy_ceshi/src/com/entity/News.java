package com.entity;

public class News {

	private int id;
	private String title;
	private String content;
	private String createTime;//录入日期
	
	
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
	public News(int id, String title, String content, String createTime) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.createTime = createTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	
}
