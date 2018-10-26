<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regi.jsp' starting page</title>
    
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
    	request.setCharacterEncoding("utf-8");	//设置post请求的编码方式
        String name = request.getParameter("txtUser");	//获取到name参数的值
    	String password = request.getParameter("txtPass");	//获取pwd参数的值
    		String repassword = request.getParameter("txtRPass");	
    			String sex = request.getParameter("gen");
    				String emai = request.getParameter("txtEmail");		
    				String nian = request.getParameter("year");	
    				String yue = request.getParameter("month");	
    				String tian = request.getParameter("day");	
    	
    	
    %>
     用户名：<%=name %><br>
    密码：<%=password %><br>
     确认密码：<%=repassword %><br>
     性别：<%=sex %><br>
     电子邮件地址：<%=emai %><br>
          出生日期：<%=nian %>年<%=yue %>月<%=tian %>日
   
  </body>
</html>
