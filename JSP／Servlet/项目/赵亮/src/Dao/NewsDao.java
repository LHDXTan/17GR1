package Dao;

import java.util.List;

import org.news.util.PageU;

import entity.News;

public interface NewsDao {
   //查询新闻 
	List<News> getNewsAll();
	List<News> getNewsAllPage(PageU<News> page);
	int selectNewCount();
	
}
