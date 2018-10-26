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
  
   
  <% 
  String name=request.getParameter("txtUser");
   String mima=request.getParameter("txtPass");
    String cfmima=request.getParameter("txtRPass");
     String xb=request.getParameter("gen");
       String yj=request.getParameter("txtEmail");
         String nian=request.getParameter("year");
          String yue=request.getParameter("month");
           String re=request.getParameter("day");
   %>
   
  <body>
   <table>
    	<tr>
    		<td>姓名</td><td><%=name %></td>
    	</tr>
    	<tr>
    		<td>性别</td><td><%=xb%></td>
    	</tr>
    	<tr>
    		<td>邮件地址</td><td><%=yj %></td>
    	</tr>
    	<tr>
    		<td>出生日期</td><td><%=nian %>-<%=yue %>-<%=re %></td>
    	</tr>
    </table>
  </body>
</html>
