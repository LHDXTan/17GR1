<%@page import="org.news.dao.impl.NewsDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.news.entity.News" %>
<%@ page import="org.news.dao.impl.*" %>
<%@ page import="org.news.dao.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'do_news_update.jsp' starting page</title>
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
  	String id = (String)request.getParameter("id");
	int nid = Integer.parseInt(id);
	String name = (String)request.getParameter("ntid");
	int s = Integer.parseInt(name);
	String ntitle = request.getParameter("ntitle");
	String nauthor = request.getParameter("nauthor");
	String nsummary = request.getParameter("nsummary");
	String ncontent = request.getParameter("ncontent");
	News news = new News();
	news.setNid(nid);
	news.setNtid(s);
	news.setNtitle(ntitle);
	news.setNauthor(nauthor);
	news.setNsummary(nsummary);
	news.setNcontent(ncontent);
	NewsDaoImpl newsd = new NewsDaoImpl();
	int f = newsd.newsupdate(news);
	if(f >= 1){
	%>
		<script type="text/javascript">
			alert("更新成功！");
			location.href = "newspages/admin.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert("更新失败！");
			location.href = "newspages/news_update.jsp";
		</script>
	<%}%>
  <body>
  </body>
</html>