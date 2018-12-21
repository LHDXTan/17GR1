package com.daoimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.BaseDao;
import com.dao.NewsDao;
import com.entity.News;

public class NewsDaoImp extends BaseDao implements NewsDao{

	@Override
	public List<News> select_News() {
		// TODO Auto-generated method stub
		List<News> list=new ArrayList<News>();
		Connection lianjie = super.lianjie();
		String sql = "select * from easybuy_news";
		PreparedStatement pr=null;
		ResultSet re=null;
		try {
		 pr = lianjie.prepareStatement(sql);
		 re= pr.executeQuery();
		 if(re!=null){
		 while(re.next()){
			 News news=new News(re.getInt(1), re.getString(2), re.getString(3), re.getString(4));
			 list.add(news);
		 }
		 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.guanbi(re, pr, lianjie);
		return list;
	}

}
