package Dao;

import java.util.List;

import entity.Detail;

public interface DetailDao {

	int insertDetail(Detail detail);

	List<Detail> selectDetail(Object id);

}
