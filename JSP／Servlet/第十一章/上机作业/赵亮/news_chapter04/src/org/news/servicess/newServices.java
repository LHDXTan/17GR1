package org.news.servicess;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.news.entity.News;

public interface newServices {
	
  
	public List<News> selectNew();
	public int deleteNew(HttpServletRequest request,
			HttpServletResponse response);
	public int updateNew(HttpServletRequest request,
			HttpServletResponse response);
	public int insertNew(HttpServletRequest request,
			HttpServletResponse response);
	public void selectNew(HttpServletRequest request,
			HttpServletResponse response);
}
