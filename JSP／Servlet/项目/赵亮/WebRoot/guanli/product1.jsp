<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8" />
<link type="text/css" rel="stylesheet" href="css/style.css" />
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
<script type="text/javascript" src="js/js.js"></script>
<link rel="stylesheet" type="text/css" href="css/ShopShow.css" />
<link rel="stylesheet" type="text/css" href="css/MagicZoom.css" />
   
<META http-equiv="Content-Type" content="text/html; charset=utf-8">   
<SCRIPT type="text/javascript">
  var contextPath = "/EasyBuy";
</SCRIPT>
 
<META name="GENERATOR" content="MSHTML 11.00.10570.1001"></HEAD>
<BODY>
<DIV class="soubg">   
<DIV class="sou"><!--Begin 所在收货地区 Begin-->    	 <SPAN class="s_city_b"><SPAN 
class="fl">送货至：</SPAN>             <SPAN class="s_city"><SPAN>四川</SPAN>          
       
<DIV class="s_city_bg">
<DIV class="s_city_t"></DIV>
<DIV class="s_city_c">
<H2>请选择所在的收货地区</H2>
<TABLE class="c_tab" style="width: 235px; margin-top: 10px;" border="0" 
cellspacing="0" cellpadding="0">
  <TBODY>
  <TR>
    <TH>A</TH>
    <TD class="c_h"><SPAN>安徽</SPAN><SPAN>澳门</SPAN></TD></TR>
  <TR>
    <TH>B</TH>
    <TD class="c_h"><SPAN>北京</SPAN></TD></TR>
  <TR>
    <TH>C</TH>
    <TD class="c_h"><SPAN>重庆</SPAN></TD></TR>
  <TR>
    <TH>F</TH>
    <TD class="c_h"><SPAN>福建</SPAN></TD></TR>
  <TR>
    <TH>G</TH>
    <TD 
      class="c_h"><SPAN>广东</SPAN><SPAN>广西</SPAN><SPAN>贵州</SPAN><SPAN>甘肃</SPAN></TD></TR>
  <TR>
    <TH>H</TH>
    <TD 
      class="c_h"><SPAN>河北</SPAN><SPAN>河南</SPAN><SPAN>黑龙江</SPAN><SPAN>海南</SPAN><SPAN>湖北</SPAN><SPAN>湖南</SPAN></TD></TR>
  <TR>
    <TH>J</TH>
    <TD class="c_h"><SPAN>江苏</SPAN><SPAN>吉林</SPAN><SPAN>江西</SPAN></TD></TR>
  <TR>
    <TH>L</TH>
    <TD class="c_h"><SPAN>辽宁</SPAN></TD></TR>
  <TR>
    <TH>N</TH>
    <TD class="c_h"><SPAN>内蒙古</SPAN><SPAN>宁夏</SPAN></TD></TR>
  <TR>
    <TH>Q</TH>
    <TD class="c_h"><SPAN>青海</SPAN></TD></TR>
  <TR>
    <TH>S</TH>
    <TD class="c_h"><SPAN>上海</SPAN><SPAN>山东</SPAN><SPAN>山西</SPAN><SPAN class="c_check">四川</SPAN><SPAN>陕西</SPAN></TD></TR>
  <TR>
    <TH>T</TH>
    <TD class="c_h"><SPAN>台湾</SPAN><SPAN>天津</SPAN></TD></TR>
  <TR>
    <TH>X</TH>
    <TD class="c_h"><SPAN>西藏</SPAN><SPAN>香港</SPAN><SPAN>新疆</SPAN></TD></TR>
  <TR>
    <TH>Y</TH>
    <TD class="c_h"><SPAN>云南</SPAN></TD></TR>
  <TR>
    <TH>Z</TH>
    <TD class="c_h"><SPAN>浙江</SPAN></TD></TR></TBODY></TABLE></DIV></DIV></SPAN>     
    </SPAN>         <!--End 所在收货地区 End-->         <SPAN class="fr"><SPAN class="fl"><A 
href="http://localhost:8082/EasyBuy/admin/user?action=index">丑丑</A>&nbsp;|&nbsp;<A 
href="http://localhost:8082/EasyBuy/admin/order?action=index&amp;userId=23">我的订单</A>&nbsp;</SPAN> 
                                 <SPAN class="fl">|&nbsp;<A href="http://localhost:8082/EasyBuy/admin/product?action=index&amp;userId=23">后台管理</A>&nbsp;</SPAN> 
                                  <SPAN class="fl">|&nbsp;<A href="http://localhost:8082/EasyBuy/Login?action=loginOut">注销</A></SPAN> 
                  </SPAN>   </DIV></DIV>
