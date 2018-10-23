<%@page import="java.text.SimpleDateFormat"%>
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
    This is my JSP page. <br>
    
    <%
    int j=0;
    for(int i=2000;i<2013;i++){
    	if(i%4==0){
    	j++;
    }
    }
     %>
    <%="2000-2013有"+j+"个闰年" %>
    </br>
    <% 
    int s=0;
    int w=0;
    for(int i=2;i<100;i++){
    	w=2;
    	while(i%w!=0){
    	w++;
    	if(i==w){
    	s+=i;
    	}
    	}
    }
    %>
    <%="1-100之间的素数和:"+(s+2) %>
     </br>
    <%
    Date dd=new Date();
    SimpleDateFormat ww=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     %>
     <%= "\r\n现在的时间是："+ww.format(dd.getTime()) %>
  </body>
</html>
