<%@page import="org.news.dao.NewsDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.news.dao.impl.*"%>
<%@page import="org.news.dao.*"%>
<%@page import="org.news.Services.*"%>
<%@page import="org.news.ServicesImp.*"%>
<%@page import="org.news.entity.*"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<script type="text/javascript">


/* alert("sss"); */
</script>
<%
	request.setCharacterEncoding("UTF-8");
	TopicsDao topicsDao=new TopicsDaoImpl();
	NewsDao nd=new NewsDaoImpl();
	
	
	String id= request.getParameter("id");
	int nid=Integer.parseInt(id);
	
/* 	SimpleDateFormat  sd=	new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 */	 
 News news=new News();
	 news.setNid(nid);
	 
	 news.setNauthor((String)request.getParameter("nauthor"));
	 
	news.setNcontent((String)request.getParameter("ncontent"));
	
	/* news.setNcreatedate(sd.parse((String)request.getParameter("shi")));
	
	news.setNmodifydate(sd.parse("2018-10-31 20:53:33")); */
	
	news.setNsummary((String)request.getParameter("nsummary"));
	
	String  name=request.getParameter("ntitle");
	news.setNtitle(name);
	String ntid=(String)request.getParameter("ntid");
	Topic topic =topicsDao.findTopicByid(Integer.parseInt(ntid));
	
	
	System.out.print(request.getParameter("ntid"));
		//主要看是不是换名了，并且不与之前的重复
			if(topic!=null){
			news.setNtid(topic.getTid());
				
					if(nd.updateNews(news)>0){
						%>
						<script type="text/javascript">
							alert("当前主题创建成功，点击确认返回主题列表！");
							location.href="../util/do_news_list.jsp";	
						</script>
							
					<% }else{%>
						<script type="text/javascript">
						alert("当前主题已存在....请输入不同的主题！");
						location.href="../newspages/news_update.jsp?id=<%=request.getParameter("id")%>&shi=<%=request.getParameter("shi") %>";	
						</script>
					<% }%>
				
			<% }else {%>
				 <script type="text/javascript">
				alert("请输入不同的主题！");
				location.href="../newspages/news_update.jsp?id=<%=request.getParameter("id")%>&shi=<%=request.getParameter("shi") %>";	
				</script>
			<% }%>
					
			
			
			
			
			

