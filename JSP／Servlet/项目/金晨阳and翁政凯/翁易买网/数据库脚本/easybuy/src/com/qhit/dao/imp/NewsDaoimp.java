package com.qhit.dao.imp;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.qhit.dao.BaseDao;
import com.qhit.dao.NewsDao;
import com.qhit.entity.News;

public class NewsDaoimp extends BaseDao implements NewsDao {
	//查询所有新闻
	public List<News> selectNews_dao() {
		List<News> list_news = new ArrayList<News>();
		String sql = "select * from easybuy_news";
		ResultSet executeQuery = super.executeQuery(sql);
		try {
			while(executeQuery.next()){
				News ns = new News();
				ns.setId(executeQuery.getInt(1));
				ns.setTitle(executeQuery.getString(2));
				ns.setContent(executeQuery.getString(3));
				ns.setCreateTime(executeQuery.getDate(4));
				list_news.add(ns);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_news;
	}
}