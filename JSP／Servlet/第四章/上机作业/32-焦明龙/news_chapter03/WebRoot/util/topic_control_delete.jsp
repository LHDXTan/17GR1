<%@page import="org.news.dao.impl.NewsDaoImpl"%>
<%@page import="org.news.dao.NewsDao"%>
<%@page import="org.news.entity.Topic"%>
<%@page import="org.news.dao.TopicsDao"%>
<%@page import="org.news.dao.impl.TopicsDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delete-news.jsp' starting page</title>
    
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
    String opr = request.getParameter("opr");
    TopicsDao td = new TopicsDaoImpl();
    if("del".equals(opr)){//删除主题
    	String tid = request.getParameter("tid");
    	NewsDao nd = new NewsDaoImpl();
    	if(nd.getNewsCountByTID(Integer.parseInt(tid)) == 0){
    		if(td.deleteTopic(Integer.parseInt(tid))>0){
    %>		<script type="text/javascript">
    			alert("已经成功删除主题，点击确认返回主题列表");
    			location.href="topic_control.jsp?opr=list"; 
    		</script>
    		<%}else{ %>
    		<script type="text/javascript">
    			alert("删除主题失败，请联系管理员,点击确认返回主题列表");
    			location.href="topic_control.jsp?opr=list"; 
    		</script>
    	<%}
    	}else{ %>	
    	<script type="text/javascript">
    		alert("该主题下还有文章，不能删除");
    		location.href="topic_control.jsp?opr=list"; 
    	</script>	
    	<%}
    } %>
  </body>
</html>
