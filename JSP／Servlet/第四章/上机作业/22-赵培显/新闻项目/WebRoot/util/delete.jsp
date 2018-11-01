<%@page import="javax.script.ScriptContext"%>
<%@page import="org.news.dao.impl.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.news.dao.*"%>
<%@page import="org.news.dao.impl.*,org.news.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'delete.jsp' starting page</title>

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
     request.setCharacterEncoding("utf-8");
     String opr=request.getParameter("opr");
     TopicsDao TopicsDao=new TopicsDaoImpl();
     if("del".equals("opr")){
     String tid=request.getParameter("tid");
     int i=TopicsDao.deleteTopic(Integer.parseInt(tid));
     if(i==-1){
      %>
	  <script type="text/javascript">
	  alert("操作失败");
	  window.location="delete.jsp?opr=list";
	  </script>
	<%
   }else if(i==0){%>
	   <script type="text/javascript">
		  alert("未找到该主题请重新操作");
		  window.location="delete.jsp?opr=list";
		  </script>
  <% }else{%>
	   <script type="text/javascript">
		  alert("删除成功");
		  window.location="delete.jsp?opr=list";
		  </script>
 <%}
    
   }else if ("update".equals("opr")){
	  String tid= request.getParameter("tid");
	  String tname = request.getParameter("tname");
      Topic topic = new Topic();
      topic.setTid(Integer.parseInt(tid));
      topic.setTname(tname);
	  int qq=TopicsDao.updateTopic(topic);
			  if(qq==-1){
				  %>
				  <script type="text/javascript">
				  alert("当前主题已存在，请换个主题重新输入 ");
				  window.location="delete.jsp?opr=list&tid+tname="+tid+tname;
				  </script>
				<%
			  }else if(qq==0){
				  %>
				  <script type="text/javascript">
				  alert("未找到相关主题，清新输入主题 ");
				  window.location="delete.jsp?opr=list";
				  </script>
				<%
			  }else{
				  %>
				  <script type="text/javascript">
				  alert("更新成功 ");
				  window.location="delete.jsp?opr=list";
				  </script>
				<%
			  }
   }else if(){}
   %>

</body>
</html>
