package org.news.util;


import java.util.List;

import org.news.entity.News;


public class Page {
   private int currPageNo=1;//当前页码
   
   private int pageSize=20;//每页条数
   	
   private int totalCount;//记录总数
   
   private int totalPageCount;//总页数
   
   List<News> newsList; //每页新闻的集合

public int getCurrPageNo() {
	return currPageNo;
}

public void setCurrPageNo(int currPageNo) {
	this.currPageNo = currPageNo;
}

public int getPageSize() {
	return pageSize;
}

public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
}

public int getTotalCount() {
	return totalCount;
}

public void setTotalCount(int totalCount) {
	this.totalCount = totalCount;
}

public int getTotalPageCount() {
	return totalPageCount;
}

public void setTotalPageCount(int totalPageCount) {
	this.totalPageCount = totalPageCount;
}

public List<News> getNewsList() {
	return newsList;
}

public void setNewsList(List<News> newsList) {
	this.newsList = newsList;
}
   
   
}
