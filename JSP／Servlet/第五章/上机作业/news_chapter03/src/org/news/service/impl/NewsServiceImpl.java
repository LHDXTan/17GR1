package org.news.service.impl;


import org.news.dao.BaseDao;
import org.news.dao.impl.NewsDaoImpl;
import org.news.service.NewsService;

public class NewsServiceImpl extends BaseDao implements NewsService{

	@Override
	public String delPanDuan(int id) {
		NewsDaoImpl n=new NewsDaoImpl();
		int delNewId = n.delNewId(id);
		String yu="";
		if(delNewId==1){
			yu="ɾ���ɹ�";
			return yu;
		}else{
			yu="ɾ��ʧ��";	
		}
		return yu;
		
	}


	
}
