package com.qhit.server.imp;

import java.util.List;

import com.qhit.dao.imp.NewsDaoimp;
import com.qhit.entity.News;
import com.qhit.server.NewsServer;

public class NewsServerimp implements NewsServer{
	NewsDaoimp nd = new NewsDaoimp();
	public List<News> selectNews_ser() {
		List<News> selectNews_dao = nd.selectNews_dao();
		return selectNews_dao;
	}
	
}
