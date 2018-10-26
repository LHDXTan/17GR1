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
	你好，现在是
	<%
	out.print(new Date().toLocaleString());
	out.print("<br>");
	int j = 0;
	for (int i = 2000; i <= 2013; i++) {
		if ((i % 4 == 0 && i % 100 != 0) || i % 400 == 0) {

			j++;
		}
	}
	out.print("2000年到2013年有" + j + "个闰年");
	int sum = 0;
	for (int i = 2; i <= 100; i++) {
		for (int k = 2; k <= i; k++) {
			if (i % k == 0 && i != k) {
				break;
			}
			if (i % k == 0 && i == k) {
				System.out.println(i);
				sum += i;
			}
		}
	}
	out.print("<br>");
	out.println("1到100的素数之和是" + sum);
%>
</body>

</html>
