<%@page import="org.news.dao.impl.TopicsDaoImpl"%>
<%@page import="org.news.dao.TopicsDao"%>
<%@page import="org.news.entity.Topic"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	TopicsDao topicsDao=new TopicsDaoImpl();
	String opr= request.getParameter("opr");
	
	if(opr.equals("update")){
		String tname = request.getParameter("tname");
		String tid =(String)request.getParameter("tid");
		Topic topic=topicsDao.findTopicByName(tname);
		//主要看是不是换名了，并且不与之前的重复
			if(topic==null){
				Topic to=new Topic();
				to.setTid(Integer.parseInt(tid));
				to.setTname(tname);
					if(topicsDao.updateTopic(to)>0){
						%>
						<script type="text/javascript">
							alert("当前主题创建成功，点击确认返回主题列表！");
							location.href="do_topic_list.jsp";	
						</script>
							
					<% }else{%>
						<script type="text/javascript">
						alert("当前主题已存在，请输入不同的主题！");
						location.href="../newspages/topic_update.jsp";	
						</script>
					<% }%>
				
			<% }else {%>
				 <script type="text/javascript">
				alert("当前主题已存在，请输入不同的主题！");
				location.href="../newspages/topic_update.jsp";	
				</script>
			<% }%>
					
		<% }else {%>
				 <script type="text/javascript">
				alert("当前主题已存在，请输入不同的主题！");
				location.href="../newspages/topic_update.jsp";	
				</script>
		<% }%>
			
			
			
			
			

