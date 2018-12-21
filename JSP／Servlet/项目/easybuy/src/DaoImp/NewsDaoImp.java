package DaoImp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.BaseDao;
import Dao.NewsDao;
import entity.News;

public class NewsDaoImp  extends BaseDao implements NewsDao {

	@Override
	public List<News> getNewsAll() {
		List<News> lists=new ArrayList<News>();
		String sql="select * from news";
		ResultSet rs = super.executeQuery(sql);
		if(rs!=null){

			try {
				while(rs.next()){
					News news = new News();
					news.setContent(rs.getString("content"));
					news.setCreateTime(rs.getDate("createTime"));
					news.setId(rs.getInt("id"));
					news.setTitle(rs.getString("title"));
					lists.add(news);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lists;
	}

}
