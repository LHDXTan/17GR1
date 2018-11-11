<%@ page language="java" import="java.util.*,org.news.entity.*" pageEncoding="utf-8"%>
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
  <script language="javascript">
	function clickdel(id){
		var flag =  confirm("删除请点击确认");
		if(flag){
			window.location("../util/do_delete_topic.jsp?id="+id);
		}
	}
	
</script>
  <div id="opt_area">
    <ul class="classlist">
      <%
        List<Topic> list = (ArrayList<Topic>) request.getAttribute("list");
        for(Topic tempTopic: list){ 
     %>
      <li> &#160;&#160;&#160;&#160; <%=tempTopic.getTname() %> &#160;&#160;&#160;&#160;
       <a href='../newspages/modify.jsp?tid=<%=tempTopic.getTid()%>'>修改</a>
       &#160;&#160;&#160;&#160;
       <a href='../util/do_delete_topic.jsp?id=<%=tempTopic.getTid() %>' onclick="return clickdel(<%=tempTopic.getTid() %>)">删除</a> </li>
      <%}%>
    </ul>
  </div>
</div>
<div id="footer">
  <%@include file="console_element/bottom.html" %>
</div>
</body>
</html>
