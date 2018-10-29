<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
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
   String name=request.getParameter("txtUser");
   String ps=request.getParameter("txtPass");
   String danxuan=request.getParameter("gen");
   String nian=request.getParameter("year");
   String yue=request.getParameter("month");
   String tian=request.getParameter("day");
   String youxiang=request.getParameter("txtEmail");
   
   out.println("名称："+name);
   out.println("<br>密码："+ps);
   out.println("<br>性别："+danxuan);
   out.println("<br>年："+nian);
   out.println("<br>月："+yue);
   out.println("<br>日："+tian);
   out.println("<br>邮箱："+youxiang);
   %>
  </body>
</html>
