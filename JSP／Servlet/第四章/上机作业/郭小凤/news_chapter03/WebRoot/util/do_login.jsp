<%@page import="org.news.entity.*"%>
<%@page import="org.news.service.*"%>
<%@page import="org.news.service.impl.*"%>
<%@page import="org.news.dao.impl.*"%>
<%@page import="org.news.dao.*"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
	String uname = request.getParameter("uname");
	String password = request.getParameter("upwd");
	UserService userService=new UserServiceImpl();
	
	
	User user =new User();
	user.setUname(uname);
	user.setUpwd(password);
	userService.doLogin(user);
	
   
	if(user==null){	
		out.print("<script type='text/javascript'>");
		out.print("alert('用户名密码错误，请重新登录')");
		out.print("open('../index.jsp','_self')");
	}else{		
		session.setAttribute("admin",uname);
		response.sendRedirect("../util/do_news_list.jsp");
	}
%>
