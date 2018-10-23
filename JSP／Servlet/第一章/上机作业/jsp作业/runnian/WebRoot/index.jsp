<%@ page language="java" import="java.util.*" pageEncoding="uft-8"%>
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
		int count1 = 0;
		for (int i = 2000; i <= 2013; i++) {
			if (i % 4 == 0 && i % 100 != 0 || i % 400 == 0) {
				count1++;
			}
		}
	%>
	<%!
		int getLeapYear(int first,int last){
			GregorianCalendar gc=new GregorianCalendar();
			//日期对象，isLeapYear判断是否是闰年。
			int count=0;
			for(int i=first;i<=last;i++){
				if(gc.isLeapYear(i)){
					count++;
				}
			}
			return count;
		}
	%>
	从2000年~2013年，共有<%=count1%>个闰年
	<br>
	从2000年~2013年，共有<%=getLeapYear(2000, 2013)%>个闰年
	
</body>
</html>

