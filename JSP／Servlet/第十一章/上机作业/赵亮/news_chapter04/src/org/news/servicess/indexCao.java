package org.news.servicess;

import java.util.List;

import org.news.entity.News;
import org.news.entity.Topic;
import org.news.util.Page;

public interface indexCao {
	public List<News> selectNews();
	

	public List<Topic> selectTopic();

	public List<News> selectNews(int tid);

	public List<News> selectNewsLim(int chaid, Page page);


	public News findNews(int tid);
   
}
