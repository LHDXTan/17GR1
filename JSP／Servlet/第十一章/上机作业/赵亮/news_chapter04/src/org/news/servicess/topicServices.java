package org.news.servicess;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.news.entity.Topic;

public interface topicServices {

	int  insertTopic(HttpServletRequest request, HttpServletResponse response);

	int selectTopic(HttpServletRequest request, HttpServletResponse response);

	int updateTopic(HttpServletRequest request, HttpServletResponse response);

	int deleteTopic(HttpServletRequest request, HttpServletResponse response);
	public List<Topic> selectTopic();

}
