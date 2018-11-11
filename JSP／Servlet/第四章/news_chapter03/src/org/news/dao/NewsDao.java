package org.news.dao;

import java.util.List;

import org.news.entity.News;

public interface NewsDao{
	/**
	 * 获取所有新闻
	 * @return
	 */
	public List<News> getAllnews();	
	/**
	 * 获取所有新闻
	 * @param Tid
	 * @return
	 */
	public List<News> getAllnewsByTID(int Tid);	
	/**
	 * 获取某主题下的新闻数量
	 * @param Tid
	 * @return
	 */
	public int getNewsCountByTID(int Tid);	
}