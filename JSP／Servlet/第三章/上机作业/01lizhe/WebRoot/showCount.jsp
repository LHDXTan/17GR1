<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	  Integer i = (Integer)application.getAttribute("count");
	  out.println("您好，您是第 " + i +" 位访问本网站的用户" );
%>

