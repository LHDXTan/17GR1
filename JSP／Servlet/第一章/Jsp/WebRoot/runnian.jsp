<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'runnian.jsp' starting page</title>
    
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
    <%!
	//2000-2013年中的闰年的个数
	 int findYear(){
            int count=0;
            for(int year=2000;year<=2013;year++){
                if((year%4==0&&year%100!=0)||year%400==0){
                
                         count++;
                             
                }
                        
            } 
              return count;    
     }
	 %>
	 2000年-2013年 ，一共有<%=findYear() %>个闰年
  </body>
</html>
