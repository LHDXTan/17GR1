<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
  <%! int sum=0;   %>
  <%!
  public int ss(){
 	 for(int i=2;i<101;i++){
 	int s=0;
 	 for(int j=2;j<=(Math.sqrt(i)+1);j++){
 	     if(i%j==0){
 	       s++;
 	     }
 	 }
 	 if(s==0){
   		 sum+=i;
 	 }
  	}
	return  sum;
  } 
    %>
    <%=ss() %>
    <br>
  </body>
</html>