<DIV class="black_overlay" id="fade1"></DIV>
<DIV class="white_content" id="MyDiv1">
<DIV class="white_d">
<DIV class="notice_t"><SPAN class="fr" style="margin-top: 10px; cursor: pointer;" 
onclick="CloseDiv_1('MyDiv1','fade1')"><IMG 
src="product_files/close.gif"></SPAN>     </DIV>
<DIV class="notice_c">
<TABLE align="center" border="0" cellspacing="0" cellpadding="0">
  <TBODY>
  <TR valign="top">
    <TD width="40"><IMG src="product_files/suc.png"></TD>
    <TD><SPAN id="showMessage" style="color: rgb(62, 62, 62); font-size: 18px; font-weight: bold;">操作成功</SPAN><BR></TD></TR></TBODY></TABLE></DIV></DIV></DIV><LINK 
href="product_files/style.css" rel="stylesheet" type="text/css"> 
<SCRIPT src="product_files/jquery-1.11.1.min_044d0927.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/jquery.bxslider_e88acd1b.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/jquery-1.8.2.min.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/menu.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/select.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/lrscroll.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/iban.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/fban.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/f_ban.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/mban.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/bban.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/hban.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/tban.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/lrscroll_1.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/register.js" type="text/javascript"></SCRIPT>
 <LINK href="product_files/ShopShow.css" rel="stylesheet" type="text/css"> <LINK 
href="product_files/MagicZoom.css" rel="stylesheet" type="text/css"> 
<SCRIPT src="product_files/MagicZoom.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/num.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/p_tab.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="product_files/shade.js" type="text/javascript"></SCRIPT>
   
<SCRIPT src="product_files/backend.js"></SCRIPT>
 
<SCRIPT type="text/javascript">
    var contextPath = "/EasyBuy";
</SCRIPT>
 
<DIV class="top">
<DIV class="logo"><A href="http://localhost:8082/EasyBuy/Home?action=index"><IMG 
src="product_files/logo.png"></A>     </DIV>     
<DIV class="i_car">
<DIV class="car_t">购物车 [             <SPAN>空                             
</SPAN>]         </DIV>
<DIV class="car_bg"><!--Begin 购物车未登录 Begin-->                                    
     
<DIV class="un_login">我的购物车</DIV><!--End 购物车未登录 End-->             <!--Begin 购物车已登录 Begin--> 
            
<UL class="cars"></UL>
<DIV class="price_sum">共计&nbsp;<FONT color="#ff4e00">￥</FONT><SPAN></SPAN></DIV>
<DIV class="price_a"><A href="http://localhost:8082/EasyBuy/Cart?action=toSettlement">去结算</A></DIV><!--End 购物车已登录 End--> 
        </DIV></DIV></DIV><!--End Header End--> 
<DIV class="i_bg bg_color"><!--Begin 用户中心 Begin -->   
<DIV class="m_content">
<DIV class="m_left">
<DIV class="left_n">管理中心</DIV>
<DIV class="left_m">
<DIV class="left_m_t t_bg1">订单中心</DIV>
<UL>
  <LI><A href="http://localhost:8082/EasyBuy/admin/order?action=index&amp;userId=23">我的订单</A></LI>
  <LI><A 
  href="http://localhost:8082/EasyBuy/admin/order?action=queryAllOrder">全部订单</A></LI></UL></DIV>
<DIV class="left_m">
<DIV class="left_m_t t_bg2">会员中心</DIV>
<UL>
  <LI><A 
  href="http://localhost:8082/EasyBuy/admin/user?action=index">用户信息</A></LI>
  <LI><A 
  href="http://localhost:8082/EasyBuy/admin/user?action=queryUserList">用户列表</A></LI></UL></DIV>
<DIV class="left_m">
<DIV class="left_m_t t_bg2">商品管理</DIV>
<UL>
  <LI><A 
  href="http://localhost:8082/EasyBuy/admin/productCategory?action=index">分类管理</A></LI>
  <LI><A class="now" href="http://localhost:8082/EasyBuy/admin/product?action=index">商品管理</A></LI>
  <LI><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=toAddProduct">商品上架</A></LI></UL></DIV>
