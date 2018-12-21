package org.news.dao;

import java.util.List;

import org.news.entity.News;

public interface NewsDao{
	//获取所有新闻
	public List<News> getAllnews();	
	//获取某主题下的所有新闻
	public List<News> getAllnewsByTID(int Tid);	
	//获取某主题下的新闻数量
	public int getNewsCountByTID(int Tid);	
	
	//根据新闻ID删除新闻
	 public int deleteNews(int nid);
	    //更新新闻
	 public int updateNews(News n);
	 //根据新闻ID查找新闻
	  public News getAllnewsByNID(int nid);
	  //插入
	public int insert(News nn);
	public List<News> getAllnews(Object []lim);
	public int getAllnewsg();
}