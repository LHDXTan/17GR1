<%@page import="org.jbit.news.dao.NewsDao"%>
<%@page import="org.jbit.news.dao.impl.NewsDaoImpl,org.jbit.news.entity.*"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
	NewsDao newsDao=new NewsDaoImpl();
	List<News> list=newsDao.getAllnews();	
	session.setAttribute("list",list);
	response.sendRedirect("../newspages/admin.jsp");
%>

