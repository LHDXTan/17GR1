package com.qhit.server;

import java.util.List;

import com.qhit.entity.News;

public interface NewsServer {
	//查询所有新闻
	public List<News> selectNews_ser();
}
