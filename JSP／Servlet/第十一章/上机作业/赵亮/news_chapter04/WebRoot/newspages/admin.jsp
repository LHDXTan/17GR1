<%@ page language="java" import="java.util.*,java.sql.*,org.news.entity.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>添加主题--管理后台</title>
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="console_element/top.jsp" %>
<div id="main">
  <%@include file="console_element/left.html" %>
  <div id="opt_area">    
  <script type="text/javascript" src="../JS/js.js"></script>
  
  <script type="text/javascript">
	$(function(){
		$.getJSON({
			"url" :"../do_login",
			"data":"name=admin",
			"success":function(str){
				//var s= $.parseJSON(str);
				alert(str);
				$(str).each(function(i,n){
					if((i+1)%5==0){
						$("#ul").append("<li class='space'></li>");
					}else{
						
					$("#ul").append("<li>"+this.ntitle+"<span> 作者："+this.nauthor+" &#160;&#160;&#160;&#160; <a href='newspages/news_add.jsp?nid="+this.id+"&org=update'>修改</a> &#160;&#160;&#160;&#160; <a href='newaction?nid="+this.id+"&org=delete'>删除</a> </span> </li>");
					}
				});
			}
		});
		//查询列表
		$("#a4").click(function(){
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
	});
</script>
    <script language="javascript">
	function clickdel(){
		return confirm("删除请点击确认");
	}
	
		
		
	
</script>
    <ul class="classlist" id="ul">
  <%--     <%	
      List<News> list=( List<News>)request.getAttribute("list");
      if(list==null){
      	response.sendRedirect("do_login");
      	return;
      }else{
	      request.removeAttribute("list");
		  int n=0;
		  for(News tempNew:list){
		    n++;		
	     %> 
	      <li><%=tempNew.getNtitle() %><span> 作者：<%=tempNew.getNauthor() %> &#160;&#160;&#160;&#160; <a href='newspages/news_add.jsp?nid=<%=tempNew.getNid()%>&org=update'>修改</a> &#160;&#160;&#160;&#160; <a href='newaction?nid=<%=tempNew.getNid()%>&org=delete'>删除</a> </span> </li>
	      <%if(n%5==0){ %>
	      <li class='space'></li>
	      <%}} }%> --%>
    </ul>
  </div>
</div>
<div id="footer">
  <%@include file="console_element/bottom.html" %>
</div>
</body>
</html>
