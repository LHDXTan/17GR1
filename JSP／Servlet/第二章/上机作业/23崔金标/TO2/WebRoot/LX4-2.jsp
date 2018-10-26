<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'LX4-2.jsp' starting page</title>
    
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
   request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("username");
        String pwd = request.getParameter("upwd");
        boolean qq = false;  
        if("admin".equals(name)&&"admin".equals(pwd)){
             qq = true;
             session.setAttribute("login", name);
             session.setMaxInactiveInterval(10*60);
        }
        if (qq) {
            request.getRequestDispatcher("newspages/admin.jsp")
                .forward(request,response);
        } else {
                response.sendRedirect("LX4-1.jsp");
        }
    %>
  </body>
</html>
