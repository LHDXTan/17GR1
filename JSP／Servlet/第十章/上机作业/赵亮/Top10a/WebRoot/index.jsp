<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="JS/js.js"></script>
	<script type="text/javascript">
	 $(function(){
		 var str=[  {"id":1,   "name":"校长",  "zhuzhi":"北京市海定区",  "sj":123},
		            {"id":2,   "name":"小花",  "zhuzhi":"南阳市卧龙区区",  "sj":456},
		            {"id":3,   "name":"柿子",  "zhuzhi":"南阳市宛城区",  "sj":789},
		          
		          ];
		 $("#usl").append("<tr><td>ID</td><td>名字</td><td>住址</td><td>手机号码</td></tr>"); 
		 $("select").append("<option>人员信息</option>");
		   $(str).each(function(i,n){
			   
			   $("#usl").append("<tr><td>"+this.id+"</td><td>"+n.name+"</td><td>"+n.zhuzhi+"</td><td>"+n.sj+"</td></tr>");
		 $("select").append("<option value="+(i+1)+">"+"ID："+n.id+"　名字："+n.name+"　住址："+n.zhuzhi+"　手机号码 ：　"+n.sj+"</option>");
		   });  
		 
	 });
	</script>
  </head>
  
  <body>  
       <table id="usl" border="1px">
       </table>
      <select>
      </select>
  
  </body>
</html>
