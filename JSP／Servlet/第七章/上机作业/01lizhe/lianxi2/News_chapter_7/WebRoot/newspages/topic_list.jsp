<%@ page language="java" import="java.util.*,org.jbit.news.entity.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加主题--管理后台</title>
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="console_element/top.jsp" %>
<div id="main">
  <%@include file="console_element/left.html" %>
  <div id="opt_area">
    <ul class="classlist">
      <%
        ArrayList<Topic> list4=(ArrayList<Topic>)session.getAttribute("list4");
        for(Topic topic: list4){ 
     %>
      <li> &#160;&#160;&#160;&#160; <%=topic.getTname() %> &#160;&#160;&#160;&#160; <a href='topic_modify.jsp?tid=<%=topic.getTid() %>&tname=<%=topic.getTname() %>'>修改</a> &#160;&#160;&#160;&#160; <a href='../TopicServlet?opr=del&tid=<%=topic.getTid() %>'>删除</a> </li>
      <%}%>
    </ul>
  </div>
</div>
<div id="footer">
  <%@include file="console_element/bottom.html" %>
</div>
</body>
</html>
