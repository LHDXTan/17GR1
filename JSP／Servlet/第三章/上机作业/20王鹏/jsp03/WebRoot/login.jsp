<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
    Cookie ck=new Cookie("info", "ok"); 
    ck.setMaxAge(5*60); 
    response.addCookie(ck);
    response.sendRedirect("cookie.jsp");
%>
  <body>
   <FORM NAME="myform" METHOD="POST" action="application.jsp" >
	用户名:<INPUT TYPE="text" SIZE="20" NAME="userid">
	密码:<INPUT TYPE="password" SIZE="20" NAME="passwd">
	<INPUT type="submit"  value="登录" name="submit" >
	</FORM>
  </body>
</html>
