package org.news.servicess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface topicServices {

	int  insertTopic(HttpServletRequest request, HttpServletResponse response);

	int selectTopic(HttpServletRequest request, HttpServletResponse response);

	int updateTopic(HttpServletRequest request, HttpServletResponse response);

	int deleteTopic(HttpServletRequest request, HttpServletResponse response);


}
