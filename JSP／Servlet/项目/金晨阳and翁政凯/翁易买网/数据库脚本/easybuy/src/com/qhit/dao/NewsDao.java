package com.qhit.dao;
import java.util.List;
import com.qhit.entity.News;

/**
 * @author 凯
 *	新闻DAO
 */
public interface NewsDao {
	//查询所有新闻
	public List<News> selectNews_dao();

}
