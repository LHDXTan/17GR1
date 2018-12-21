<%@ page language="java" import="java.util.*,org.news.entity.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加主题--管理后台</title>
<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" type="text/css" />
      <script type="text/javascript" src="../JS/js.js"></script>
  
  <script type="text/javascript">
	$(function(){
		$.ajax({
			"url" :"../topicCao",
			"type":"get",
			"data":"org=select",
			"success":function(str){
				var s= $.parseJSON(str);
				$("#ul").html("");
				$(s).each(function(i,n){
						
					$("#ul").append("<li> &#160;&#160;&#160;&#160; "+this.name+" &#160;&#160;&#160;&#160; <a href='/news_chapter03/newspages/topic_add.jsp?tid="+this.id+"&org=update&name="+this.name+"'>修改</a> &#160;&#160;&#160;&#160; <a href='/news_chapter03/topicCao?tid="+this.id+"&org=delete'>删除</a> </li>");
				});
			}
		});
	});
</script>
</head>
<body>
<%@include file="console_element/top.jsp" %>
<div id="main">
  <%@include file="console_element/left.html" %>
  <div id="opt_area">
    <ul class="classlist" id="ul">
    
      <%-- <%
        List<Topic> list = (ArrayList<Topic>) request.getAttribute("list");
        for(Topic tempTopic: list){ 
     %>
      <li> &#160;&#160;&#160;&#160; <%=tempTopic.getTname() %> &#160;&#160;&#160;&#160; <a href='/news_chapter03/newspages/topic_add.jsp?tid=<%=tempTopic.getTid()%>&org=update&name=<%=tempTopic.getTname()%>'>修改</a> &#160;&#160;&#160;&#160; <a href='/news_chapter03/topicCao?tid=<%=tempTopic.getTid() %>&org=delete'>删除</a> </li>
      <%}%> --%>
    </ul>
  </div>
</div>
<div id="footer">
  <%@include file="console_element/bottom.html" %>
</div>
</body>
</html>
