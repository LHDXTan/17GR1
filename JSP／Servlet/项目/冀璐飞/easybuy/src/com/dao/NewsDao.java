package com.dao;

import java.util.List;

import com.entity.News;

public interface NewsDao {

	//查询所有新闻
	public List<News> select_News();
}
