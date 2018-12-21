package Dao;

import java.util.List;

import entity.news;

public interface newsDao{
	//查询标题还有时间
	public List<news> selectTitleShijian();
	
	

}
