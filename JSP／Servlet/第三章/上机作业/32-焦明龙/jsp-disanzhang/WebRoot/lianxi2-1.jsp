<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lianxi2-1.jsp' starting page</title>
    
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
		Cookie[] x = request.getCookies();
		String user="";
		String pwd = "";
		if(x!=null){
			for(int i=0;i<x.length;i++){
				if(x[i].getName().equals("qq"))
					response.sendRedirect("lianxi2-3.jsp");
			}
		}
   %>
  <body>
    <form action="lianxi2-2">
  用户名<input type="text" name="name" >
    密码<input type="password" name="pws" >
     <input type="submit" name="name" value="登录">
  </form>
  </body>
</html>
