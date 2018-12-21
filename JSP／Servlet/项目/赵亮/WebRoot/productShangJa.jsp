<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<base href="<%=basePath%>">
<%
	String paths = request.getContextPath();
String user=(String)session.getAttribute("userName");
%>
<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
	function deleteById(id) {
		alert(id);
		window.location.href="<%=path%>/ProductAction?org=deleteProduct&id="+id;
		alert("删除成功");
	}
	$(function(){

		//一级下拉框
		$.get({
			"url":"ProductAction",
			"data":{
				"org":"selectFenlei",
				
			},
			"success":function(str){
				//作为以及Id
				var data=$.parseJSON(str);
				//alert(data);
				$("#productCategoryLevel1").empty().append(
						"<option selected='selected'>请选择</option>"		
						);
				$(data).each(function(){
					$("#productCategoryLevel1").append(
					"<option value='"+this.id+"'>"+this.name+"</option>"		
					);
				})
			}
		});
		//二级列表
		$("#productCategoryLevel1").change(function(){
			var id=$(this).val();
			$.get({
				"url":"ProductAction",
				"data":{
					"org":"selectFenlei",
					"id":id
				},
				"success":function(str){
					//作为以及Id
					var data=$.parseJSON(str);
					//alert(data);
					$("#productCategoryLevel2").empty().append(
							"<option selected='selected'>请选择</option>"		
							);
					$(data).each(function(){
						$("#productCategoryLevel2").append(
						"<option value='"+this.id+"'>"+this.name+"</option>"		
						);
					})
				}
			});
		});
		//三级列表
		$("#productCategoryLevel2").change(function(){
			var id=$(this).val();
			$.get({
				"url":"ProductAction",
				"data":{
					"org":"selectFenlei",
					"id":id
				},
				"success":function(str){
					//作为以及Id
					var data=$.parseJSON(str);
					//alert(data);
					$("#productCategoryLevel3").empty().append(
							"<option selected='selected'>请选择</option>"		
							);
					$(data).each(function(){
						$("#productCategoryLevel3").append(
						"<option value='"+this.id+"'>"+this.name+"</option>"		
						);
					})
				}
			});
		});
		$("input[type='submit']").click(function(){
			var fileName=$("input[name='photo']").val();
			var caregoryLevel1=$("#productCategoryLevel1").val();
			var caregoryLevel2=$("#productCategoryLevel2").val();
			var caregoryLevel3=$("#productCategoryLevel3").val();
			var name=$("input[name='name']").val();
			var price =$("input[name='price']").val();
			var stock=$("input[name='stock']").val();
			var   description =$("textarea[name='description']").val();
			
			if(name==""){
				alert("商品名称不能为空");
				return false;
			}
			var petton=/^[0-9].{0,1}[0-9]{1}$/;
			if(petton.test(price)){
			}else {
				alert("价格 格式不正确");
				return false;
			}
			petton=/^[0-9]$/;
			if(petton.test(stock)){
			}else {
				if(stock==0){
					alert("库存至少为一")
					return false;
				}
				alert("库存 格式不正确");
				return false;
			}
			return false;
		})
	})
</script>
<%-- <c:if test="${empty PageOrderList}">
	<script>
	
	  alert(1)
	</script>


</c:if>
<c:if test="${PageOrderList}">
	<script>
	
	  alert(2)
	</script>


</c:if> --%>
</head>
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
src="images/logo.png"></A>     </DIV>     
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
  <LI><A class="now" href="<%=path%>/ProductAction?org=selectMyDian">我的订单</A></LI>
  <LI><A 
  href="<%=path%>/ProductAction?org=selectDetailAll">全部订单</A></LI></UL></DIV>
<DIV class="left_m">
<DIV class="left_m_t t_bg2">会员中心</DIV>
<UL>
  <LI><A 
  href="<%=path%>/user.jsp">用户信息</A></LI>
  <LI><A 
  href="<%=path%>/ProductAction?org=selectUserList">用户列表</A></LI></UL></DIV>
<DIV class="left_m">
<DIV class="left_m_t t_bg2">商品管理</DIV>
<UL>
  <LI><A 
  href="<%=path%>/ProductAction?org=selectProductCategory">分类管理</A></LI>
  <LI><A 
  href="/easybuy/ProductAction?org=productlist">商品管理</A></LI>
  <LI><A 
  href="<%=path%>/productShangJa.jsp">商品上架</A></LI></UL></DIV>
<DIV class="left_m">
<DIV class="left_m_t t_bg2">资讯中心</DIV>

<UL>
  <LI><A 
  href="<%=path%>/ProductAction?org=selectNewList">资讯列表</A></LI></UL></DIV></DIV>
