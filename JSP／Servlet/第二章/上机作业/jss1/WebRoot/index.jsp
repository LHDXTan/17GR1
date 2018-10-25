<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
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
		String name = request.getParameter("txtUser");
		String pass = request.getParameter("txtPass");
		String rad = request.getParameter("gen");
		String ema = request.getParameter("txtEmail");
		String yea = request.getParameter("year");
		String mon = request.getParameter("month");
		String da = request.getParameter("day");
	%>
	用户名：<%=name %><br/>
	密码：<%=pass %><br/>
	性别：<%=rad %><br/>
	邮箱：<%=ema %><br/>
	出生年月日：<%=yea %>.<%=mon %>.<%=da %>
	
  </body>
</html>
