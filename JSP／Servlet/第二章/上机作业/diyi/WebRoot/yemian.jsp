<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'yemian.jsp' starting page</title>
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
   //读取用户名，密码，确认密码
String name=request.getParameter("txtUser");
String miam=request.getParameter("txtPass");
String queren=request.getParameter("txtRPass");
//读取按钮
String sex= request.getParameter("gen");
//读取email
String enail=request.getParameter("txtEmail");
String nian=request.getParameter("year");
String yue=request.getParameter("month");
String re=request.getParameter("day");
    %>
     <%="名字"+name%><br>
      <%="密码："+miam%><br>
      <%="确认密码:："+queren %><br>
      <%="性别："+sex%><br>
       <%="Email："+enail%><br>
    <%="年："+nian%><br>
    <%="月："+yue%><br>
    <%="日："+re%><br>
  </body>
</html>
