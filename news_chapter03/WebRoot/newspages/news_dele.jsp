<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.news.dao.impl.*" %>
<%@ page language="java" import="org.news.dao.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'news_dele.jsp' starting page</title>
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
	  String sd = (String)request.getParameter("id");
	  int ss = Integer.parseInt(sd);
	  NewsDaoImpl ns = new NewsDaoImpl();
	  int s = ns.getNewsID(ss);
	  if(s>=1){
	%>
		<script type="text/javascript">
			alert("删除成功！。");
			location.href= "newspages/admin.jsp";
		</script>
	<% }%>
  <body>
  </body>
</html>