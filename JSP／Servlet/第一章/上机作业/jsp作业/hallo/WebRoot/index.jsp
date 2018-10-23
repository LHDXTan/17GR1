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
  </head>
  
  <body>
  
    <div id="myclock"></div>
<script type="text/javascript">

    function clock_12h()
    {
        var today = new Date(); //获得当前时间
        //获得年、月、日，Date()函数中的月份是从0－11计算
        var year = today.getFullYear();
        var month = today.getMonth()+1;
        var date = today.getDate();
        var hour = today.getHours();  //获得小时、分钟、秒
        var minute = today.getMinutes();
        var second = today.getSeconds();

        var apm="AM"; //默认显示上午: AM
        if (hour>12) //按12小时制显示
        {
            hour=hour-12;
            apm="PM"  ;
        }
        var weekday = 0;
        switch(today.getDay()){
            case 0:
                weekday = "星期日";
                break;
            case 1:
                weekday = "星期一";
                break;
            case 2:
                weekday = "星期二";
                break;
            case 3:
                weekday = "星期三";
                break;
            case 4:
                weekday = "星期四";
                break;
            case 5:
                weekday = "星期五";
                break;
            case 6:
                weekday = "星期六";
                break;
        }

        /*设置div的内容为当前时间*/
        document.getElementById("myclock").innerHTML="<h2>北京时间:</h2><h2>"+year+"年"+month+"月"+date+"日&nbsp;"+hour+":"+minute+":"+second+"&nbsp;"+apm+"&nbsp;"+weekday+"</h2>";

    }
    /*使用setInterval()每间隔指定毫秒后调用clock_12h()*/
    var myTime = setInterval("clock_12h()",1000);

</script>
  </body>
</html>
