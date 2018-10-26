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
	<%!int a = 0; %>
  	<%!
  	public int ss(){
  		int[] s = {2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2012,2013};
		for(int i = 0;i<s.length;i++){
			if(s[i]%4==0){
				a++;
			}
		}
		return a;
  	}
  	%>
  	2000年-2013年  有<%= ss() %>个闰年
  </body>
</html>
