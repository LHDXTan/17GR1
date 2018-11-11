<%@page import="org.news.dao.impl.NewsDaoImpl"%>
<%@page import="org.news.dao.NewsDao"%>
<%@page import="org.news.dao.impl.TopicsDaoImpl"%>
<%@page import="org.news.dao.TopicsDao"%>
<%@page import="org.news.service.NewsService"%>
<%@page import="org.news.service.impl.TopicsServiceImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'do_delete_topic.jsp' starting page</title>
    
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
  			request.setCharacterEncoding("UTF-8");
  			String id = request.getParameter("id");
  			NewsDao news=new NewsDaoImpl();
  			TopicsDao topics = new TopicsDaoImpl();
  			if(news.getNewsCountByTID(Integer.parseInt(id))==0)	{
  				if(topics.deleteTopic(Integer.parseInt(id))>0){%>
  				<script type="text/javascript">
  				confirm("xsxacuashaif")
  				</script>
  			<% response.sendRedirect("do_topic_list.jsp");
  				}
  			}else{%>
  				<script type="text/javascript">
  				alert("删除失败")
  				</script>
  			<% response.sendRedirect("do_topic_list.jsp");
  			}
  			
  			
  %>
  </body>
</html>
