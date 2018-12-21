<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加主题--管理后台</title>
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function check(){
		var tname = document.getElementById("tname");

		if(tname.value == ""){
			alert("请输入主题名称！！");
			tname.focus();
			return false;
		}		
		return true;
	}
</script>
</head>
<body>
<%@include file="console_element/top.jsp" %>
<div id="main">
  <%@include file="console_element/left.html" %>
  <div id="opt_area">
  <%
    request.setCharacterEncoding("utf-8");
  	String org=	request.getParameter("org");
  String tid=	request.getParameter("tid");
  String name =request.getParameter("name");
  if(name==null){
	  name="";
  }
  	if(org!=null){
  		if(org.equals("insert")){%>
    		<h1 id="opt_type"> 添加主题： </h1>
  			
  		<% }else if(org.equals("update")){%>
  			
    		<h1 id="opt_type"> 更新主题： </h1>
  		<% }
  	}
  
  %>
    <form action="/news_chapter03/topicCao?" method="get" onsubmit="return check()">
      <p>
        <label> 主题名称 </label>
        <input name="tname" type="text" class="opt_input" id="tname" value="<%=name%>" >
      </p>
      <input name="tid" type="hidden" value="<%=tid %>">
      <input name="org" type="hidden" value="<%=org%>">
      <input type="submit" value="提交" class="opt_sub" />
      <input type="reset" value="重置" class="opt_sub" />
    </form>
  </div>
</div>
<div id="footer">
  <%@include file="console_element/bottom.html" %>
</div>
</body>
</html>
