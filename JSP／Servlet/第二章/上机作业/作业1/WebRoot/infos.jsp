<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'infos.jsp' starting page</title>

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
		request.setCharacterEncoding("utf-8");

		String name = request.getParameter("txtUser");
		String mima = request.getParameter("password");
		String sex = request.getParameter("gen");
		String youXiang = request.getParameter("txtEmail");
		String riQiNian = request.getParameter("year");
		String riQimonth = request.getParameter("month");
		String riQiday = request.getParameter("day");
	%>

	用户名：<%=name%><br> 性别：<%=sex%><br> 电子邮件地址：<%=youXiang%><br>
	出生日期：<%=riQiNian%>年<%=riQimonth%>月<%=riQiday%>日;

</body>
</html>
