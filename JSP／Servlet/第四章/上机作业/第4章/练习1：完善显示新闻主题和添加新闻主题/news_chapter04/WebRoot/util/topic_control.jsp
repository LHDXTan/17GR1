<%@page import="org.news.dao.impl.NewsDaoImpl"%>
<%@page import="org.news.dao.NewsDao"%>
<%@page import="org.news.entity.Topic"%>
<%@page import="org.news.dao.TopicsDao"%>
<%@page import="org.news.dao.impl.TopicsDaoImpl"%>
<%@page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    request.setCharacterEncoding("utf-8");
    String opr = request.getParameter("opr");
    TopicsDao topicsDao = new TopicsDaoImpl();

    if (opr.equals("list")) {
        List<Topic> list = topicsDao.getAllTopics();
        request.setAttribute("list", list);
        request.getRequestDispatcher("/newspages/topic_list.jsp")
                .forward(request, response);
    } else if (opr.equals("add")) {//添加主题
        String tname = request.getParameter("tname");
        Topic topic = topicsDao.findTopicByName(tname);
        if (topic == null) {
            topicsDao.addTopic(tname);
%>
			<script type="text/javascript">
			alert("当前主题创建成功，点击确认返回主题列表！");
			location.href="topic_control.jsp?opr=list";	
			</script>
<%      } else { %>
		    <script type="text/javascript">
			alert("当前主题已存在，请输入不同的主题！");
			location.href="../newspages/topic_add.jsp";	
			</script>
<%			
		}
	}
%>
