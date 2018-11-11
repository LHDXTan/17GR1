package org.news.service.impl;

import org.news.dao.BaseDao;
import org.news.service.NewsService;

public class NewsDaoServiceImpl extends BaseDao implements NewsService{

	public int delete(int id) {
		BaseDao baseDao = new BaseDao();
		String deletesql = "delete from news where nid = ?";
		int flag = 0;
		flag = this.executeUpdate(deletesql, id);
		return flag;
		
	}

}
