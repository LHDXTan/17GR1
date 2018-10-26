<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'My.jsp' starting page</title>
    
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
  		<%!int s = 0; %>
		<%!
		public int ss(){
			for (int i = 2; i <=100; i++) {
				for (int j = 2; j <= i; j++) {
					if(i%j==0 && i!=j){
						break;
					}
					if(i%j==0 && i==j){
						s+=i;
					}
				}
			}
			return s;
		}
		 %>
	1-100之间的素数有    <%= ss() %>个
  </body>
</html>
