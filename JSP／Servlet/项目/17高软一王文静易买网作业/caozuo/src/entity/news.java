package entity;


//新闻表
import javax.xml.crypto.Data;

public class news {
	//id
private int Id;
	//标题
private String title;
	//内容
private String content ;
	//录入日期
private Data createTime;
public int getId() {
	return Id;
}
public void setId(int id) {
	Id = id;
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
public Data getCreateTime() {
	return createTime;
}
public void setCreateTime(Data createTime) {
	this.createTime = createTime;
}




}