<DIV class="m_right" id="content">
<DIV class="mem_tit">                                                            
添加商品                                                                     
</DIV><BR>
<FORM id="productAdd" onsubmit="return checkProduct();" action="/EasyBuy/admin/product?action=addProduct" 
enctype="multipart/form-data" method="post">
<TABLE class="add_tab" style="width: 930px;" border="0" cellspacing="0" 
cellpadding="0">
  <TBODY>
  <TR>
    <TD width="135" align="right">一级分类</TD>
    <TD style='font-family: "宋体";' colspan="3"><SELECT name="categoryLevel1Id" 
      id="productCategoryLevel1" style="background-color: rgb(246, 246, 246);" 
      onchange="queryProductCategoryList(this,'productCategoryLevel2');"><OPTION 
        selected="selected" value="">请选择...</OPTION>                             
                                        <OPTION value="548">化妆品</OPTION>         
                                                            <OPTION 
        value="628">家用商品</OPTION>                                                
                     <OPTION value="660">进口食品,生鲜</OPTION>                        
                                             <OPTION value="670">电子商品</OPTION>   
                                                                  <OPTION value="676">保健食品</OPTION> 
                                                                    <OPTION 
        value="681">箱包</OPTION>                                                  
           </SELECT>                     </TD></TR>
  <TR>
    <TD width="135" align="right">二级分类</TD>
    <TD><SELECT name="categoryLevel2Id" id="productCategoryLevel2" style="background-color: rgb(246, 246, 246);" 
      onchange="queryProductCategoryList(this,'productCategoryLevel3');"><OPTION 
        selected="selected" value="0">请选择...</OPTION>                            
                                 </SELECT>                     </TD></TR>
  <TR>
    <TD width="135" align="right">三级分类</TD>
    <TD><SELECT name="categoryLevel3Id" id="productCategoryLevel3" style="background-color: rgb(246, 246, 246);"><OPTION 
        selected="selected" value="0">请选择...</OPTION>                            
                                 </SELECT>                     </TD></TR>
  <TR>
    <TD width="135" align="right">商品名称</TD>
    <TD><INPUT name="name" class="add_ipt" id="name" type="text">（必填）          
                     <INPUT name="id" id="id" type="hidden">                     
    </TD></TR>
  <TR>
    <TD width="135" align="right">商品图片</TD>
    <TD><INPUT name="photo" class="text" type="file"><SPAN></SPAN>             
              </TD></TR>
  <TR>
    <TD width="135" align="right">单价</TD>
    <TD><INPUT name="price" class="add_ipt" id="price" type="text">            
               </TD></TR>
  <TR>
    <TD width="135" align="right">库存</TD>
    <TD><INPUT name="stock" class="add_ipt" id="stock" type="text">            
               </TD></TR>
  <TR>
    <TD width="135" align="right">描述</TD>
    <TD><TEXTAREA name="description"></TEXTAREA>                     </TD></TR>
  <TR>
    <TD></TD>
    <TD><INPUT class="s_btn" type="submit" value="商品上架">                       
                                                                                 
         </TD></TR></TBODY></TABLE></FORM></DIV>     </DIV>
<DIV class="b_btm_bg b_btm_c" id="footer">
<DIV class="b_btm">
<TABLE style="width: 210px; height: 62px; margin-top: 30px; margin-left: 75px; float: left;" 
border="0" cellspacing="0" cellpadding="0">
  <TBODY>
  <TR>
    <TD width="72"><IMG width="62" height="62" src="images/b1.png"></TD>
    <TD>
      <H2>正品保障</H2>正品行货  放心购买</TD></TR></TBODY></TABLE>
<TABLE style="width: 210px; height: 62px; margin-top: 30px; margin-left: 75px; float: left;" 
border="0" cellspacing="0" cellpadding="0">
  <TBODY>
  <TR>
    <TD width="72"><IMG width="62" height="62" src="images/b2.png"></TD>
    <TD>
      <H2>满38包邮</H2>满38包邮 免运费</TD></TR></TBODY></TABLE>
<TABLE style="width: 210px; height: 62px; margin-top: 30px; margin-left: 75px; float: left;" 
border="0" cellspacing="0" cellpadding="0">
  <TBODY>
  <TR>
    <TD width="72"><IMG width="62" height="62" src="images/b3.png"></TD>
    <TD>
      <H2>天天低价</H2>天天低价 畅选无忧</TD></TR></TBODY></TABLE>
<TABLE style="width: 210px; height: 62px; margin-top: 30px; margin-left: 75px; float: left;" 
border="0" cellspacing="0" cellpadding="0">
  <TBODY>
  <TR>
    <TD width="72"><IMG width="62" height="62" src="images/b4.png"></TD>
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
  href="<%=path%>/ProductAction?org=selectMyDian">我的订单</A></DD></DL> 
  
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
src="images/er.gif"></DIV><IMG src="images/ss.png">   </DIV> 
</DIV>
<DIV class="btmbg">
<DIV class="btm">备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 
2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group 
<BR><IMG width="98" height="33" src="images/b_1.gif"><IMG width="98" 
height="33" src="images/b_2.gif"><IMG width="98" height="33" src="images/b_3.gif"><IMG 
width="98" height="33" src="images/b_4.gif"><IMG width="98" height="33" 
src="images/b_5.gif"><IMG width="98" height="33" src="images/b_6.gif"> 
  </DIV></DIV></DIV></BODY></HTML>
