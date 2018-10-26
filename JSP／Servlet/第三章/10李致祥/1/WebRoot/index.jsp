<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.si.*" %>
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
    <form action="infos.jsp" method="post" name="myform">
    <TABLE   border="0" cellpadding="0" cellspacing="0" align="center" width="530">
   <TR>
    <TD width="107" height="36">用户名：</TD>
    <TD width="524"><INPUT name="txtUser" type="text" maxlength="16"></TD>
  </TR>
    <TR>
    <TD width="107" height="36">密码：</TD>
    <TD width="524"><INPUT name="txtPass" type="password"></TD>
  </TR>
   <TR>
    <TD width="524"><INPUT name="txtbutton" type="button" value="提交"></TD>
  </TR>
  </TABLE>
    </form>
  </body>
</html>
