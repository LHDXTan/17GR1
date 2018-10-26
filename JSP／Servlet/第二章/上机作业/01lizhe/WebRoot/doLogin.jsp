<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录处理页面</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        //获取请求数据,并去除空格
        String name = request.getParameter("username").trim();
        String pwd = request.getParameter("upwd").trim();
        boolean valid = false;  //判断用户验证是否成功
        if("admin".equals(name)&&"admin".equals(pwd)){
             valid = true;
             //设置用户登录信息
             session.setAttribute("login", name);
             //设置session过期时间
             session.setMaxInactiveInterval(10*60);
        }
        if (valid) {
            request.getRequestDispatcher("newspages/admin.jsp")
                .forward(request,response);
        } else {
                response.sendRedirect("index.jsp");
        }
    %>
    </body>
</html>
