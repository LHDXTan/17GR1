<%@page import="org.news.entity.Topic"%>
<%@page import="org.news.dao.impl.TopicsDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'do_topic_update.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
	  <%
	  	 request.setCharacterEncoding("UTF-8");
      	 TopicsDaoImpl tp = new TopicsDaoImpl();
		 String tid = (String)request.getParameter("tid");
	     String tname = request.getParameter("tname");
	     Topic topic = tp.findTopicByName(tname);
      	 if(topic!=null){
      %>
      	  <script type="text/javascript">
			alert("当前主题已存在，请输入不同的主题！");
			location.href= "../util/do_topic_list.jsp";	
		  </script>
	 <%
      		}else{
      		topic = new Topic();
      		topic.setTid(Integer.parseInt(tid));
      		topic.setTname(tname);
      		int f = tp.updateTopic(topic);
      			if(f>=1){
      %>
            <script type="text/javascript">
      			alert("修改成功！");
      			location.href= "../util/do_topic_list.jsp";	
      		 </script>
      	<%}} %>
  <body>
  </body>
</html>