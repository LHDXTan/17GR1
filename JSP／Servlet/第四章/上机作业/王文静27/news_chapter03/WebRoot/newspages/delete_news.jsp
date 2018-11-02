<%@page import="org.jbit.news.dao.impl.*"%>
<%@page import="org.jbit.news.dao.*"%>
<%@page import="org.jbit.news.entity.Topic"%>
<%@page import="srviceimp.*"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id=(String)request.getParameter("id");
System.out.print(id);
NewsDaoImpServiceimp NewsDao= new NewsDaoImpServiceimp();
String san=NewsDao.DeleteNewsDao(Integer.parseInt(id));
if(san.equals("删除成功")){
	request.getRequestDispatcher("admin.jsp").forward(request, response);
}else if(san.equals("删除失败")){
	out.print(san);
}			
			%>
				
					
			
			
			
			
			

