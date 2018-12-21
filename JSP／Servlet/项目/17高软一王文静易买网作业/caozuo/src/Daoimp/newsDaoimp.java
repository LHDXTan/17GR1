package Daoimp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.crypto.Data;

import entity.news;
import Dao.BaseDao;
import Dao.newsDao;

public class newsDaoimp extends BaseDao implements newsDao {
//查询
	@Override
	public List<news> selectTitleShijian() {
		Object[] objects={};
		ResultSet rs =null;
	String sql="select*from news";
	// TODO Auto-generated method stub
	 rs = this.executeQuery(sql, objects);
	 news news =null;
	 ArrayList<news> list = new ArrayList<news>(); 
	try {
		while (rs.next()) {
			 news = new news();
			news.setId(rs.getInt("id"));
			news.setTitle(rs.getString("title"));
		news.setCreateTime((Data)rs.getDate("createTime"));
		news.setContent(rs.getString("content"));
			list.add(news);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		this.closeAll(conn, null, rs);
	}
		return list;
	}

}
