<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->    
    <script type="text/javascript" src="js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider_e88acd1b.js"></script>
    
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>    
        
	<script type="text/javascript" src="js/select.js"></script>
    
	<script type="text/javascript" src="js/lrscroll.js"></script>
    
    <script type="text/javascript" src="js/iban.js"></script>
    <script type="text/javascript" src="js/fban.js"></script>
    <script type="text/javascript" src="js/f_ban.js"></script>
    <script type="text/javascript" src="js/mban.js"></script>
    <script type="text/javascript" src="js/bban.js"></script>
    <script type="text/javascript" src="js/hban.js"></script>
    <script type="text/javascript" src="js/tban.js"></script>
    
	<script type="text/javascript" src="js/lrscroll_1.js"></script>
    
    
<title>尤洪</title>
</head>

<script>
$(function(){
	$("#yonghuming").blur(function(){
		var name= $("#yonghuming").val();
		$.get("servlet/UserServlet","pro=cunzaima&name="+name,function(data){
			$("#tishi").empty();
			$("#tishi").append("<td colspan='2'><font color='#ff4e00'>"+data+"</font></td>");
		});
		
		
	});
	$("#zcform").submit(function(){
	var yonghuming=$("#yonghuming").val();
		if(yonghuming==""||yonghuming==null){
			alert("用户名不能为空");
			return false;
		}
		
		var zhengshixingming=$("#zhengshixingming").val();
		if(zhengshixingming==""||zhengshixingming==null){
			alert("真实姓名不能为空");
			return false;
		}	
		
		var mima=$("#mima").val();
		if(mima==""||mima==null){
			alert("密码不能为空");
			return false;
		}	
		
		var remima=$("#remima").val();
		if(!remima==mima){
			alert("两次密码不一致");
			return false;
		}
		
		var tiaokuan=$("#tiaokuan:checked").val();
		if(!tiaokuan){
			alert("请勾选服务条款");
			return false;
		}
		
	});
	
});

</script>
<body>  
<!--Begin Header Begin-->
<div class="soubg">
	<div class="sou">
        <span class="fr">
        	<span class="fl">你好，请<a href="Login.jsp">登录</a>&nbsp; <a href="Regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp; </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg">	
    <div class="top">
        <div class="logo"><a href="Index.jsp"><img src="images/logo.png" /></a></div>
    </div>
	<div class="regist">
    	<div class="log_img"><img src="images/l_img.png" width="611" height="425" /></div>
		<div class="reg_c">
        	<form action="servlet/UserServlet" method="get" id="zcform">
        	<input type="hidden" name="pro" value="zuce">
            <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	<td width="95">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">注册</span>
                    <span class="fr">已有商城账号，<a href="Login.jsp" style="color:#ff4e00;">我要登录</a></span>
                </td>
              </tr>
              <tr height="25" id="tishi">
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;用户名 &nbsp;</td>
                <td><input type="text" value="" class="l_user" name="user" id="yonghuming"/></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;真实姓名 &nbsp;</td>
                <td><input type="text" value="" class="l_user" name="zsuser" id="zhengshixingming"/></td>
              </tr>
               <tr height="50">
                <td align="right">&nbsp;身份证号 &nbsp;</td>
                <td><input type="text" value="" class="l_user" name="sfzh" id="shengfengzhenghao"/></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                <td><input type="password" value="" class="l_pwd" name="ps" id="mima"/></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                <td><input type="password" value="" class="l_pwd" name="reps" id="remima"/></td>
              </tr>
               <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;性别 &nbsp;</td>
                <td> &nbsp;男<input type="radio" value="男" name="xingbie" checked/> &nbsp;女<input type="radio" value="女" name="xingbie"/></td>
              </tr>
              <tr height="50">
                <td align="right">&nbsp;邮箱 &nbsp;</td>
                <td><input type="text" value="" class="l_email" name="email" id="youxiang"/></td>
              </tr>
              <tr height="50">
                <td align="right">&nbsp;手机号 &nbsp;</td>
                <td><input type="text" value="" class="l_tel" name="shoujihao" id="sjhm"/></td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" id="tiaokuan"/></label><label class="r_txt">我已阅读并接受《用户协议》</label>
                    </span>
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="submit" value="立即注册" class="log_btn" /></td>
              </tr>
            </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End--> 
<!--Begin Footer Begin-->
<div class="btmbg">
    <div class="btm">
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
        <img src="images/b_1.gif" width="98" height="33" /><img src="images/b_2.gif" width="98" height="33" /><img src="images/b_3.gif" width="98" height="33" /><img src="images/b_4.gif" width="98" height="33" /><img src="images/b_5.gif" width="98" height="33" /><img src="images/b_6.gif" width="98" height="33" />
    </div>    	
</div>
<!--End Footer End -->    

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
