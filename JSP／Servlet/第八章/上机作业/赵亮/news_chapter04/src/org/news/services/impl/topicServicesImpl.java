package org.news.services.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.news.dao.NewsDao;
import org.news.dao.TopicsDao;
import org.news.dao.impl.NewsDaoImpl;
import org.news.dao.impl.TopicsDaoImpl;
import org.news.entity.Topic;
import org.news.servicess.topicServices;

public class topicServicesImpl implements topicServices {
	TopicsDao topd = new TopicsDaoImpl();
	NewsDao newd = new NewsDaoImpl();
	@Override
	public int insertTopic(HttpServletRequest request,
			HttpServletResponse response) {
		Topic topic = new Topic();
		topic.setTname(request.getParameter("tname"));
		topd.addTopic(topic.getTname());
		selectTopic(request, response);
		return 0;
	}

	@Override
	public int selectTopic(HttpServletRequest request,
			HttpServletResponse response) {
		List<Topic> list = topd.getAllTopics();
		if(list!=null){
			request.setAttribute("list", list);
			try {
				request.getRequestDispatcher("newspages/topic_list.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}

	@Override
	public int updateTopic(HttpServletRequest request,
			HttpServletResponse response) {
		Topic topic = new Topic();
		String t=request.getParameter("tid");
		 int tid =Integer.parseInt(t);
		topic.setTid(tid);
		topic.setTname(request.getParameter("tname"));
		topd.updateTopic(topic);
		selectTopic(request, response);
		return 0;
	}

	@Override
	public int deleteTopic(HttpServletRequest request,
			HttpServletResponse response) {
		String t=  request.getParameter("tid");
		  int tid =Integer.parseInt(t);
//		  System.out.println("134");
		  System.out.println(tid);
		  if(newd.getNewsCountByTID(tid)>0){
			  System.out.println("不能删除");
			  selectTopic(request, response);
		  }else{
			  int deleteTopic = topd.deleteTopic(tid);
			  selectTopic(request, response);
			  return deleteTopic;
		  }
		return 0;
	}

}
