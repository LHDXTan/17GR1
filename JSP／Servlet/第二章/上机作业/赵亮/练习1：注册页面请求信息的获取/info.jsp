<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
  			request.setCharacterEncoding("utf-8");
  			String  name =	request.getParameter("txtUser");
  			String  ps =	request.getParameter("txtPass");
  			String  rps =	request.getParameter("txtRPass");
  			String  gen =	request.getParameter("gen");
  			String  eamil =	request.getParameter("txtEmail");
  			String  year =	request.getParameter("year");
  			/* String  month =	request.getParameter("month");
  			String  date =	request.getParameter("day"); */
  			String[]  date =	request.getParameterValues("day"); 
  		   	String[]  months =	request.getParameterValues("month");
  		    out.print("用户名："+name);
  		    out.print("</br>");
  		    out.print("密码："+ps);
  		    out.print("</br>");
  		    out.print("确认密码："+rps);
  		    out.print("</br>");
  		    out.print("性别："+gen);
  		    out.print("</br>");
  		    out.print("邮箱："+eamil);
  		    out.print("</br>");
  		   out.print("出生日期："+year+"年"+months[0]+"月"+date[0]+"日");
  		
  		 %>
       
  
  </body>
</html>
