package org.news.service.impl;

import org.news.dao.BaseDao;
import org.news.service.NewsService;

public class TopicsServiceImpl extends BaseDao implements NewsService{

	@Override
	public int delete(int id) {
		BaseDao baseDao = new BaseDao();
		//String deletesql = "delete from news where nid = ?";
		String delsql = "delete from topic where tid = ?";
		
		int flag = 0;
		flag = this.executeUpdate(delsql, id);
		return flag;
	}

}
