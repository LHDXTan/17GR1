<%@page import="org.news.dao.impl.TopicsDaoImpl"%>
<%@page import="org.news.dao.TopicsDao"%>
<%@page import="org.news.dao.NewsDao"%>
<%@page import="org.news.dao.impl.NewsDaoImpl,org.news.entity.*"%>
<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="utf-8"%>
<%
    request.setCharacterEncoding("utf-8");
    String opr = request.getParameter("opr");
    TopicsDao topicDao = new TopicsDaoImpl();
    NewsDao newsDao = new NewsDaoImpl();
    if ("listTitle".equals(opr)) {
        List<News> list1 = newsDao.getLatestNewsByTID(1, 5);
        List<News> list2 = newsDao.getLatestNewsByTID(2, 5);
        List<News> list3 = newsDao.getLatestNewsByTID(5, 5);
        List<Topic> list = topicDao.getAllTopics();
        List<News> list4 = null;
        String tid = request.getParameter("tid");
        if (tid == null || (tid = tid.trim()).length() == 0)
            list4 = newsDao.getAllnews(); //查询全部新闻
        else // 查询指定主题下的新闻
            list4 = newsDao.getAllnewsByTID(Integer.parseInt(tid));
        request.setAttribute("list1", list1);//左侧国内新闻
        request.setAttribute("list2", list2);//左侧国际新闻
        request.setAttribute("list3", list3);//左侧娱乐新闻
        request.setAttribute("list", list);  //所有的主题
        request.setAttribute("list4", list4);//中间的新闻
        request.getRequestDispatcher("/index.jsp").forward(request,
                response);
    } else if ("list".equals(opr)) {//编辑新闻时对新闻的查找
        List<News> list = newsDao.getAllnews();
        session.setAttribute("list", list);
        response.sendRedirect("../newspages/admin.jsp");
    }
%>

