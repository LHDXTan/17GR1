package org.news.services.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.news.dao.*;
import org.news.dao.impl.*;
import org.news.entity.News;
import org.news.entity.Topic;
import org.news.servicess.indexCao;
import org.news.util.Page;

public class indexCaoImp implements indexCao{

	NewsDao newd = new NewsDaoImpl();
	TopicsDao topicd = new TopicsDaoImpl();

	@Override
	public List<News> selectNews() {
		List<News> allnews = newd.getAllnews();
		return allnews;
	}

	@Override
	public List<Topic> selectTopic() {
		return topicd.getAllTopics();
	}

	@Override
	public List<News> selectNews(int tid) {
		return newd.getAllnewsByTID(tid);
	}

	@Override
	public List<News> selectNewsLim(int chaid,Page page) {
		
		page.setCurrPageNo(chaid);
		page.setTotalCount(newd.getAllnewsg());
		int totalPageCount=0;
		if(page.getTotalCount()%page.getPageSize()==0){
			totalPageCount=page.getTotalCount()/page.getPageSize();
		}else{
			totalPageCount=(page.getTotalCount()/page.getPageSize())+1;
			
		}
		page.setTotalPageCount(totalPageCount);
		Object[] lim={(page.getCurrPageNo()-1)*page.getPageSize(),page.getPageSize()};
		page.setNewsList(newd.getAllnews(lim));
		return page.getNewsList();
	}

	@Override
	public News findNews(int nid) {
		 News news = newd.getAllnewsByNID(nid);
		 return news;
	}

	
}