<DIV class="left_m">
<DIV class="left_m_t t_bg2">资讯中心</DIV>
<UL>
  <LI><A 
  href="http://localhost:8082/EasyBuy/admin/news?action=queryNewsList">资讯列表</A></LI></UL></DIV></DIV>
<DIV class="m_right" id="content">
<DIV class="mem_tit">商品列表</DIV><BR>
<TABLE class="order_tab" style="width: 930px; text-align: center; margin-bottom: 30px;" 
border="0" cellspacing="0" cellpadding="0">
  <TBODY>
  <TR>
    <TD width="10%">商品名称</TD>
    <TD width="10%">商品图片</TD>
    <TD width="5%">库存</TD>
    <TD width="10%">价格</TD>
    <TD width="10%" colspan="2">操作</TD></TR>
  <TR>
    <TD>香奈儿</TD>
    <TD><A href="http://localhost:8082/EasyBuy/Product?action=queryProductDeatil&amp;id=733" 
      target="_blank"><IMG width="50" height="50" src="product_files/27A1789ED5764D82A5506DF3DC3933F9.jpg"> 
                    </A>             </TD>
    <TD>1</TD>
    <TD>152.0</TD>
    <TD><A href="http://localhost:8082/EasyBuy/admin/product?action=toUpdateProduct&amp;id=733">修改</A></TD>
    <TD><A onclick="deleteById('733');" 
href="javascript:void(0);">删除</A></TD></TR>
  <TR>
    <TD>洗面奶</TD>
    <TD><A href="http://localhost:8082/EasyBuy/Product?action=queryProductDeatil&amp;id=734" 
      target="_blank"><IMG width="50" height="50" src="product_files/D6C9BD438C5643D6B1A6C52E5426FE22.jpg"> 
                    </A>             </TD>
    <TD>995</TD>
    <TD>152.0</TD>
    <TD><A href="http://localhost:8082/EasyBuy/admin/product?action=toUpdateProduct&amp;id=734">修改</A></TD>
    <TD><A onclick="deleteById('734');" 
href="javascript:void(0);">删除</A></TD></TR>
  <TR>
    <TD>啫喱水</TD>
    <TD><A href="http://localhost:8082/EasyBuy/Product?action=queryProductDeatil&amp;id=735" 
      target="_blank"><IMG width="50" height="50" src="product_files/1A836D2B3A3348DDAB19807E6CEA8028.jpg"> 
                    </A>             </TD>
    <TD>998</TD>
    <TD>152.0</TD>
    <TD><A href="http://localhost:8082/EasyBuy/admin/product?action=toUpdateProduct&amp;id=735">修改</A></TD>
    <TD><A onclick="deleteById('735');" 
href="javascript:void(0);">删除</A></TD></TR>
  <TR>
    <TD>香水5852</TD>
    <TD><A href="http://localhost:8082/EasyBuy/Product?action=queryProductDeatil&amp;id=736" 
      target="_blank"><IMG width="50" height="50" src="product_files/4D9499BAD92A42D291094E797BA2EA3F.jpg"> 
                    </A>             </TD>
    <TD>1000</TD>
    <TD>152.0</TD>
    <TD><A href="http://localhost:8082/EasyBuy/admin/product?action=toUpdateProduct&amp;id=736">修改</A></TD>
    <TD><A onclick="deleteById('736');" 
href="javascript:void(0);">删除</A></TD></TR>
  <TR>
    <TD>香水</TD>
    <TD><A href="http://localhost:8082/EasyBuy/Product?action=queryProductDeatil&amp;id=737" 
      target="_blank"><IMG width="50" height="50" src="product_files/A9924F9DB68B4DF99FDBF05902075AF0.jpg"> 
                    </A>             </TD>
    <TD>111</TD>
    <TD>152.0</TD>
    <TD><A href="http://localhost:8082/EasyBuy/admin/product?action=toUpdateProduct&amp;id=737">修改</A></TD>
    <TD><A onclick="deleteById('737');" 
  href="javascript:void(0);">删除</A></TD></TR></TBODY></TABLE>
<SCRIPT type="text/javascript">
    var contextPath = "/EasyBuy";
</SCRIPT>
 
