<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>问卷调查</title>
    
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
  <form action="WenjuanServlet">
 	昵称：<input type="text" name="username"></br>
  	所在城市：<input type="text" name="city"></br>
  	你使用的开发语言：<input type="checkbox" name="languages" value="Java">Java
  	<input type="checkbox" name="languages" value="C">C
  	<input type="checkbox" name="languages" value="C++">C++
  	<input type="checkbox" name="languages" value="C#">C#</br>
  	<input type="submit" name="tijiao" value="提交">
  </form>
   
  </body>
</html>
