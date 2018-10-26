<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%request.setCharacterEncoding("UTF-8");
String txtUser=request.getParameter("txtUser");
String txtPass=request.getParameter("txtPass");
String gen=request.getParameter("gen");
String txtEmail=request.getParameter("txtEmail");
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");

 %>
  <body>
  您的注册信息为：<br>
    用户名：<%=txtUser %><br>
    密码：<%=txtPass %><br>
    性别：<%=gen %><br>
    电子邮件地址：<%=txtEmail %><br>
    出生日期：<%=year %>年<%=month %>月<%=day %>日
  </body>
</html>
