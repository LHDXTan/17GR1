<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lx3-2.jsp' starting page</title>
    
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
  String name=request.getParameter("userid") ;
    String mima=request.getParameter("passwd") ;
    boolean tt=false;
  if("qq".equals(name)&&"1234561".equals(mima)){
  tt=true;
  session.setAttribute("ww", name);
  session.setMaxInactiveInterval(6*60);
  }if(tt==false){
    request.getRequestDispatcher("newspages/admin.jsp").forward(request,response);
  }else{
   response.sendRedirect("lx3-1.jsp");
  }
  %>
  <body>
  <% %>
  </body>
</html>
