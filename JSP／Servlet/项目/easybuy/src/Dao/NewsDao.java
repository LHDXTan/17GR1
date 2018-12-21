package Dao;

import java.util.List;

import entity.News;

public interface NewsDao {
   //查询新闻 
	List<News> getNewsAll();
	
}
