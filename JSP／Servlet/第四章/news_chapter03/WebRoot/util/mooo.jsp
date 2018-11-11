<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.news.dao.impl.NewsDaoImpl"%>
<%@page import="org.news.dao.NewsDao"%>
<%@page import="org.news.entity.Topic"%>
<%@page import="org.news.dao.TopicsDao"%>
<%@page import="org.news.dao.impl.TopicsDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'mooo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    request.setCharacterEncoding("utf-8");
    TopicsDao topicsDao = new TopicsDaoImpl();
    String tid = request.getParameter("tid");
    //out.print(tid);
    String tname = request.getParameter("tname");
    Topic topic = topicsDao.findTopicByName(tname);
    if (topic == null) {
        topic = new Topic();
        topic.setTname(tname);
        topic.setTid(Integer.parseInt(tid));
        if(topicsDao.updateTopic(topic)>0){
        	
        response.sendRedirect("do_topic_list.jsp");
        }
    }else{
    	response.sendRedirect("do_topic_list.jsp");
    }
    %>
  </body>
</html>
