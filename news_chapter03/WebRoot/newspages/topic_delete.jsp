<%@page import="org.news.dao.impl.NewsDaoImpl"%>
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
    <title>My JSP 'topic_delete.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<%
		request.setCharacterEncoding("UTF-8");
		String ss = (String)request.getParameter("id");
		int sg = Integer.parseInt(ss);
		NewsDaoImpl nes = new NewsDaoImpl();
		int g = nes.getNewsCountByTID(sg);
		if(g>=1){
		%>
			<script type="text/javascript">
			alert("该主题下还有新闻,请先删除新闻。");
			location.href= "util/do_topic_list.jsp";
			</script>
		<%
		}else{
			TopicsDaoImpl td = new TopicsDaoImpl();
			int s = td.deleteTopic(sg);
			if(s>=1){
		%>
			<script type="text/javascript">
			alert("删除成功！。");
			location.href= "util/do_topic_list.jsp";
			</script>
		<%
			   }
		}
		%>
  </head>
  <body>
  </body>
</html>
