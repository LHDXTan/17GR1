package org.news.ServicesImp;

import java.util.List;

import org.news.Services.newsServices;
import org.news.dao.impl.NewsDaoImpl;
import org.news.entity.News;

public class newsServicesImp extends NewsDaoImpl implements newsServices {

	@Override
	public List<News> getAllnews() {
		// TODO Auto-generated method stub
		return super.getAllnews();
	}

	@Override
	public List<News> getAllnewsByTID(int Tid) {
		// TODO Auto-generated method stub
		return super.getAllnewsByTID(Tid);
	}

	@Override
	public int getNewsCountByTID(int Tid) {
		// TODO Auto-generated method stub
		return super.getNewsCountByTID(Tid);
	}
	
	@Override
	public int deleteNews(int Tid) {
		// TODO Auto-generated method stub
		return super.deleteNews(Tid);
	}
}
