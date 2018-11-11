<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="org.news.dao.impl.*"%>
<%@ page import="org.news.entity.*"%>
<%@page import="org.news.util.Page"%>
<%@ page import="org.news.service.impl.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻中国</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	function check(){
		var login_username = document.getElementById("uname");
		var login_password = document.getElementById("upwd");
		if(login_username.value == ""){
			alert("用户名不能为空！请重新填入！");
			login_username.focus();	
			return false;
		}else if(login_password.value == ""){
			alert("密码不能为空！请重新填入！");
			login_password.focus();
			return false;
		}
		return true;
	}
	
	function focusOnLogin(){
		var login_username = document.getElementById("uname");
		login_username.focus();	
	}
</script>
</head>


  <%
 NewsServiceImpl n=new NewsServiceImpl();
 request.setCharacterEncoding("utf-8");
 String pageindex =request.getParameter("pageIndex");
  if(pageindex==null){
	  pageindex="1";
  }
 int xx=Integer.parseInt(pageindex);
 if(xx<1){
	 xx=1;
 }
 Page pa=new Page();
 pa.setPageNumber(xx);
 pa.setPageTiao(6);
 n.fenYe(pa);
 List<News> listNews=pa.getNewsList();
 int zongyemian=pa.getPageCount();
 int danqianye=pa.getPageNumber();
  %>

<body onload="focusOnLogin()">
<div id="header">
  <div id="top_login">
    <form action="util/do_login.jsp" method="post" onsubmit="return check()">
      <label> 登录名 </label>
      <input type="text" name="uname" id="uname" value="" class="login_input" />
      <label> 密&#160;&#160;码 </label>
      <input type="password" name="upwd" id="upwd" value="" class="login_input" />
      <input type="submit" class="login_sub" value="登录" />
      <label id="error"> </label>
      <img src="images/friend_logo.gif" alt="Google" id="friend_logo" />
    </form>
  </div>
  <div id="nav">
    <div id="logo"> <img src="images/logo.jpg" alt="新闻中国" /> </div>
    <div id="a_b01"> <img src="images/a_b01.gif" alt="" /> </div>
    <!--mainnav end-->
  </div>
</div>
<div id="container">
  <div class="sidebar">
    <h1> <img src="images/title_1.gif" alt="国内新闻" /> </h1>
    <div class="side_list">
      <ul>
        <li> <a href='#'><b> 景区，如何不再依靠门票收入 </b></a> </li>
        <li> <a href='#'><b> 高考期间中东部地区将现大范围降雨 </b></a> </li>
        <li> <a href='#'><b> 山西离柳焦煤集团井下人行车发生事故6人死亡 </b></a> </li>
      </ul>
    </div>
    <h1> <img src="images/title_2.gif" alt="国际新闻" /> </h1>
    <div class="side_list">
      <ul>
        <li> <a href='#'><b> 习近平在墨国会发表演讲:朋友要老 好酒要陈 </b></a> </li>
        <li> <a href='#'><b> 普京逮捕铁腕市长展示肌肉向世人表明克宫仍大权在握</b></a> </li>
        <li> <a href='#'><b> 潘基文祝贺赖斯被任命为美国国家安全顾问 </b></a> </li>
        <li> <a href='#'><b> 与基地有关组织宣称对巴格达连环爆炸负责 </b></a> </li>
      </ul>
    </div>
    <h1> <img src="images/title_3.gif" alt="娱乐新闻" /> </h1>
    <div class="side_list">
      <ul>
        <li> <a href='#'><b> "星跳水立方"决战临近 陈楚生被华谊要求进前三 </b></a> </li>
        <li> <a href='#'><b> 《新恋爱时代》登东方卫视 《非诚》元素遭删除 </b></a> </li>
        <li> <a href='#'><b> 《海角七号》导演新片开机 吴宇森等出席 </b></a> </li>
        <li> <a href='#'><b> 《致命黑兰》佐伊坐拥7种武器 暴力登陆全国院线 </b></a> </li>
      </ul>
    </div>
  </div>
  <div class="main">
    <div class="class_type"> <img src="images/class_type.gif" alt="新闻中心" /> </div>
    <div class="content">
      <ul class="class_date">
        <li id='class_month'> <a href='#'><b> 国内 </b></a> <a href='#'><b> 国际 </b></a> <a href='#'><b> 军事 </b></a> <a href='#'><b> 体育 </b></a> <a href='#'><b> 娱乐 </b></a> <a href='#'><b> 社会 </b></a> <a href='#'><b> 财经 </b></a> <a href='#'><b> 科技 </b></a> <a href='#'><b> 健康 </b></a> <a href='#'><b> 汽车 </b></a> <a href='#'><b> 教育 </b></a> </li>
        <li id='class_month'> <a href='#'><b> 房产 </b></a> <a href='#'><b> 家居 </b></a> <a href='#'><b> 旅游 </b></a> <a href='#'><b> 文化 </b></a> <a href='#'><b> 其他 </b></a> </li>
      </ul>
      <ul class="classlist">
        <%
        int i=0;
        for(News ne: listNews){
            %>
            <li><a href="util/news_control.jsp?&&nid=<%=ne.getNid()%>"><%=ne.getNtitle()%></a><span><%=ne.getNcreatedate()%></span></li>
            <%
            i++;
            if(i%6==0){
            	out.println("<li class='space'></li>");
            }
        }
        %>
        <p align="center"> 当前页数:[<%=danqianye%>/<%=zongyemian%>]&nbsp;
        <% 
        if(danqianye>1){
        	%>
          <a href="index.jsp?pageIndex=1">首页</a>&nbsp;
          <a href="index.jsp?pageIndex=<%=danqianye-1%>">上一页</a>
        	<% 
        }
        if(danqianye<zongyemian){
        	%>
          <a href="index.jsp?pageIndex=<%=danqianye+1%>">下一页</a>
          <a href="index.jsp?pageIndex=<%=zongyemian%>">末页</a> 
        <% 
        }
        %></p>
      </ul>
    </div>
    <div class="picnews">
      <ul>
        <li> <a href="#"><img src="images/Picture1.jpg" width="249" alt="" /> </a><a href="#">幻想中穿越时空</a> </li>
        <li> <a href="#"><img src="images/Picture2.jpg" width="249" alt="" /> </a><a href="#">国庆多变的发型</a> </li>
        <li> <a href="#"><img src="images/Picture3.jpg" width="249" alt="" /> </a><a href="#">新技术照亮都市</a> </li>
        <li> <a href="#"><img src="images/Picture4.jpg" width="249" alt="" /> </a><a href="#">群星闪耀红地毯</a> </li>
      </ul>
    </div>
  </div>
  
</div>
  <%@include file="index-elements/index_bottom.html"%>
</body>
</html>
