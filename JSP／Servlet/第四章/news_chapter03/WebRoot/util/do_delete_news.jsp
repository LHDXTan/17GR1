<%@page import="org.news.service.NewsService"%>
<%@page import="org.news.service.impl.NewsDaoServiceImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delete.jsp' starting page</title>
    
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
  			//out.print(id);
  			NewsService newservice =   new NewsDaoServiceImpl();
  			int flag = 0;
  			flag = newservice.delete(Integer.parseInt(id));
  			if(flag==1){
  				response.sendRedirect("do_news_list.jsp");
  			}else{
  				response.sendRedirect("admin.jsp");
  			}
  				
  %>
  </body>
</html>