<DIV class="pages"><A class="p_pre" href="http://localhost:8082/EasyBuy//admin/product?action=index&amp;currentPage=1">首页</A> 
                                            <A class="cur" href="http://localhost:8082/EasyBuy//admin/product?action=index&amp;currentPage=1">1</A> 
                                                                        <A href="http://localhost:8082/EasyBuy//admin/product?action=index&amp;currentPage=2">2</A> 
                                                            <A href="http://localhost:8082/EasyBuy//admin/product?action=index&amp;currentPage=3">3</A> 
                                                            <A href="http://localhost:8082/EasyBuy//admin/product?action=index&amp;currentPage=4">4</A> 
                                   <A class="p_pre" href="http://localhost:8082/EasyBuy//admin/product?action=index&amp;currentPage=2">下一页</A> 
            <A class="p_pre" href="http://localhost:8082/EasyBuy//admin/product?action=index&amp;currentPage=8">尾页</A> 
        </DIV></DIV>   </DIV>
<DIV class="b_btm_bg b_btm_c" id="footer">
<DIV class="b_btm">
<TABLE style="width: 210px; height: 62px; margin-top: 30px; margin-left: 75px; float: left;" 
border="0" cellspacing="0" cellpadding="0">
  <TBODY>
  <TR>
    <TD width="72"><IMG width="62" height="62" src="product_files/b1.png"></TD>
    <TD>
      <H2>正品保障</H2>正品行货  放心购买</TD></TR></TBODY></TABLE>
<TABLE style="width: 210px; height: 62px; margin-top: 30px; margin-left: 75px; float: left;" 
border="0" cellspacing="0" cellpadding="0">
  <TBODY>
  <TR>
    <TD width="72"><IMG width="62" height="62" src="product_files/b2.png"></TD>
    <TD>
      <H2>满38包邮</H2>满38包邮 免运费</TD></TR></TBODY></TABLE>
<TABLE style="width: 210px; height: 62px; margin-top: 30px; margin-left: 75px; float: left;" 
border="0" cellspacing="0" cellpadding="0">
  <TBODY>
  <TR>
    <TD width="72"><IMG width="62" height="62" src="product_files/b3.png"></TD>
    <TD>
      <H2>天天低价</H2>天天低价 畅选无忧</TD></TR></TBODY></TABLE>
<TABLE style="width: 210px; height: 62px; margin-top: 30px; margin-left: 75px; float: left;" 
border="0" cellspacing="0" cellpadding="0">
  <TBODY>
  <TR>
    <TD width="72"><IMG width="62" height="62" src="product_files/b4.png"></TD>
    <TD>
      <H2>准时送达</H2>收货时间由你做主</TD></TR></TBODY></TABLE></DIV></DIV>
<DIV class="b_nav">
<DL>
  <DT><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">新手上路</A></DT>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">售后流程</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">购物流程</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">订购方式</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">隐私声明</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">推荐分享说明</A></DD></DL> 
  
<DL>
  <DT><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">配送与支付</A></DT>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">货到付款区域</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">配送支付查询</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">支付方式说明</A></DD></DL> 
  
<DL>
  <DT><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">会员中心</A></DT>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">资金管理</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">我的收藏</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">我的订单</A></DD></DL> 
  
<DL>
  <DT><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">服务保证</A></DT>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">退换货原则</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">售后服务保证</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">产品质量保证</A></DD></DL> 
  
<DL>
  <DT><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">联系我们</A></DT>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">网站故障报告</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">购物咨询</A></DD>
  <DD><A 
  href="http://localhost:8082/EasyBuy/admin/product?action=index#">投诉与建议</A></DD></DL> 
  
<DIV class="b_tel_bg"><A class="b_sh1" href="http://localhost:8082/EasyBuy/admin/product?action=index#">新浪微博</A> 
    <A class="b_sh2" href="http://localhost:8082/EasyBuy/admin/product?action=index#">腾讯微博</A> 
    
<P>      服务热线：<BR><SPAN>400-123-4567</SPAN>     </P></DIV>
<DIV class="b_er">
<DIV class="b_er_c"><IMG width="118" height="118" 
src="product_files/er.gif"></DIV><IMG src="product_files/ss.png">   </DIV> 
</DIV>
<DIV class="btmbg">
<DIV class="btm">备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 
2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group 
<BR><IMG width="98" height="33" src="product_files/b_1.gif"><IMG width="98" 
height="33" src="product_files/b_2.gif"><IMG width="98" height="33" src="product_files/b_3.gif"><IMG 
width="98" height="33" src="product_files/b_4.gif"><IMG width="98" height="33" 
src="product_files/b_5.gif"><IMG width="98" height="33" src="product_files/b_6.gif"> 
  </DIV></DIV></DIV></BODY></HTML>
