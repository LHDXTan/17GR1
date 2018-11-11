<%@page import="org.news.entity.Topic"%>
<%@page import="org.news.dao.TopicsDao"%>
<%@page import="org.news.dao.impl.TopicsDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'do_modify_topic.jsp' starting page</title>
    
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
          TopicsDao topicsDao=new TopicsDaoImpl();
          String tid = request.getParameter("tid");
          String tname = request.getParameter("tname");
          Topic topic = topicsDao.findTopicByName(tname);
          if(topic == null){
        	  topic = new Topic();
        	topic.setTid(Integer.parseInt(tid));
        	 topic.setTname(tname);
        	  
        	  out.print("xxx");
          }else{
        	  out.print("zzz");
          }
  %>
  
  
  </body>
</html>
