<%@page import="org.news.dao.impl.TopicsDaoImpl"%>
<%@page import="org.news.dao.TopicsDao"%>
<%@page import="org.news.entity.Topic"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	TopicsDao topicsDao=new TopicsDaoImpl();
	String tname = request.getParameter("tname");
		Topic topic=topicsDao.findTopicByName(tname);
		if(topic==null){
			topicsDao.addTopic(tname);%>
			<script type="text/javascript">
			alert("当前主题创建成功，点击确认返回主题列表！");
			location.href="do_topic_list.jsp";	
			</script>
			
		<%}else{%>
		    <script type="text/javascript">
			alert("当前主题已存在，请输入不同的主题！");
			location.href="../newspages/topic_add.jsp";	
			</script>
<%}%>
