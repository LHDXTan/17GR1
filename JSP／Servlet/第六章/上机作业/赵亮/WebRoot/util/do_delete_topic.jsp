<%@page import="org.news.dao.impl.*"%>
<%@page import="org.news.dao.*"%>
<%@page import="org.news.entity.Topic"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	TopicsDao topicsDao=new TopicsDaoImpl();
	NewsDao nd=new NewsDaoImpl();
	
		String tname = request.getParameter("tname");
		String tid =(String)request.getParameter("tid");
		//主要看是不是换名了，并且不与之前的重复
		 int t=Integer.parseInt(tid);
		 
		
			if(nd.getNewsCountByTID(t)==0){
					if(topicsDao.deleteTopic(t)>0){
					%>
						<script type="text/javascript">
							alert("当前主题删除成功，点击确认返回主题列表！");
							location.href="do_topic_list.jsp";	
						</script>
							
					<% }else{%>
						<script type="text/javascript">
						alert("当前主题下面有新闻，请先删除下面的新闻！");
						location.href="do_topic_list.jsp";
						</script>
					<% }%>
				
			<% }else {%>
				 <script type="text/javascript">
				alert("当前主题下面有新闻，请先删除下面的新闻！");
				location.href="do_topic_list.jsp";
				</script>
			<% }%>
					
			
			
			
			
			

