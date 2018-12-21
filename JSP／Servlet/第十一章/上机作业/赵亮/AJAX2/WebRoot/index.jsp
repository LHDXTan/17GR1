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
		$("button").click(function(){
			$("div").html($("form").serialize());
		});
		
		$("input[name='username']").blur(function(){
			alert($(this).val());
			if($(this).val()==""){
				//alert("用户名不能为空");
			}
			$.post({
				"url":"indexSer2",
				"data":"user="+$("input[name='username']").val(),
				"success":function(str){
					alert(str);
					//var data=$.parseJSON(str);
					$("input[name='username']").next().html(""); 
					if(str=="1"){
						//alert("s")
						$("input[name='username']").next().html("<font color='green'>*用户名可以使用</font>");
					}else if(str=="0"){
						$("input[name='username']").next().html("<font color='red'>*用户名已存在</font>");
						
					}else{
						
					}
				}
				
				
				
			});
			
		})
			
			$("input[name='eamil']").blur(function(){
			//alert($(this).name());
			if($(this).val()==""){
				//alert("邮箱不能为空");
			}
			$.post({
				"url":"indexSer1",
				"data":"eamil="+$(this).val(),
				"success":function(str){
					//alert(str);
					//var data=$.parseJSON(str);
					if(str=="1"){
						//alert("s")
						$("input[name='eamil']").next().html("<font color='green'>*邮箱可以使用</font>");
					}else if(str=="0"){
						$("input[name='eamil']").next().html("<font color='red'>*邮箱已存在</font>");
						
					}else{
						
					}
				}
				
				
				
			});
			
		})
		$("input[name='pin']").blur(function(){
			//alert($(this).name());
			if($(this).val()==""){
				//alert("密码不能为空");
			}
			$.post({
				"url":"indexSer",
				"data":"pass="+$(this).val(),
				"success":function(str){
					//alert(str);
					//var data=$.parseJSON(str);
					if(str=="1"){
						//alert("s")
						$("input[name='pin']").next().html("<font color='green'>*密码可以使用</font>");
					}else if(str=="0"){
						$("input[name='pin']").next().html("<font color='red'>*密码已存在</font>");
						
					}else{
						
					}
				}
				
				
				
			});
			
		})
			
			
			
			/* if($(this).html()!=""){
			$(this).next().html("<font color='green'>*可以使用</font>");
				
			}else{
			$(this).next().html("<font color='red'>*不能为空</font>");
			} */
				
	});
	
	
	</script>
  </head>
  
  <body>
       <form method="get" >
     	注册邮箱：<input type="text" name="eamil" id="ea" /><span></span>	
     	
     	<br>
     	用 户   名：<input type="text" name="username" /><span></span>	
     	<br>
     	密         码：<input type="password" name="pin" /><span></span>
     	<br>
     
           
     </form>
     <button>注册</button>
     <div></div>
  </body>
</html>
