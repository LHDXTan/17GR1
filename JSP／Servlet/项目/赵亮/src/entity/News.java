package entity;

import java.util.Date;
//新闻表
public class News {
  private int id;  //编号
  private String  title; //标题
  private String content; //内容
  private Date createTime;//录入日期
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
public Date getCreateTime() {
	return createTime;
}
public void setCreateTime(Date createTime) {
	this.createTime = createTime;
}
  
}
