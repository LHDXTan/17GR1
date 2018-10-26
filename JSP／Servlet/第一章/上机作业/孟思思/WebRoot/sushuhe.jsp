<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	<%
		int i, j; //声明变量i，j；
		int sum = 0; //声明sum初始值为0；
		for (i = 1; i <= 100; i++) //1至100的数，被除数
		{
			for (j = 2; j < i; j++) //除数
			{
				if (i % j == 0) {
					break; //如果余数为0这跳出if跳到第一个for循环，再次执行
				}
				
			}
			if (i==j) //满足第一个if并满足第二个if则输出i的值
				{
					sum = sum + i; //所有素数相加；
					//out.println(i);//输出i的值
				}
		}
			out.println("所有素数何为" + sum);
	%>






	<br>
</body>
</html>
