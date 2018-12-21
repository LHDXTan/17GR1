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
<script type="text/javascript">
	

	function  BuyCar_Two_gouwuche(){
	alert("sssdfdsf");
	var i=$("input[name='selectAddress']:checked").length;
	//判断是否被勾选
	if(i==0){
		alert("请选送货地址")
		return ;	
	}
	var radio="";
	//判断是否为新地址
	if($("input[name='selectAddress']:checked").val()==-1){
		var address=$("input[name='address']").val();
		var remark=$("input[name='remark']").val();
		
		if(address==""){
			alert("请在地址一栏填写你的地址");
			return ;
		}
		if(remark==""){
			remark="";
		}
		radio=address+remark;
	}else{
		
	radio=$("input[name='selectAddress']:checked").parent().next().html();
	}
	//拿到地址
	//alert(radio);
	//总金额
	 var zong=$(".peo_tab").next().children("tbody").children("tr").children("td").children("b").children("span").html();
	alert(zong);
//插入Order 数据
//插入数据
		$.get({
			"url":"<%=path%>/ProductAction",
			"data":{
				"cost":zong,
				"org":"insertOrder",
				"userAddress":radio
			},
			"success":function(str){
				//alert(str);
				var order=$.parseJSON(str);
				//插入Detail数据
				$(".car_tab tr[class]").each(function(){
						var  id=$(this).attr("name");
						//alert(id);
						//alert(order.id);
						var count=$(this).children("td").next().html();
						//alert("count "+count);
						var  price =$(this).children("td").next().next().children("span").html()	
						//alert("price "+price);
						 $.get({
							"url":"<%=path%>/ProductAction",
							"data":{
								"orderId":order.id,
								"productId":id,
								"quantity":count,
								"cost":price*count,
								"org":"insertDetail"
							},
							"success":function(str){
								
							}
						}); 
						//BuyCar_Three_gouwuChe();
						alert("BuyCar_Three_gouwuChe");
						$(".i_bg").empty();
						alert($(".car_t>span").html());
						$(".car_t>span").html(0);
						$(".cars").empty();
						$(".price_sum>span").html(0);
						$(".i_bg").append(
							"<div class='content mar_20'>"
								+"<img src='images/img3.jpg' />"        
							+"</div>"	
						
						+"<div class='warning'>"
				        	+"<table border='0' style='width:1000px; text-align:center;' cellspacing='0' cellpadding='0'>"
					           +" <tr height='35'>"
					                +"<td style='font-size:18px;'>"
					                    +"感谢您在本店购物！您的订单已提交成功，请记住您的订单号: <font color='#ff4e00'>"+order.serialNumber+"</font>"
					                +"</td>"
					            +"</tr>"
					            +"<tr>"
					                +"<td style='font-size:14px; font-family:\'宋体\'; padding:10px 0 20px 0; border-bottom:1px solid #b6b6b6;'>"
					                   +" 您选定的配送方式为: <font color='#ff4e00'>申通快递</font>； &nbsp; &nbsp;您选定的支付方式为: <font"
					                       +" color='#ff4e00'>支付宝</font>； &nbsp; &nbsp;您的应付款金额为: <font color='#ff4e00'>￥"+order.cost+"</font>"
					                +"</td>"
					            +"</tr>"
					            +"<tr>"
					                +"<td style='padding:20px 0 30px 0; font-family:\'宋体\';>"
					                  +"收款人信息：全称 '"+order.loginName+"'；地址 '"+order.userAddress+"' ； <br/>"
					                +"</td>"
					           +"</tr>"
					            +"<tr>"
					                +"<td>"
					                    +"<a href='${ctx}/Home?action=index' onclick='return shouYe()'>首页</a> &nbsp; &nbsp; <a href='${ctx}/Home?action=index'>用户中心</a>"
					                +"</td>"
					            +"</tr>"
					        +"</table>"
				    +"</div>");
						daoSan()
					})
			}
		})
	
	}
		//BuyCar_Two.jsp 购物车第二页初始化
		function BuyCar_Two_init(){
			alert("BuyCar_Two_init");
			$(".car_tab").parent().empty()
			//换个图片
			$(".content>img").attr("src","images/img2.jpg");
			//$(".content>img").parent().next().append("<div> calss</div>")
			//在 .car_tab之后加入节点
			 $(".content>img").parent().next().append(
			// <!--Begin 第二步：确认订单信息 Begin -->
				        "<div class='two_t'>"
				            +"<span class='fr'><a href='javascript:void(0);' onclick='gouwuche();'>修改</a></span>商品列表"
				        +"</div>"
				        +"<table border='0' class='car_tab' style='width:1110px;' cellspacing='0' cellpadding='0'>"
				            +"<tr>"
				                +"<td class='car_th' width='550'>商品名称</td>"
				                +"<td class='car_th' width='150'>购买数量</td>"
				                +"<td class='car_th' width='130'>小计</td>"
				            +"</tr>"
				       +"</table>"

				        +"<div class='two_t'>"
				            +"<span class='fr'></span>收货人信息"
				        +"</div>"
				        +"<table border='0' class='peo_tab' style='width:1110px;' cellspacing='0' cellpadding='0'>"
				            +"<tr>"
				                +"<td class='p_td' width='160'>用户名称</td>"
				                +"<td width='395'>'${user.userName}'</td>"
				                +"<td class='p_td'>登录名称</td>"
				                +"<td>${user.loginName}</td>"
				            +"</tr>"
				            +"<tr>"
				                +"<td class='p_td'>手机</td>"
				                +"<td>${user.mobile}</td>"
				                +"<td class='p_td' width='160'>电子邮件</td>"
				                +"<td width='395'>${user.email}</td>"
				            +"</tr>"
				        +"</table>"
				        +"<div class='two_t'>"
				            +"<span class='fr'></span>选择地址"
				        +"</div>"
				        +"<table border='0' class='peo_tab' style='width:1110px;' cellspacing='0' cellpadding='0'>"
				           
				            +"<tr>"
		                   +" <td class='p_td' width='160'>"
		                                	+"朋友家"
		                         
		                        +"<input type='radio' name='selectAddress' value='朋友家'>"
		                    +"</td>"
		                    +"<td>北京市海淀大有庄"
		                    +"</td>"
		                +"</tr>"
				            +"<tr>"
		                   +" <td class='p_td' width='160'>"
		                                	+"女朋友家"
		                         
		                        +"<input type='radio' name='selectAddress' value='女朋友家'>"
		                    +"</td>"
		                    +"<td>北京市海淀大有庄"
		                    +"</td>"
		                +"</tr>"
				           +" <tr>"
				                +"<td class='p_td' width='160'>"
				                   +"新地址<input type='radio' name='selectAddress' value='-1'>"
				                +"</td>"
				                +"<td>"
				                	+"地址&nbsp;<input type='text' value='' name='address' class='add_ipt'>&nbsp;"
				                    	+"备注&nbsp;<input type='text' value='' name='remark' class='add_ipt'>"
				                +"</td>"
				            +"</tr>"
				        +"</table>"
				        +"<table border='0' style='width:900px; margin-top:20px;' cellspacing='0' cellpadding='0'>"
				            +"<tr height='70'>"
				                +"<td align='right'>"
				                    +"<b style='font-size:14px;'>应付款金额：<span"
				                           +" style='font-size:22px; color:#ff4e00;''><span>￥</span></span></b>"
				                +"</td>"
				            +"</tr>"
				            +"<tr height='70'>"
				                +"<td align='right'><a href='javascript:void(0);' onclick='BuyCar_Two_gouwuche();'><img"
				                        +" src='images/btn_sure.gif'/></a></td>"
				            +"</tr>"
				        +"</table>"
			);
				$(".cars>li").each(function(i,n){
					//拿到id  
					var id=$(this).attr("name");
					var filename=$(this).children(".img").children("a").children("img").attr("src");
					//alert("图片路径 "+filename);
					var proName=$(this).children(".name").children("a").html();
					//alert("name "+proName);
					var count =$(this).children(".price").children("span").html();
					//alert("count "+count);
					var price =$(this).children(".price").children("font").children("span").html();
					//alert("price "+price);
						$(".car_tab").append(
							"<tr class='i' name='"+id+"'>"
			                    +"<td>"
			                        +"<div class='c_s_img'>"
			                            +"<img src='"+filename+"' width='73' height='73'/>"
			                        +"</div>"+proName
			                           
			                    +"</td>"
			                    +"<td align='center'>"+count+"</td>"
			                    +"<td align='center' style='color:#ff4e00;'>￥<span>"+price+"</span></td>"
			                +"</tr>"
						
						
						);
				 
				})
				var zong=$(".price_sum>span").html();
				//alert(zong);  
				$(".peo_tab").next().children("tbody").children("tr").children("td").children("b").children("span").html(zong);
				
			
			
			
			return false;
		}




		//如何把一个列表存入服务器中
		function gouWuChe(){
			var s=$(".cars").html();
			//alert(s)
			var t=$(".car_t").html();
			//alert(t);
			$(".cars").empty().append(s);
			$(".car_t").empty().append(t);
			//alert(t);
			$.get({
				"url":"<%=path%>/ProductAction",
				//"org=gouwuche&cars="+s+"&ttt="+t,
				"data":{
					"org":"gouwuche",
					"cars": s,
					"cart":t,
					"playerName": encodeURIComponent($('#playerName').val())
				},
				"success":function(str){
					alert(str);
					window.location.href="Member_Order.jsp";
				}
			});
			return false;
		}


       var  rrrrr=0;//作为删除购物车商品的条件
       //修改购物车>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
       //修改购物车的价格
       var issisis="";
       function updateContent(){
    	  var gid= issisis.substring(1, 2);
    	  //作为购物车的class 使用
    	  gid=parseInt(gid);
    	 // alert("id:"+gid);
    	  var gegege=$(".car_tab .r"+gid+" .car_ipt").val();
    	 // alert("个数"+gegege);	
    	  $(".cars>.s"+gid+">.price>span").html(gegege);
    	  var  zong=0;
    	  $(".c_num input[class='car_ipt']").each(function(i,n){
    	  	  //拿到所有的价格了
    	  	   dan=$(this).parent().parent().next().children("span").html();
    	  	  gegege=parseInt($(this).val());
    	  	    zong=zong+(parseInt(dan)*gegege);
    	    });
    	  //展示购物车的总价
    	  $(".fr>b").html(zong);
    	  //小购物车中的总价
    	  $(".price_sum>span").html(zong);
       }
       
      /*   $(".c_num input[class='car_ipt']").each(function(i,n){
  	  //拿到所有的价格了
  	   dan=$(this).parent().parent().next().children("span").html();
  	  gegege=parseInt($(this).val());
  	    zong=zong+(parseInt(dan)*gegege);
    });
    alert("总价格： "+zong); 
    				购物车中总价格
					$(".fr>b").html(zong+(gegege*parseInt(gggprice)));
       
       //商品的价格
				var  gggprice=$(".car_tab .r"+n +" td>span").html();
				//购物车的总价
				var zong=$(".fr>b").html();
				//每个商品的单价
				var dan=0; */
       
       
		//修改购物车商品的数量
		function addshangPin(i,n){
			//alert(i);
				//查看购物车<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
				//商品的个数
				var gegege=$(".car_tab .r"+n +" .car_ipt").val();
				gegege=parseInt(gegege);
			if(i==1){
				if(gegege==1){
					alert("不能再减了");
					
				}else{
					gegege=gegege-1;
					    
				}
			}else if(i==2){
					gegege=gegege+1;
				
			}
				$(".car_tab .r"+n +" .car_ipt").val(gegege);
				issisis="r"+n;
				updateContent();
		}
       //选中输入框

		//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
     //删除购物车商品
 		function Ydelete(i){
 			if(i==1){
	 			//alert(rrrrr);
	 			//删除查看购物车中的商品..............................................
	 			var h=$(".car_tab .r"+rrrrr).html();
	 			//alert(h);
	 			//拿到 删除商品的个数
	 			var gegege=$(".car_tab .r"+rrrrr +" .car_ipt").val();
	 			//拿到删除商品的价格
	 			var  gggprice=$(".car_tab .r"+rrrrr +" td>span").html();
	 			
	 			var zong=$(".fr>b").html();
	 			$(".fr>b").html(zong-(parseInt(gegege)*parseInt(gggprice)));
	 			// zong=$(".fr>b").html();
	 			//alert(zong);
	 			//alert(gggprice+"  价格");
	 			$(".car_tab .r"+rrrrr).remove();
	 			//结束.........................................................
	 			
	 			//删除小图标购物车中的商品............................................
	 			//商品总个数
	 			var yyyyyyy=$(".car_t>span").html();
	 			//alert("购物车中商品个数"+yyyyyyy);
	 			$(".car_t span").html(parseInt(yyyyyyy)-1);
	 			//商品总价
	 			var sjjsjsjs=$(".price_sum span").html();
	 			//alert(sjjsjsjs);
	 			//删除商品的个数
	 			var dddprice=$(".price>span").html();
	 			//alert(dddprice);
	 			//删除商品的价格
	 			var dprice=$(".price>font>span").html();
	 			//alert("删除商品的价格"+dprice);
	 			$(".price_sum span").html(zong-(parseInt(gegege)*parseInt(gggprice)));
	 			//$(".price_sum span").html()
	 			$(".cars .s"+rrrrr).remove();
	 			
 			}
 			CloseDiv();
 			return false;
 		};
		//弹出删除框
 		function deleteProduct(i){
			
			//alert(i);
			document.getElementById("MyDiv").style.display='block';
			document.getElementById("fade").style.display='block' ;
			document.getElementById("fade").style.width = document.body.scrollWidth;
			$("#fade").height($(document).height());
			rrrrr=i;
		}
 		function CloseDiv()
 		{
 			document.getElementById("MyDiv").style.display='none';
 			document.getElementById("fade").style.display='none';
 		};



function  gouwuche(){
	alert("购物车");
	$("div[class='i_bg bg_color']").empty();
	$("div[class='i_bg bg_color']").append(
			"<div class='content mar_20'>"
				+"<img src='images/img1.jpg' />"        
			+"</div>"	
			+"<div class='content mar_20'>"
				+"<table border='0' class='car_tab' style='width:1200px; margin-bottom:50px;' cellspacing='0' cellpadding='0'>"
				  +"<tr>"
				    +"<td class='car_th' width='490'>商品名称</td>"
				    +"<td class='car_th' width='140'>属性</td>"
				    +"<td class='car_th' width='150'>购买数量</td>"
				    +"<td class='car_th' width='130'>小计</td>"
				    +"<td class='car_th' width='140'>返还积分</td>"
				    +"<td class='car_th' width='150'>操作</td>"
				  +"</tr>"
			 +"</table>"
			+"</div>"
			+"<div id='fade' class='black_overlay'></div>"
				+"<div id='MyDiv' class='white_content'>"            
			    	+"<div class='white_d'>"
			        	+"<div class='notice_t'>"											//'MyDiv','fade'
			            	+"<span class='fr' style='margin-top:10px; cursor:pointer;' onclick='CloseDiv()'><img src='images/close.gif' /></span>"
			        	+"</div>"
			        	+"<div class='notice_c'>"
				            +"<table border='0' align='center' style='font-size:16px;' cellspacing='0' cellpadding='0'>"
			             		 +"<tr valign='top'>"
					                +"<td>您确定要把该商品移除购物车吗？</td>"
					              +"</tr>"
					              +"<tr height='50' valign='bottom'>"
					                +"<td><a href='#' onclick='return Ydelete(1)'  class='b_sure'>确定</a><a href='#' class='b_buy' onclick='return Ydelete(2)'>取消</a></td>"
					              +"</tr>"
			            	+"</table>"
			                
			            +"</div>"
			    +"</div>"
		 +"</div>");
       //商品总价格
      var zong=$(".price_sum>span").html();
	
	$("ul[class='cars']>li").each(function(i,n){
		//alert($(this).html())
		//商品定位 class
		//alert("li class id"+$(this).attr("class").substring(1,2));
		var ii=$(this).attr("class").substring(1,2);
		
        //购物车中 商品名字
       var name=$(this).children(".name").children("a").html();
        //购物车中 商品价格
      var price=$(this).children(".price").children("font").children("span").html();
        
       //购物车中 商品个数
      var count=$(this).children(".price").children("span").html();
       //购物车中的图片
       var img=$(this).children(".img").children("a").children("img").attr("src");
       //alert(img)
		//alert(name);
		//alert(price);
		if(count==undefined){
			count=1;
		}
		//alert($(".car_tab").html());
		$(".car_tab").append(
			"<tr class='r"+ii+"'>"
			    +"<td>"
			    	+"<div class='c_s_img'><img src='"+img+"' width='73' height='73' /></div>"
			       +name
			    +"</td>"
			    +"<td align='center'>颜色：灰色</td>"
			    +"<td align='center'>"
			    	+"<div class='c_num'>"
			            +"<input type='button' value='' onclick='addshangPin(1,"+ii+");' class='car_btn_1' />"
			        	+"<input type='text' value='"+count+"' name='' class='car_ipt' />"  
			            +"<input type='button' value='' onclick='addshangPin(2,"+ii+");' class='car_btn_2' />"
			        +"</div>"
			    +"</td>"
			    +"<td align='center' style='color:#ff4e00;'>￥<span>"+price+"</span></td>"
			    +"<td align='center'>26R</td>"    //'MyDiv','fade'
			    +"<td align='center'><a onclick='deleteProduct("+ii+")'>删除</a>&nbsp; &nbsp;<a href='#'>加入收藏</a></td>"
			 +"</tr>");
		//alert(count);
		//alert(zong);
	});
	$(".car_tab").append(
	 "<tr height='70'>"
	  	+"<td colspan='6' style='font-family:\'Microsoft YaHei\'; border-bottom:0;'>"
	    	+"<label class='r_rad'><input type='checkbox' name='clear' checked='checked' /></label><label class='r_txt'>清空购物车</label>"
	        +"<span class='fr'>商品总价：<b style='font-size:22px; color:#ff4e00;'>"+zong+"</b></span>"
	    +"</td>"
	  +"</tr>"
	  +"<tr valign='top' height='150'>"
	  	+"<td colspan='6' align='right'>"
	    	+"<a href='#'><img src='images/buy1.gif' /></a>&nbsp; &nbsp; <a href='BuyCar_Two.jsp'  onclick='return BuyCar_Two_init()'><img src='images/buy2.gif' /></a>"
	   +"</td>"
	  +"</tr>");
	daoSan();
	//为购物车数量的input绑定 click事件 
	/* $(".c_num input[class='car_ipt']").click(function(){
		dan=$(this).parent().parent().next().children("span").html();
		issisis=$(this).parent().parent().parent().attr("class");
		updateContent();
		alert($(this).val());
	}) */
	$(".c_num input[class='car_ipt']").bind("change",function (){
		dan=$(this).parent().parent().next().children("span").html();
		issisis=$(this).parent().parent().parent().attr("class");
		updateContent();
 	   //alert($(this).val());
    })
   /*  var issisis=0;
       function updateContent(){ */
	return false;
}
/* 


<!--Begin 弹出层-删除商品 Begin-->
 */
		//商品个数的添加和减少
		function addUpdate(){
			var i=$(".n_ipt").val();
			var x=parseInt(i);
			$(".n_ipt").val(x+1);
		}
		function jianUpdate(){
			var i=$(".n_ipt").val();
			var x=parseInt(i);
			if(x==1){
				alert("不能再减了")
			$(".n_ipt").val(1);
			}else{
			$(".n_ipt").val(x-1);
			}
				
		}
		
		//三级列表的显示和隐藏
        function lie(){
        	$("div[class='leftNav']").hide();
        	$("div[class='nav']").mouseover(function(){
        	$("div[class='leftNav']").show();
        		}).mouseout(function(){
        	$("div[class='leftNav']").hide();
        		});
        }
        lie();
       var sssssbb=2;
        //加入购物车
        function ShowDiv_ss(id){
        	//alert(id);
        	$.get({
        		"url":"<%=path%>/ProductAction",
				"data":"org=selectProductId&id="+id,
        		"success":function(data){
        			/* alert(data); */
        			var datas=$.parseJSON(data);
        			var s=$(".n_ipt").val();
        			var b=1;
        			if(parseInt(s)>1){
        				b=parseInt(s);
        			}
        			var pan=1;
        			$("ul[class='cars']>li").each(function(){
        				if($(this).attr("name")==id){
        					//alert("匹配陈宫");
        					var gggg=$(this).children(".price").children("span").html();
        					$(this).children(".price").children("span").html(parseInt(gggg)+b);
        					pan=2;
        				}
        			})
        			/* alert(s+"sss");
        			alert("b   "  +b); */
        			//alert(pan);
        			if(pan==1){
        				sssssbb=sssssbb+1;
	        			$("ul[class='cars']").append(
	        				"<li class='s"+(sssssbb)+"' name='"+id+"'>"
	        					+"<div class='img'>"
	        						+"<a href='#'><img src='"+datas.product.fileName+"' width='58' height='58' /></a>"
	        					+"</div>"
	        					+"<div class='name'>"
	        						+"<a href='#'>"+datas.product.name+"</a>"
	        					+"</div>"
	        					+"<div class='price'>"
	        						+"<font color='#ff4e00'>￥<span>"+((datas.product.price))+"</span></font> X<span>"+b+"</span>"
	        					+"</div>"
	        				+"</li>"	
	        			);
        			}
        			var zong=$(".price_sum>span").html();
        			if(zong==""){
        				zong=0;
        			}
        			/* alert(zong); */
        			$(".price_sum>span").html(parseInt(zong)+((datas.product.price)*b));
        			//拿到商品个数
        			var ge=$(".car_t>span").html();
        			if(ge==""){
        				ge=0;
        			}else {
        				ge=parseInt(ge);
        			}
        			//alert(ge+1);
        			//当pan等于二 时，不进行加1
        			if(pan==2){
        				
        			$(".car_t>span").html(ge);
        			}else{
        				
        			$(".car_t>span").html(ge+1);
        			}
        			alert("加入成功")
        		}
        	});
        	/* <ul class="cars">
			 */
        	return false;
        }
		function shouYe() {
			//alert("主页")
			init();
			return false;
		}
		function onclickProduct(id) {
			alert(id);
			$.get({
				"url":"<%=path%>/ProductAction",
				"data":"org=selectProductId&id="+id,
				"success":function(data){
					$("div[class='i_bg bg_color']").empty();
					var datas=$.parseJSON(data);
					
					$("div[class='i_bg bg_color']").append(
				 "<div class='postion'>"
			    	+"<span class='fl'>全部 > "+datas.names.name1+"> "+datas.names.name2+" > "+datas.names.name3+" > "+datas.product.name+"</span>"
			    +"</div>"    
			     +"<div class='content'>"
			        +"<div id='tsShopContainer'>"
			            +"<div id='tsImgS'><a href='images/p_big.jpg' title='Images' class='MagicZoom' id='MagicZoom'><img src='"+datas.product.fileName+"' width='390' height='390' /></a></div>"
			            +"<div id='tsPicContainer'>"
			                +"<div id='tsImgSArrL' onclick='tsScrollArrLeft()'></div>"
			                +"<div id='tsImgSCon'>"
			                    +"<ul>"
			                        +"<li onclick='showPic(0)' rel='MagicZoom' class='tsSelectImg'><img src='images/ps1.jpg' tsImgS='images/ps1.jpg' width='79' height='79' /></li>"
			                        +"<li onclick='showPic(1)' rel='MagicZoom' class='tsSelectImg'><img src='images/ps2.jpg' tsImgS='images/ps1.jpg' width='79' height='79' /></li>"
			                        +"<li onclick='showPic(2)' rel='MagicZoom' class='tsSelectImg'><img src='images/ps3.jpg' tsImgS='images/ps1.jpg' width='79' height='79' /></li>"
			                        +"<li onclick='showPic(3)' rel='MagicZoom' class='tsSelectImg'><img src='images/ps4.jpg' tsImgS='images/ps1.jpg' width='79' height='79' /></li>"
			                        +"<li onclick='showPic(4)' rel='MagicZoom' class='tsSelectImg'><img src='images/ps1.jpg' tsImgS='images/ps1.jpg' width='79' height='79' /></li>"
			                        +"<li onclick='showPic(5)' rel='MagicZoom' class='tsSelectImg'><img src='images/ps2.jpg' tsImgS='images/ps1.jpg' width='79' height='79' /></li>"
			                        +"<li onclick='showPic(6)' rel='MagicZoom' class='tsSelectImg'><img src='images/ps3.jpg' tsImgS='images/ps1.jpg' width='79' height='79' /></li>"
			                        +"<li onclick='showPic(7)' rel='MagicZoom' class='tsSelectImg'><img src='images/ps4.jpg' tsImgS='images/ps1.jpg' width='79' height='79' /></li>"
			                  
			                    +"</ul>"
			                +"</div>"
			                +"<div id='tsImgSArrR' onclick='tsScrollArrRight()'></div>"
			            +"</div>"
			            +"<img class='MagicZoomLoading' width='16' height='16' src='images/loading.gif' alt='Loading...' />"				
			        +"</div>"
			        
			        +"<div class='pro_des'>"
			        	+"<div class='des_name'>"
			            	+"<p>"+datas.product.name+"</p>"
			                +"“开业巨惠，北京专柜直供”，不光低价，“真”才靠谱！"
			            +"</div>"
			            +"<div class='des_price'>"
			            	+"本店价格：<b>￥"+datas.product.price+"</b><br />"
			              	+" 消费积分：<span>28R</span>"
			            +"</div>"
			            +"<div class='des_choice'>"
			            	+"<span class='fl'>型号选择：</span>"
			                +"<ul>"
			                	+"<li class='checked'>30ml<div class='ch_img'></div></li>"
			                    +"<li>50ml<div class='ch_img'></div></li>"
			                    +"<li>100ml<div class='ch_img'></div></li>"
			                +"</ul>"
			           +" </div>"
			            +"<div class='des_choice'>"
			            	+"<span class='fl'>颜色选择：</span>"
			                +"<ul>"
			                	+"<li>红色<div class='ch_img'></div></li>"
			                    +"<li class='checked'>白色<div class='ch_img'></div></li>"
			                    +"<li>黑色<div class='ch_img'></div></li>"
			                +"</ul>"
			            +"</div>"
			            +"<div class='des_share'>"
			            	+"<div class='d_sh'>"
			                	+"分享"
			                    +"<div class='d_sh_bg'>"
			                    	+"<a href='#'><img src='images/sh_1.gif' /></a>"
			                    	+"<a href='#'><img src='images/sh_2.gif' /></a>"
			                    	+"<a href='#'><img src='images/sh_3.gif' /></a>"
			                    	+"<a href='#'><img src='images/sh_4.gif' /></a>"
			                    	+"<a href='#'><img src='images/sh_5.gif' /></a>"
			                       
			                    +"</div>"
			                 +"</div>"                        //'MyDiv','fade'
			                +"<div class='d_care'><a onclick='ShowDiv()'>关注商品</a></div>"
			            +"</div>"
			            +"<div class='des_join'>"
			            	+"<div class='j_nums'>"
			                	+"<input type='text' value='1' name='' class='n_ipt' />"
			                    +"<input type='button' value='' onclick='addUpdate();' class='n_btn_1' />"
			                    +"<input type='button' value='' onclick='jianUpdate();' class='n_btn_2' />"   
			                +"</div>"								//'MyDiv1','fade1'
			                +"<span class='fl'><a onclick='ShowDiv_ss("+datas.product.id+")'><img src='images/j_car.png' /></a></span>"
			            +"</div>"            
			       +" </div>"    
			        
			       +" <div class='s_brand'>"
			        	+"<div class='s_brand_img'><img src='images/sbrand.jpg' width='188' height='132' /></div>"
			            +"<div class='s_brand_c'><a href='#'>进入品牌专区</a></div>"
			        +"</div>"    
			    +"</div>" );
					daoSan();
					
				}
				
			});
			return false;
		}
		//添加到购物车中
		function onclickProductCategory(id) {
			//alert(id);
			$.get({
				"url":"<%=path%>/ProductAction",
				"data":"org=selectProduct&id="+id,
				"success":function(data){
						//alert(data);
					if(data!="1"){
						var datas=$.parseJSON(data);
						$("div[class='i_bg bg_color']").empty();
						
						$("div[class='i_bg bg_color']").append(
								
						"<div class='l_list'>"
							+"<div class='list_c'>"
								+"<ul class='cate_list'>"
								+"</ul>"
				            +"</div>"
				           +"</div>");
						$(datas).each(function (i,n) {
							
							$("ul[class='cate_list']").append(
								"<li>"
			                    	+"<div class='img'><a href='#' onclick='return onclickProduct("+this.id+")'><img src='"+this.fileName+"' width='210' height='185' /></a></div>"
			                        +"<div class='price'>"
			                            +"<font>￥<span>"+this.price+"</span></font> &nbsp; 26R"
			                        +"</div>"
			                        +"<div class='name'><a href='#'>"+this.name+"</a></div>"
			                        +"<div class='carbg'>"
			                        	+"<a href='#' class='ss'>收藏</a>"
			                            +"<a href='#' onclick='return ShowDiv_ss("+this.id+")' class='j_car'>加入购物车</a>"
			                        +"</div>"
			                    +"</li>");
						})
							
						
					
						daoSan();
					}else{
						alert("该列表下没有商品");
					}
					
				}
			});
			return false;
		}
		//倒数三行
		function daoSan() {
			//到三行   正品保障  
			$("div[class='i_bg bg_color']").append("<div class='b_btm_bg b_btm_c'>"
				+"<div class='b_btm'>"
					+"<table border='0'style='width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;' cellspacing='0' cellpadding='0'>"
						+"<tr>"
							+"<td width='72'><img src='images/b1.png' width='62'  height='62' /></td>"
							+"<td><h2>正品保障</h2>正品行货 放心购买</td>"
						+"</tr>"
					+"</table>"
					+"<table border='0'style='width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;' cellspacing='0' cellpadding='0'>"
						+"<tr>"
							+"<td width='72'><img src='images/b2.png' width='62'  height='62' /></td>"
							+"<td><h2>满38包邮</h2>满38包邮 免运费</td>"
						+"</tr>"
					+"</table>"
					+"<table border='0'style='width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;' cellspacing='0' cellpadding='0'>"
						+"<tr>"
							+"<td width='72'><img src='images/b3.png' width='62'  height='62' /></td>"
							+"<td><h2>天天低价</h2>天天低价 畅选无忧</td>"
						+"</tr>"
					+"</table>"
					+"<table border='0'style='width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;' cellspacing='0' cellpadding='0'>"
						+"<tr>"
							+"<td width='72'><img src='images/b4.png' width='62'  height='62' /></td>"
							+"<td><h2>准时送达</h2>收货时间由你做主</td>"
						+"</tr>"
					+"</table>"
					
					
					
				+"</div>"
			+"</div>"
			+"</div>"
			//二维码
			+"<div class='b_nav'>"
				+"<dl>"
					+"<dt>"
						+"<a href='#'>新手上路</a>"
					+"</dt>"
					+"<dd>"
						+"<a href='#'>售后流程</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>购物流程</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>订购方式</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>隐私声明</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>推荐分享说明</a>"
					+"</dd>"
				+"</dl>"
				+"<dl>"
					+"<dt>"
						+"<a href='#'>配送与支付</a>"
					+"</dt>"
					+"<dd>"
						+"<a href='#'>货到付款区域</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>配送支付查询</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>支付方式说明</a>"
					+"</dd>"
				+"</dl>"
				+"<dl>"
					+"<dt>"
						+"<a href='#'>会员中心</a>"
					+"</dt>"
					+"<dd>"
						+"<a href='#'>资金管理</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>我的收藏</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>我的订单</a>"
					+"</dd>"
				+"</dl>"
				+"<dl>"
					+"<dt>"
						+"<a href='#'>服务保证</a>"
					+"</dt>"
					+"<dd>"
						+"<a href='#'>退换货原则</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>售后服务保证</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>产品质量保证</a>"
					+"</dd>"
				+"</dl>"
				+"<dl>"
					+"<dt>"
						+"<a href='#'>联系我们</a>"
					+"</dt>"
					+"<dd>"
						+"<a href='#'>网站故障报告</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>购物咨询</a>"
					+"</dd>"
					+"<dd>"
						+"<a href='#'>投诉与建议</a>"
					+"</dd>"
				+"</dl>"
				+"<div class='b_tel_bg'>"
					+"<a href='#' class='b_sh1'>新浪微博</a> <a href='#' class='b_sh2'>腾讯微博</a>"
					+"<p>服务热线：<br /> <span>400-123-4567</span></p>"
				+"</div>"
				+"<div class='b_er'>"
					+"<div class='b_er_c'>"
						+"<img src='images/er.gif' width='118' height='118' />"
					+"</div>"
					+"<img src='images/ss.png' />"
				+"</div>"
			+"</div>"
			//备案
			+"<div class='btmbg'>"
				+"<div class='btm'>"
					+"备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright © 2015-2018"
					+"尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />"
					+"<img src='images/b_1.gif' width='98' height='33' />"
					+"<img src='images/b_2.gif' width='98' height='33' />"
					+"<img src='images/b_3.gif' width='98' height='33' />"
					+"<img src='images/b_4.gif' width='98' height='33' />"
					+"<img src='images/b_5.gif' width='98' height='33' />"
					+"<img src='images/b_6.gif' width='98' height='33' />"
					
				+"</div>"
			+"</div>")	;
		}
		function init() {
		
                            	//三级列表
                          	//  $(function (){
                          		$.get({
                          			"url":"<%=path%>/indexAction",
                          			"data":"org=sanji",	
                          			"success":function(str){
                          				//alert(str);
                          				$("div[class='leftNav']>ul").empty();
                          				var data =$.parseJSON(str);
                          				//一级列表
                          				$(data).each(function(i,n){
                          					$("div[class='leftNav']>ul").append("<li class='"+i+"'><div class='fj'></div></li>");
                          					$("div[class='leftNav']>ul>."+i+">.fj").append("<span class='n_img'><span></span><img src='images/nav2.png' /></span> <span class='fl'>"+this.productCategory.name+"</span>");
                          					$("div[class='leftNav']>ul>."+i+"").append("<div class='zj' style='top:-40px;'></div>");
                          					$("div[class='leftNav']>ul>."+i+">.zj").append("<div class='zj_l'></div>");
                          					//alert(this.productCategory.name);
                          					//二级列表
                          					$(this.productCategoryVoList).each(function (){
                          						$("div[class='leftNav']>ul>."+i+">.zj>.zj_l").append("<div class='zj_l_c'><h2>"+this.productCategory.name+"</h2></div>");
                          						//$("div[class='leftNav none']>ul>."+i+">.zj>.zj_l>.zj_l_c").append("<h2>"+this.productCategory.name+"</h2>");
                          						//alert(this.productCategory.name);
                          						//三级列表
                          						$(this.productCategoryVoList).each(function (){
                          							$("div[class='leftNav']>ul>."+i+">.zj>.zj_l>.zj_l_c").append("<a href='#' onclick='return onclickProductCategory("+this.productCategory.id+")'>"+this.productCategory.name+"</a>|");
                          							//alert(this.productCategory.name);
                          						});
                          					});
                          					
                          						$("div[class='leftNav']>ul>."+i+">.zj").append("</div><div class='zj_r'><a href='#'><img src='images/n_img1.jpg' width='236' height='200' /></a> <a href='#'><img src='images/n_img2.jpg' width='236' height='200' /></a></div>")
                          				});
                          				
                          				//$("#leftNav").trigger("create");
                          				
                          				$("div[class='leftNav']>ul li").hover(
                          						function(){
                          							$(this).find(".fj").addClass("nuw");
                          							
                          							$(this).find(".zj").show();
                          							//alert("2114");
                          						}
                          						,
                          						function(){
                          							$(this).find(".fj").removeClass("nuw");
                          							$(this).find(".zj").hide();
                          							//alert("2115")
                          						}
                          					) 

		                          	  	 lie();
                          			} 
                          		});
                          		//新闻资讯
                          	      $.get({
                          				"url":"<%=path%>/indexAction",
                          				"data":"org=news",	
                          				"success":function(str){
	                               		$(".inews ul").empty();
                          					//alert(str);
                          					  var data =$.parseJSON(str);
                          					$(data).each(function() {
                          				     $(".inews ul").append("<li><span>[ "+this.title+" ]</span><a href='#'>"+this.content+"</a></li>");
                          						
                          					})
                          				     
                          				}
                          			});
                                
                //主页商品查询、    mar_10
                $.get({
                    "url":"<%=path%>/ProductAction",
					"data" : "org=product",
					"success" : function(str) {
						//alert(str);

						$("div[class='i_bg bg_color']").empty();
						//添加轮播图	
						$("div[class='i_bg bg_color']")
								.append(
										"<div class='i_ban_bg'>"
												+ "<div class='banner'>"
												+ "<div class='top_slide_wrap'>"
												+ "<ul class='slide_box bxslider'>"
												+ "<li><img src='images/ban1.jpg' width='740' height='401' /></li>"
												+ "<li><img src='images/ban1.jpg' width='740' height='401' /></li>"
												+ "<li><img src='images/ban1.jpg' width='740' height='401' /></li>"
												+ "</ul>"
												+ "<div class='op_btns clearfix'>"
												+ "<a href='#' class='op_btn op_prev'><span></span></a> <a href='#' class='op_btn op_next'><span></span></a>"
												+ "</div>"
												+ "</div>"
												+ "</div>"
												+ "<div class='inews'>"
												+ "<div class='news_t'>"
												+ "<span class='fr'><a href='#'>更多 ></a></span>新闻资讯"
												+ "</div>"
												+ "<ul>"
												+ "<li><span>[ 特惠 ]</span><a href='#'>掬一轮明月 表无尽惦念</a></li>"
												+ "<li><span>[ 公告 ]</span><a href='#'>好奇金装成长裤新品上市</a></li>"
												+ "</ul>"
												+ "<div class='charge_t'>"
												+ "话费充值"
												+ "<div class='ch_t_icon'></div>"
												+ "</div>"
												+ "<form>"
												+ "<table border='0' style='width:205px; margin-top:10px;' cellspacing='0' cellpadding='0'>"
												+ "<tr height='35'>"
												+ "<td width='33'>号码</td>"
												+ "<td><input type='text' value='' class='c_ipt' /></td>"
												+ "</tr>"
												+ "<tr height='35'>"
												+ "<td>面值</td>"

												+ "<td><select class='jj' name='city'>"
												+ "<option value='0' selected='selected'>100元</option>"
												+ "<option value='1'>50元</option>"
												+ "<option value='2'>30元</option>"
												+ "<option value='3'>20元</option>"
												+ "<option value='4'>10元</option>"
												+ "</select> <span style='color:#ff4e00; font-size:14px;'>￥99.5</span></td>"
												+ "</tr>"
												+ "<tr height='35'>"
												+ "<td colspan='2'><input type='submit' value='立即充值' class='c_btn' /></td>"
												+ "</tr"

												+ "</table>" + "</form>"
												+ "</div>" + "</div>");
						//$("#igssss").trigger("create");
						//alert("igssss")

						//加入商品展示
						var data = $.parseJSON(str);
						$(data)
								.each(
										function(i, n) {
											//加入第一行 i_t  拿到三级id的商品分表的对象
											$("div[class='i_bg bg_color']")
													.append(
															"<div class='i_t mar_10 d1"+i+"'>"
																	+ "<span class='floor_num'>"
																	+ (i + 1)
																	+ "F</span> <span class='fl'>"
																	+ this.pro.name
																	+ "</span>"
																	+ "</div>");
											//加入content  拿到
											$("div[class='i_bg bg_color']")
													.append(
															"<div class='content d2"+i+"'>"
																	+ "<div class='food_left'>"
																	+ "<div class='food_ban'>"
																	+ "<div id='imgPlay2'>"
																	+ "<ul class='imgs' id='actor2'>"
																	+ "<li><a href='#'><img src='images/food_r.jpg' width='211' height='286' /></a></li>"
																	+ "<li><a href='#'><img src='images/food_r.jpg' width='211' height='286' /></a></li>"
																	+ "<li><a href='#'><img src='images/food_r.jpg' width='211' height='286' /></a></li>"
																	+ "</ul>"
																	+ "<div class='prev_f'>上一张</div>"
																	+ "<div class='next_f'>下一张</div>"
																	+ "</div>"
																	+ "</div>"
																	+ "<div class='fresh_txt'>"
																	+ "<div class='fresh_txt_c'>"
																	+ "</div>"
																	+ "</div>"
																	+ "</div>"
																	+ "<div class='fresh_mid'>"
																	+ "<ul>"
																	+ "</ul>"
																	+ "</div>"
																	+ "<div class='fresh_right'>"
																	+ "<ul>"
																	+ "<li><a href='#' ><img src='images/food_b1.jpg' width='260' height='220' /></a></li>"
																	+ "<li><a href='#'><img src='images/food_b1.jpg' width='260' height='220' /></a></li>"
																	+ "</ul>"
																	+ "</div>"
																	+ "</div>"

													);
											//拿到商品 对象
											//alert(this.pro.name);
											$(this.productList)
													.each(
															function() {
																//alert(this.fileName);
																$(
																		"div[class='i_bg bg_color'] .d1"
																				+ i
																				+ "")
																		.append(
																				" <span class='i_mores fr'><a href='#'>"
																						+ this.name
																						+ "</a>&nbsp; &nbsp; |");

																$(
																		"div[class='content d2"
																				+ i
																				+ "'] .fresh_txt_c")
																		.append(
																				"<a href='#'>"
																						+ this.name
																						+ "</a>");

																$(
																		"div[class='content d2"
																				+ i
																				+ "'] .fresh_mid>ul")
																		.append(
																				"<li >"
																						+ "<div class='name'>"
																						+ "<a href='#'>"
																						+ this.name
																						+ "</a>"
																						+ "</div>"
																						+ "<div class='price'>"
																						+ "<font>￥<span>"
																						+ this.price
																						+ "</span></font> &nbsp; 25R"
																						+ "</div>"
																						+ "<div class='img'>"
																						+ "<a href='#' onclick='return onclickProduct("
																						+ this.id
																						+ ")'><img src='"+this.fileName+"' width='185' height='155' /></a>"
																						+ "</div>"
																						+ "</li>");

															})
										})

						daoSan();

					}
				});
		// });
	}
	init();
</script>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<title>易买网首页</title>
</head>
<body>
	<!--Begin Header Begin-->
	<div class="soubg">
		<div class="sou">
			<!--Begin 所在收货地区 Begin-->
			<span class="s_city_b"> <span class="fl">送货至：</span> <span
				class="s_city"> <span>四川</span>
					<div class="s_city_bg">
						<div class="s_city_t"></div>
						<div class="s_city_c">
							<h2>请选择所在的收货地区</h2>
							<table border="0" class="c_tab"
								style="width:235px; margin-top:10px;" cellspacing="0"
								cellpadding="0">
								<tr>
									<th>A</th>
									<td class="c_h"><span>安徽</span><span>澳门</span></td>
								</tr>
								<tr>
									<th>B</th>
									<td class="c_h"><span>北京</span></td>
								</tr>
								<tr>
									<th>C</th>
									<td class="c_h"><span>重庆</span></td>
								</tr>
								<tr>
									<th>F</th>
									<td class="c_h"><span>福建</span></td>
								</tr>
								<tr>
									<th>G</th>
									<td class="c_h"><span>广东</span><span>广西</span><span>贵州</span><span>甘肃</span></td>
								</tr>
								<tr>
									<th>H</th>
									<td class="c_h"><span>河北</span><span>河南</span><span>黑龙江</span><span>海南</span><span>湖北</span><span>湖南</span></td>
								</tr>
								<tr>
									<th>J</th>
									<td class="c_h"><span>江苏</span><span>吉林</span><span>江西</span></td>
								</tr>
								<tr>
									<th>L</th>
									<td class="c_h"><span>辽宁</span></td>
								</tr>
								<tr>
									<th>N</th>
									<td class="c_h"><span>内蒙古</span><span>宁夏</span></td>
								</tr>
								<tr>
									<th>Q</th>
									<td class="c_h"><span>青海</span></td>
								</tr>
								<tr>
									<th>S</th>
									<td class="c_h"><span>上海</span><span>山东</span><span>山西</span><span
										class="c_check">四川</span><span>陕西</span></td>
								</tr>
								<tr>
									<th>T</th>
									<td class="c_h"><span>台湾</span><span>天津</span></td>
								</tr>
								<tr>
									<th>X</th>
									<td class="c_h"><span>西藏</span><span>香港</span><span>新疆</span></td>
								</tr>
								<tr>
									<th>Y</th>
									<td class="c_h"><span>云南</span></td>
								</tr>
								<tr>
									<th>Z</th>
									<td class="c_h"><span>浙江</span></td>
								</tr>
							</table>
						</div>
					</div>
			</span>
			</span>
			<!--End 所在收货地区 End-->
			<span class="fr"> <c:if test="${!empty user.loginName}">
					<span class="fl"> 你好，${user.loginName}
					<c:if test="${user.type==2}">
					<a href="<%=path%>/ProductAction?org=productlist" >管理中心</a>&nbsp;|
					</c:if>
					 <a href="#" onclick="return gouWuChe()">我的订单</a>&nbsp;|
						<a href="<%=path%>/indexAction?org=zhuxiao">注销</a>&nbsp;|
					</span>
				</c:if> <c:if test="${empty user.loginName}">
					<span class="fl">你好，请<a href="login.jsp">登录</a>&nbsp; <a
						href="regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp;|&nbsp;<a
						href="#" onclick="return gouWuChe()">我的订单</a>&nbsp;|
					</span>
				</c:if> <span class="ss">
					<div class="ss_list">
						<a href="#">收藏夹</a>
						<div class="ss_list_bg">
							<div class="s_city_t"></div>
							<div class="ss_list_c">
								<ul>
									<li><a href="#">我的收藏夹</a></li>
									<li><a href="#">我的收藏夹</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="ss_list">
						<a href="#">客户服务</a>
						<div class="ss_list_bg">
							<div class="s_city_t"></div>
							<div class="ss_list_c">
								<ul>
									<li><a href="#">客户服务</a></li>
									<li><a href="#">客户服务</a></li>
									<li><a href="#">客户服务</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="ss_list">
						<a href="#">网站导航</a>
						<div class="ss_list_bg">
							<div class="s_city_t"></div>
							<div class="ss_list_c">
								<ul>
									<li><a href="#">网站导航</a></li>
									<li><a href="#">网站导航</a></li>
								</ul>
							</div>
						</div>
					</div>
			</span> <span class="fl">|&nbsp;关注我们：</span> <span class="s_sh"><a
					href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span> <span
				class="fr">|&nbsp;<a href="#">手机版&nbsp;<img
						src="images/s_tel.png" align="absmiddle" /></a></span>
			</span>
		</div>
	</div>
	<div class="top">
		<div class="logo">
			<a href="Index.html" onclick="return shouYe()"><img src="images/logo.png" /></a>
		</div>
		<div class="search">
			<form>
				<input type="text" value="" class="s_ipt" /> <input type="submit"
					value="搜索" class="s_btn" />
			</form>
			<span class="fl"><a href="#">咖啡</a><a href="#">iphone 6S</a><a
				href="#">新鲜美食</a><a href="#">蛋糕</a><a href="#">日用品</a><a href="#">连衣裙</a></span>
		</div>
		<div class="i_car">
			<div class="car_t">
				购物车 [ <span>3</span> ]
			</div>
			<div class="car_bg">
				<!--Begin 购物车未登录 Begin-->
				<div class="un_login">
					还未登录！<a href="Login.html" style="color:#ff4e00;">马上登录</a> 查看购物车！
				</div>
				<!--End 购物车未登录 End-->
				<!--Begin 购物车已登录 Begin-->
				<ul class="cars">
					<li class="s0" name="24">
						<div class="img">
							<a href="#"><img src="images/car1.jpg" width="58" height="58" /></a>
						</div>
						<div class="name">
							<a href="#">法颂浪漫梦境50ML 香水女士持久清新淡香 送2ML小样3只</a>
						</div>
						<div class="price">
							<font color="#ff4e00">￥<span>399</span></font> X<span>1</span>
						</div>
					</li>
					<li class="s1" name="25">
						<div class="img">
							<a href="#"><img src="images/car2.jpg" width="58" height="58" /></a>
						</div>
						<div class="name">
							<a href="#">香奈儿（Chanel）邂逅活力淡香水50ml</a>
						</div>
						<div class="price">
							<font color="#ff4e00">￥<span>399</span></font> X<span>1</span>
						</div>
					</li>
					<li class="s2" name="26">
						<div class="img">
							<a href="#"><img src="images/car2.jpg" width="58" height="58" /></a>
						</div>
						<div class="name">
							<a href="#">香奈儿（Chanel）邂逅活力淡香水50ml</a>
						</div>
						<div class="price">
							<font color="#ff4e00">￥<span>399</span></font> X<span>1</span>
						</div>
					</li>
				</ul>
				<div class="price_sum">
					共计&nbsp; <font color="#ff4e00">￥</font><span>1197</span>
				</div>
				<div class="price_a">
					<a href="#" onclick='return gouwuche()'>去购物车结算</a>
				</div>
				<!--End 购物车已登录 End-->
			</div>
		</div>
	</div>
	<!--End Header End-->
	<!--Begin Menu Begin-->
	<div class="menu_bg">
		<div class="menu">
			<!--Begin 商品分类详情 Begin-->
			<div class="nav">
				<div class="nav_t">全部商品分类</div>
				<div class="leftNav">
					<ul>
						<li>
							<div class="fj">
								<span class="n_img"><span></span><img
									src="images/nav1.png" /></span> <span class="fl">进口食品、生鲜</span>
							</div>
							<div class="zj">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
								</div>
								<div class="zj_r">
									<a href="#"><img src="images/n_img1.jpg" width="236"
										height="200" /></a> <a href="#"><img src="images/n_img2.jpg"
										width="236" height="200" /></a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img"><span></span><img
									src="images/nav2.png" /></span> <span class="fl">食品、饮料、酒</span>
							</div>
							<div class="zj" style="top:-40px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力2</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
								</div>
								<div class="zj_r">
									<a href="#"><img src="images/n_img1.jpg" width="236"
										height="200" /></a> <a href="#"><img src="images/n_img2.jpg"
										width="236" height="200" /></a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img"><span></span><img
									src="images/nav3.png" /></span> <span class="fl">母婴、玩具、童装</span>
							</div>
							<div class="zj" style="top:-80px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力3</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
								</div>
								<div class="zj_r">
									<a href="#"><img src="images/n_img1.jpg" width="236"
										height="200" /></a> <a href="#"><img src="images/n_img2.jpg"
										width="236" height="200" /></a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img"><span></span><img
									src="images/nav4.png" /></span> <span class="fl">家居、家庭清洁、纸品</span>
							</div>
							<div class="zj" style="top:-120px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力4</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
								</div>
								<div class="zj_r">
									<a href="#"><img src="images/n_img1.jpg" width="236"
										height="200" /></a> <a href="#"><img src="images/n_img2.jpg"
										width="236" height="200" /></a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img"><span></span><img
									src="images/nav5.png" /></span> <span class="fl">美妆、个人护理、洗护</span>
							</div>
							<div class="zj" style="top:-160px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力5</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
								</div>
								<div class="zj_r">
									<a href="#"><img src="images/n_img1.jpg" width="236"
										height="200" /></a> <a href="#"><img src="images/n_img2.jpg"
										width="236" height="200" /></a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img"><span></span><img
									src="images/nav6.png" /></span> <span class="fl">女装、内衣、中老年</span>
							</div>
							<div class="zj" style="top:-200px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力6</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
								</div>
								<div class="zj_r">
									<a href="#"><img src="images/n_img1.jpg" width="236"
										height="200" /></a> <a href="#"><img src="images/n_img2.jpg"
										width="236" height="200" /></a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img"><span></span><img
									src="images/nav7.png" /></span> <span class="fl">鞋靴、箱包、腕表配饰</span>
							</div>
							<div class="zj" style="top:-240px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力7</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
								</div>
								<div class="zj_r">
									<a href="#"><img src="images/n_img1.jpg" width="236"
										height="200" /></a> <a href="#"><img src="images/n_img2.jpg"
										width="236" height="200" /></a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img"><span></span><img
									src="images/nav8.png" /></span> <span class="fl">男装、运动</span>
							</div>
							<div class="zj" style="top:-280px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力8</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
								</div>
								<div class="zj_r">
									<a href="#"><img src="images/n_img1.jpg" width="236"
										height="200" /></a> <a href="#"><img src="images/n_img2.jpg"
										width="236" height="200" /></a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img"><span></span><img
									src="images/nav9.png" /></span> <span class="fl">手机、小家电、电脑</span>
							</div>
							<div class="zj" style="top:-320px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力9</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
								</div>
								<div class="zj_r">
									<a href="#"><img src="images/n_img1.jpg" width="236"
										height="200" /></a> <a href="#"><img src="images/n_img2.jpg"
										width="236" height="200" /></a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img"><span></span><img
									src="images/nav10.png" /></span> <span class="fl">礼品、充值</span>
							</div>
							<div class="zj" style="top:-360px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力10</h2>
										<a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">巧克力</a>| <a href="#">口香糖</a>|<a
											href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a
											href="#">红枣</a>| <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a
											href="#">牛肉干</a>|<a href="#">蜜饯</a>|
									</div>
								</div>
								<div class="zj_r">
									<a href="#"><img src="images/n_img1.jpg" width="236"
										height="200" /></a> <a href="#"><img src="images/n_img2.jpg"
										width="236" height="200" /></a>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!--End 商品分类详情 End-->
			<ul class="menu_r">
				<li><a href="#" onclick='return shouYe()'>首页</a></li>
				<li><a href="Food.html"
					onclick='return onclickProductCategory(15)'>美食</a></li>
				<li><a href="Fresh.html">生鲜</a></li>
				<li><a href="HomeDecoration.html"
					onclick='return onclickProductCategory(21)'>家居</a></li>
				<li><a href="SuitDress.html">女装</a></li>
				<li><a href="MakeUp.html"
					onclick='return onclickProductCategory(22)'>美妆</a></li>
				<li><a href="Digital.html">数码</a></li>
				<li><a href="GroupBuying.html">团购</a></li>
			</ul>
			<div class="m_ad">中秋送好礼！</div>
		</div>
	</div>
	<!--End Menu End-->
	<div class="i_bg bg_color" id="igssss">
		<div class="i_ban_bg">
			<!--Begin Banner Begin-->
			<div class="banner">
				<div class="top_slide_wrap">
					<ul class="slide_box bxslider">
						<li><img src="images/ban1.jpg" width="740" height="401" /></li>
						<li><img src="images/ban1.jpg" width="740" height="401" /></li>
						<li><img src="images/ban1.jpg" width="740" height="401" /></li>
					</ul>
					<div class="op_btns clearfix">
						<a href="#" class="op_btn op_prev"><span></span></a> <a href="#"
							class="op_btn op_next"><span></span></a>
					</div>
				</div>
			</div>
			<!-- <script type="text/javascript">
        //var jq = jQuery.noConflict();
        (function(){
            $(".bxslider").bxSlider({
                auto:true,
                prevSelector:jq(".top_slide_wrap .op_prev")[0],nextSelector:jq(".top_slide_wrap .op_next")[0]
            });
        })();
        </script> -->
			<!--End Banner End-->
			<div class="inews">
				<div class="news_t">
					<span class="fr"><a href="#">更多 ></a></span>新闻资讯
				</div>
				<ul>
					<li><span>[ 特惠 ]</span><a href="#">掬一轮明月 表无尽惦念</a></li>
					<li><span>[ 公告 ]</span><a href="#">好奇金装成长裤新品上市</a></li>
					<li><span>[ 特惠 ]</span><a href="#">大牌闪购 · 抢！</a></li>
					<li><span>[ 公告 ]</span><a href="#">发福利 买车就抢千元油卡</a></li>
					<li><span>[ 公告 ]</span><a href="#">家电低至五折</a></li>
				</ul>
				<div class="charge_t">
					话费充值
					<div class="ch_t_icon"></div>
				</div>
				<form>
					<table border="0" style="width:205px; margin-top:10px;"
						cellspacing="0" cellpadding="0">
						<tr height="35">
							<td width="33">号码</td>
							<td><input type="text" value="" class="c_ipt" /></td>
						</tr>
						<tr height="35">
							<td>面值</td>
							<td><select class="jj" name="city">
									<option value="0" selected="selected">100元</option>
									<option value="1">50元</option>
									<option value="2">30元</option>
									<option value="3">20元</option>
									<option value="4">10元</option>
							</select> <span style="color:#ff4e00; font-size:14px;">￥99.5</span></td>
						</tr>
						<tr height="35">
							<td colspan="2"><input type="submit" value="立即充值"
								class="c_btn" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<!--Begin 热门商品 Begin-->
		<div class="content mar_10">
			<div class="h_l_img">
				<div class="img">
					<img src="images/l_img.jpg" width="188" height="188" />
				</div>
				<div class="pri_bg">
					<span class="price fl">￥53.00</span> <span class="fr">16R</span>
				</div>
			</div>
			<div class="hot_pro">
				<div id="featureContainer">
					<div id="feature">
						<div id="block">
							<div id="botton-scroll">
								<ul class="featureUL">
									<li class="featureBox">
										<div class="box">
											<div class="h_icon">
												<img src="images/hot.png" width="50" height="50" />
											</div>
											<div class="imgbg">
												<a href="#"><img src="images/hot1.jpg" width="160"
													height="136" /></a>
											</div>
											<div class="name">
												<a href="#">
													<h2>德国进口</h2> 德亚全脂纯牛奶200ml*48盒
												</a>
											</div>
											<div class="price">
												<font>￥<span>189</span></font> &nbsp; 26R
											</div>
										</div>
									</li>
									<li class="featureBox">
										<div class="box">
											<div class="h_icon">
												<img src="images/hot.png" width="50" height="50" />
											</div>
											<div class="imgbg">
												<a href="#"><img src="images/hot2.jpg" width="160"
													height="136" /></a>
											</div>
											<div class="name">
												<a href="#">
													<h2>iphone 6S</h2> Apple/苹果 iPhone 6s Plus公开版
												</a>
											</div>
											<div class="price">
												<font>￥<span>5288</span></font> &nbsp; 25R
											</div>
										</div>
									</li>
									<li class="featureBox">
										<div class="box">
											<div class="h_icon">
												<img src="images/hot.png" width="50" height="50" />
											</div>
											<div class="imgbg">
												<a href="#"><img src="images/hot3.jpg" width="160"
													height="136" /></a>
											</div>
											<div class="name">
												<a href="#">
													<h2>倩碧特惠组合套装</h2> 倩碧补水组合套装8折促销
												</a>
											</div>
											<div class="price">
												<font>￥<span>368</span></font> &nbsp; 18R
											</div>
										</div>
									</li>
									<li class="featureBox">
										<div class="box">
											<div class="h_icon">
												<img src="images/hot.png" width="50" height="50" />
											</div>
											<div class="imgbg">
												<a href="#"><img src="images/hot4.jpg" width="160"
													height="136" /></a>
											</div>
											<div class="name">
												<a href="#">
													<h2>品利特级橄榄油</h2> 750ml*4瓶装组合 西班牙原装进口
												</a>
											</div>
											<div class="price">
												<font>￥<span>280</span></font> &nbsp; 30R
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<a class="h_prev" href="javascript:void();">Previous</a> <a
							class="h_next" href="javascript:void();">Next</a>
					</div>
				</div>
			</div>
		</div>
		<!--Begin 限时特卖 Begin-->
		<div class="i_t mar_10">
			<span class="fl">限时特卖</span> <span class="i_mores fr"><a
				href="#">更多</a></span>
		</div>
		<div class="content">
			<div class="i_sell">
				<div id="imgPlay">
					<ul class="imgs" id="actor">
						<li><a href="#"><img src="images/tm_r.jpg" width="211"
								height="357" /></a></li>
						<li><a href="#"><img src="images/tm_r.jpg" width="211"
								height="357" /></a></li>
						<li><a href="#"><img src="images/tm_r.jpg" width="211"
								height="357" /></a></li>
					</ul>
					<div class="previ">上一张</div>
					<div class="nexti">下一张</div>
				</div>
			</div>
			<div class="sell_right">
				<div class="sell_1">
					<div class="s_img">
						<a href="#"><img src="images/tm_1.jpg" width="185"
							height="155" /></a>
					</div>
					<div class="s_price">
						￥<span>89</span>
					</div>
					<div class="s_name">
						<h2>
							<a href="#">沙宣洗发水</a>
						</h2>
						倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
					</div>
				</div>
				<div class="sell_2">
					<div class="s_img">
						<a href="#"><img src="images/tm_2.jpg" width="185"
							height="155" /></a>
					</div>
					<div class="s_price">
						￥<span>289</span>
					</div>
					<div class="s_name">
						<h2>
							<a href="#">德芙巧克力</a>
						</h2>
						倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
					</div>
				</div>
				<div class="sell_b1">
					<div class="sb_img">
						<a href="#"><img src="images/tm_b1.jpg" width="242"
							height="356" /></a>
					</div>
					<div class="s_price">
						￥<span>289</span>
					</div>
					<div class="s_name">
						<h2>
							<a href="#">东北大米</a>
						</h2>
						倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
					</div>
				</div>
				<div class="sell_3">
					<div class="s_img">
						<a href="#"><img src="images/tm_3.jpg" width="185"
							height="155" /></a>
					</div>
					<div class="s_price">
						￥<span>289</span>
					</div>
					<div class="s_name">
						<h2>
							<a href="#">迪奥香水</a>
						</h2>
						倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
					</div>
				</div>
				<div class="sell_4">
					<div class="s_img">
						<a href="#"><img src="images/tm_4.jpg" width="185"
							height="155" /></a>
					</div>
					<div class="s_price">
						￥<span>289</span>
					</div>
					<div class="s_name">
						<h2>
							<a href="#">美妆</a>
						</h2>
						倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
					</div>
				</div>
				<div class="sell_b2">
					<div class="sb_img">
						<a href="#"><img src="images/tm_b2.jpg" width="242"
							height="356" /></a>
					</div>
					<div class="s_price">
						￥<span>289</span>
					</div>
					<div class="s_name">
						<h2>
							<a href="#">美妆</a>
						</h2>
						倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
					</div>
				</div>
			</div>
		</div>
		<!--End 限时特卖 End-->
		<div class="content mar_20">
			<img src="images/mban_1.jpg" width="1200" height="110" />
		</div>
		<!--Begin 进口 生鲜 Begin-->
		<div class="i_t mar_10">
			<span class="floor_num">1F</span> <span class="fl">进口 <b>·</b>
				生鲜
			</span> <span class="i_mores fr"><a href="#">进口咖啡</a>&nbsp; &nbsp;
				&nbsp; <a href="#">进口酒</a>&nbsp; &nbsp; &nbsp; <a href="#">进口母婴</a>&nbsp;
				&nbsp; &nbsp; <a href="#">新鲜蔬菜</a>&nbsp; &nbsp; &nbsp; <a href="#">新鲜水果</a></span>
		</div>
		<div class="content">
			<div class="fresh_left">
				<div class="fre_ban">
					<div id="imgPlay1">
						<ul class="imgs" id="actor1">
							<li><a href="#"><img src="images/fre_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/fre_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/fre_r.jpg" width="211"
									height="286" /></a></li>
						</ul>
						<div class="prevf">上一张</div>
						<div class="nextf">下一张</div>
					</div>
				</div>
				<div class="fresh_txt">
					<div class="fresh_txt_c">
						<a href="#">进口水果</a><a href="#">奇异果</a><a href="#">西柚</a><a
							href="#">海鲜水产</a><a href="#">品质牛肉</a><a href="#">奶粉</a><a
							href="#">鲜活禽蛋</a><a href="#">进口酒</a><a href="#">进口奶粉</a><a
							href="#">鲜活禽蛋</a>
					</div>
				</div>
			</div>
			<div class="fresh_mid">
				<ul>
					<li>
						<div class="name">
							<a href="#">新鲜美味 进口美食</a>
						</div>
						<div class="price">
							<font>￥<span>198.00</span></font> &nbsp; 26R
						</div>
						<div class="img">
							<a href="#"><img src="images/fre_1.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">新鲜美味 进口美食</a>
						</div>
						<div class="price">
							<font>￥<span>198.00</span></font> &nbsp; 26R
						</div>
						<div class="img">
							<a href="#"><img src="images/fre_2.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">新鲜美味 进口美食</a>
						</div>
						<div class="price">
							<font>￥<span>198.00</span></font> &nbsp; 26R
						</div>
						<div class="img">
							<a href="#"><img src="images/fre_3.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">新鲜美味 进口美食</a>
						</div>
						<div class="price">
							<font>￥<span>198.00</span></font> &nbsp; 26R
						</div>
						<div class="img">
							<a href="#"><img src="images/fre_4.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">新鲜美味 进口美食</a>
						</div>
						<div class="price">
							<font>￥<span>198.00</span></font> &nbsp; 26R
						</div>
						<div class="img">
							<a href="#"><img src="images/fre_5.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">新鲜美味 进口美食</a>
						</div>
						<div class="price">
							<font>￥<span>198.00</span></font> &nbsp; 26R
						</div>
						<div class="img">
							<a href="#"><img src="images/fre_6.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
				</ul>
			</div>
			<div class="fresh_right">
				<ul>
					<li><a href="#"><img src="images/fre_b1.jpg" width="260"
							height="220" /></a></li>
					<li><a href="#"><img src="images/fre_b2.jpg" width="260"
							height="220" /></a></li>
				</ul>
			</div>
		</div>
		<!--End 进口 生鲜 End-->
		<!--Begin 食品饮料 Begin-->
		<div class="i_t mar_10">
			<span class="floor_num">2F</span> <span class="fl">食品饮料</span> <span
				class="i_mores fr"><a href="#">咖啡</a>&nbsp; &nbsp; | &nbsp;
				&nbsp;<a href="#">休闲零食</a>&nbsp; &nbsp; | &nbsp; &nbsp;<a href="#">饼干糕点</a>&nbsp;
				&nbsp; | &nbsp; &nbsp;<a href="#">冲饮谷物</a>&nbsp; &nbsp; | &nbsp;
				&nbsp;<a href="#">营养保健</a></span>
		</div>
		<div class="content">
			<div class="food_left">
				<div class="food_ban">
					<div id="imgPlay2">
						<ul class="imgs" id="actor2">
							<li><a href="#"><img src="images/food_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/food_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/food_r.jpg" width="211"
									height="286" /></a></li>
						</ul>
						<div class="prev_f">上一张</div>
						<div class="next_f">下一张</div>
					</div>
				</div>
				<div class="fresh_txt">
					<div class="fresh_txt_c">
						<a href="#">饼干糕点</a><a href="#">休闲零食</a><a href="#">饮料果汁</a><a
							href="#">牛奶乳品</a><a href="#">冲饮谷物</a><a href="#">营养保健</a><a
							href="#">冲饮谷物</a><a href="#">营养保健</a>
					</div>
				</div>
			</div>
			<div class="fresh_mid">
				<ul>
					<li>
						<div class="name">
							<a href="#">莫斯利安酸奶</a>
						</div>
						<div class="price">
							<font>￥<span>96.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/food_1.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">莫斯利安酸奶</a>
						</div>
						<div class="price">
							<font>￥<span>96.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/food_2.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">莫斯利安酸奶</a>
						</div>
						<div class="price">
							<font>￥<span>96.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/food_3.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">莫斯利安酸奶</a>
						</div>
						<div class="price">
							<font>￥<span>96.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/food_4.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">莫斯利安酸奶</a>
						</div>
						<div class="price">
							<font>￥<span>96.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/food_5.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">莫斯利安酸奶</a>
						</div>
						<div class="price">
							<font>￥<span>96.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/food_6.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
				</ul>
			</div>
			<div class="fresh_right">
				<ul>
					<li><a href="#"><img src="images/food_b1.jpg" width="260"
							height="220" /></a></li>
					<li><a href="#"><img src="images/food_b2.jpg" width="260"
							height="220" /></a></li>
				</ul>
			</div>
		</div>
		<!--End 食品饮料 End-->
		<!--Begin 个人美妆 Begin-->
		<div class="i_t mar_10">
			<span class="floor_num">3F</span> <span class="fl">个人美妆</span> <span
				class="i_mores fr"><a href="#">洗发护发</a>&nbsp; &nbsp; | &nbsp;
				&nbsp;<a href="#">面膜</a>&nbsp; &nbsp; | &nbsp; &nbsp;<a href="#">洗面奶</a>&nbsp;
				&nbsp; | &nbsp; &nbsp;<a href="#">香水</a>&nbsp; &nbsp; | &nbsp;
				&nbsp;<a href="#">沐浴露</a></span>
		</div>
		<div class="content">
			<div class="make_left">
				<div class="make_ban">
					<div id="imgPlay3">
						<ul class="imgs" id="actor3">
							<li><a href="#"><img src="images/make_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/make_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/make_r.jpg" width="211"
									height="286" /></a></li>
						</ul>
						<div class="prev_m">上一张</div>
						<div class="next_m">下一张</div>
					</div>
				</div>
				<div class="fresh_txt">
					<div class="fresh_txt_c">
						<a href="#">洗发护发</a><a href="#">牙刷牙膏</a><a href="#">面膜</a><a
							href="#">补水面膜</a><a href="#">香水</a><a href="#">面霜</a><a href="#">洗面奶</a><a
							href="#">脱毛膏</a><a href="#">沐浴露</a>
					</div>
				</div>
			</div>
			<div class="fresh_mid">
				<ul>
					<li>
						<div class="name">
							<a href="#">美宝莲粉饼</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 16R
						</div>
						<div class="img">
							<a href="#"><img src="images/make_1.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">美宝莲粉饼</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 16R
						</div>
						<div class="img">
							<a href="#"><img src="images/make_2.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">美宝莲粉饼</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 16R
						</div>
						<div class="img">
							<a href="#"><img src="images/make_3.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">美宝莲粉饼</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 16R
						</div>
						<div class="img">
							<a href="#"><img src="images/make_4.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">美宝莲粉饼</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 16R
						</div>
						<div class="img">
							<a href="#"><img src="images/make_5.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">美宝莲粉饼</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 16R
						</div>
						<div class="img">
							<a href="#"><img src="images/make_6.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
				</ul>
			</div>
			<div class="fresh_right">
				<ul>
					<li><a href="#"><img src="images/make_b1.jpg" width="260"
							height="220" /></a></li>
					<li><a href="#"><img src="images/make_b2.jpg" width="260"
							height="220" /></a></li>
				</ul>
			</div>
		</div>
		<!--End 个人美妆 End-->
		<div class="content mar_20">
			<img src="images/mban_1.jpg" width="1200" height="110" />
		</div>
		<!--Begin 母婴玩具 Begin-->
		<div class="i_t mar_10">
			<span class="floor_num">4F</span> <span class="fl">母婴玩具</span> <span
				class="i_mores fr"><a href="#">营养品</a>&nbsp; &nbsp; | &nbsp;
				&nbsp;<a href="#">孕妈背带裤</a>&nbsp; &nbsp; | &nbsp; &nbsp;<a href="#">儿童玩具</a>&nbsp;
				&nbsp; | &nbsp; &nbsp;<a href="#">婴儿床</a>&nbsp; &nbsp; | &nbsp;
				&nbsp;<a href="#">喂奶器</a></span>
		</div>
		<div class="content">
			<div class="baby_left">
				<div class="baby_ban">
					<div id="imgPlay4">
						<ul class="imgs" id="actor4">
							<li><a href="#"><img src="images/baby_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/baby_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/baby_r.jpg" width="211"
									height="286" /></a></li>
						</ul>
						<div class="prev_b">上一张</div>
						<div class="next_b">下一张</div>
					</div>
				</div>
				<div class="fresh_txt">
					<div class="fresh_txt_c">
						<a href="#">孕妈必备</a><a href="#">儿童玩具</a><a href="#">重装童鞋</a><a
							href="#">辅助食品</a><a href="#">奶粉</a><a href="#">鲜活禽蛋</a><a
							href="#">维生素</a><a href="#">重装童鞋</a><a href="#">辅助食品</a>
					</div>
				</div>
			</div>
			<div class="fresh_mid">
				<ul>
					<li>
						<div class="name">
							<a href="#">儿童玩具 变形金刚</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 20R
						</div>
						<div class="img">
							<a href="#"><img src="images/baby_1.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">儿童玩具 变形金刚</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 20R
						</div>
						<div class="img">
							<a href="#"><img src="images/baby_2.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">儿童玩具 变形金刚</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 20R
						</div>
						<div class="img">
							<a href="#"><img src="images/baby_3.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">儿童玩具 变形金刚</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 20R
						</div>
						<div class="img">
							<a href="#"><img src="images/baby_4.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">儿童玩具 变形金刚</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 20R
						</div>
						<div class="img">
							<a href="#"><img src="images/baby_5.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">儿童玩具 变形金刚</a>
						</div>
						<div class="price">
							<font>￥<span>260.00</span></font> &nbsp; 20R
						</div>
						<div class="img">
							<a href="#"><img src="images/baby_6.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
				</ul>
			</div>
			<div class="fresh_right">
				<ul>
					<li><a href="#"><img src="images/baby_b1.jpg" width="260"
							height="220" /></a></li>
					<li><a href="#"><img src="images/baby_b2.jpg" width="260"
							height="220" /></a></li>
				</ul>
			</div>
		</div>
		<!--End 母婴玩具 End-->
		<!--Begin 家居生活 Begin-->
		<div class="i_t mar_10">
			<span class="floor_num">5F</span> <span class="fl">家居生活</span> <span
				class="i_mores fr"><a href="#">床上用品</a>&nbsp; &nbsp; | &nbsp;
				&nbsp;<a href="#">家纺布艺</a>&nbsp; &nbsp; | &nbsp; &nbsp;<a href="#">餐具</a>&nbsp;
				&nbsp; | &nbsp; &nbsp;<a href="#">沙发</a>&nbsp; &nbsp; | &nbsp;
				&nbsp;<a href="#">汽车用品</a></span>
		</div>
		<div class="content">
			<div class="home_left">
				<div class="home_ban">
					<div id="imgPlay5">
						<ul class="imgs" id="actor5">
							<li><a href="#"><img src="images/home_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/home_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/home_r.jpg" width="211"
									height="286" /></a></li>
						</ul>
						<div class="prev_h">上一张</div>
						<div class="next_h">下一张</div>
					</div>
				</div>
				<div class="fresh_txt">
					<div class="fresh_txt_c">
						<a href="#">床上用品</a><a href="#">家纺布艺</a><a href="#">餐具水具</a><a
							href="#">锅具厨具</a><a href="#">沙发</a><a href="#">书柜</a><a href="#">狗粮</a><a
							href="#">家装建材</a><a href="#">汽车用品</a>
					</div>
				</div>
			</div>
			<div class="fresh_mid">
				<ul>
					<li>
						<div class="name">
							<a href="#">品质蓝色沙发</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 50R
						</div>
						<div class="img">
							<a href="#"><img src="images/home_1.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">品质蓝色沙发</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 50R
						</div>
						<div class="img">
							<a href="#"><img src="images/home_2.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">品质蓝色沙发</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 50R
						</div>
						<div class="img">
							<a href="#"><img src="images/home_3.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">品质蓝色沙发</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 50R
						</div>
						<div class="img">
							<a href="#"><img src="images/home_4.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">品质蓝色沙发</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 50R
						</div>
						<div class="img">
							<a href="#"><img src="images/home_5.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">品质蓝色沙发</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 50R
						</div>
						<div class="img">
							<a href="#"><img src="images/home_6.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
				</ul>
			</div>
			<div class="fresh_right">
				<ul>
					<li><a href="#"><img src="images/home_b1.jpg" width="260"
							height="220" /></a></li>
					<li><a href="#"><img src="images/home_b2.jpg" width="260"
							height="220" /></a></li>
				</ul>
			</div>
		</div>
		<!--End 家居生活 End-->
		<!--Begin 数码家电 Begin-->
		<div class="i_t mar_10">
			<span class="floor_num">6F</span> <span class="fl">数码家电</span> <span
				class="i_mores fr"><a href="#">手机</a>&nbsp; &nbsp; | &nbsp;
				&nbsp;<a href="#">苹果</a>&nbsp; &nbsp; | &nbsp; &nbsp;<a href="#">华为手机</a>&nbsp;
				&nbsp; | &nbsp; &nbsp;<a href="#">洗衣机</a>&nbsp; &nbsp; | &nbsp;
				&nbsp;<a href="#">数码配件</a></span>
		</div>
		<div class="content">
			<div class="tel_left">
				<div class="tel_ban">
					<div id="imgPlay6">
						<ul class="imgs" id="actor6">
							<li><a href="#"><img src="images/tel_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/tel_r.jpg" width="211"
									height="286" /></a></li>
							<li><a href="#"><img src="images/tel_r.jpg" width="211"
									height="286" /></a></li>
						</ul>
						<div class="prev_t">上一张</div>
						<div class="next_t">下一张</div>
					</div>
				</div>
				<div class="fresh_txt">
					<div class="fresh_txt_c">
						<a href="#">手机</a><a href="#">平板电脑</a><a href="#">空调</a><a
							href="#">合约机</a><a href="#">电风扇</a><a href="#">数码配件</a><a
							href="#">洗衣机</a><a href="#">电视</a><a href="#">充电器</a><a href="#">耳线</a>
					</div>
				</div>
			</div>
			<div class="fresh_mid">
				<ul>
					<li>
						<div class="name">
							<a href="#">乐视高清电视</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/tel_1.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">乐视高清电视</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/tel_2.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">乐视高清电视</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/tel_3.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">乐视高清电视</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/tel_4.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">乐视高清电视</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/tel_5.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
					<li>
						<div class="name">
							<a href="#">乐视高清电视</a>
						</div>
						<div class="price">
							<font>￥<span>2160.00</span></font> &nbsp; 25R
						</div>
						<div class="img">
							<a href="#"><img src="images/tel_6.jpg" width="185"
								height="155" /></a>
						</div>
					</li>
				</ul>
			</div>
			<div class="fresh_right">
				<ul>
					<li><a href="#"><img src="images/tel_b1.jpg" width="260"
							height="220" /></a></li>
					<li><a href="#"><img src="images/tel_b2.jpg" width="260"
							height="220" /></a></li>
				</ul>
			</div>
		</div>
		<!--End 数码家电 End-->
		<!--Begin 猜你喜欢 Begin-->
		<div class="i_t mar_10">
			<span class="fl">猜你喜欢</span>
		</div>
		<div class="like">
			<div id="featureContainer1">
				<div id="feature1">
					<div id="block1">
						<div id="botton-scroll1">
							<ul class="featureUL">
								<li class="featureBox">
									<div class="box">
										<div class="imgbg">
											<a href="#"><img src="images/hot1.jpg" width="160"
												height="136" /></a>
										</div>
										<div class="name">
											<a href="#">
												<h2>德国进口</h2> 德亚全脂纯牛奶200ml*48盒
											</a>
										</div>
										<div class="price">
											<font>￥<span>189</span></font> &nbsp; 26R
										</div>
									</div>
								</li>
								<li class="featureBox">
									<div class="box">
										<div class="imgbg">
											<a href="#"><img src="images/hot2.jpg" width="160"
												height="136" /></a>
										</div>
										<div class="name">
											<a href="#">
												<h2>iphone 6S</h2> Apple/苹果 iPhone 6s Plus公开版
											</a>
										</div>
										<div class="price">
											<font>￥<span>5288</span></font> &nbsp; 25R
										</div>
									</div>
								</li>
								<li class="featureBox">
									<div class="box">
										<div class="imgbg">
											<a href="#"><img src="images/hot3.jpg" width="160"
												height="136" /></a>
										</div>
										<div class="name">
											<a href="#">
												<h2>倩碧特惠组合套装</h2> 倩碧补水组合套装8折促销
											</a>
										</div>
										<div class="price">
											<font>￥<span>368</span></font> &nbsp; 18R
										</div>
									</div>
								</li>
								<li class="featureBox">
									<div class="box">
										<div class="imgbg">
											<a href="#"><img src="images/hot4.jpg" width="160"
												height="136" /></a>
										</div>
										<div class="name">
											<a href="#">
												<h2>品利特级橄榄油</h2> 750ml*4瓶装组合 西班牙原装进口
											</a>
										</div>
										<div class="price">
											<font>￥<span>280</span></font> &nbsp; 30R
										</div>
									</div>
								</li>
								<li class="featureBox">
									<div class="box">
										<div class="imgbg">
											<a href="#"><img src="images/hot4.jpg" width="160"
												height="136" /></a>
										</div>
										<div class="name">
											<a href="#">
												<h2>品利特级橄榄油</h2> 750ml*4瓶装组合 西班牙原装进口
											</a>
										</div>
										<div class="price">
											<font>￥<span>280</span></font> &nbsp; 30R
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<a class="l_prev" href="javascript:void();">Previous</a> <a
						class="l_next" href="javascript:void();">Next</a>
				</div>
			</div>
		</div>
		<!--End 猜你喜欢 End-->

		<!--Begin Footer Begin -->
		<div class="b_btm_bg b_btm_c">
			<div class="b_btm">
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72"><img src="images/b1.png" width="62"
							height="62" /></td>
						<td><h2>正品保障</h2>正品行货 放心购买</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72"><img src="images/b2.png" width="62"
							height="62" /></td>
						<td><h2>满38包邮</h2>满38包邮 免运费</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72"><img src="images/b3.png" width="62"
							height="62" /></td>
						<td><h2>天天低价</h2>天天低价 畅选无忧</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72"><img src="images/b4.png" width="62"
							height="62" /></td>
						<td><h2>准时送达</h2>收货时间由你做主</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="b_nav">
			<dl>
				<dt>
					<a href="#">新手上路</a>
				</dt>
				<dd>
					<a href="#">售后流程</a>
				</dd>
				<dd>
					<a href="#">购物流程</a>
				</dd>
				<dd>
					<a href="#">订购方式</a>
				</dd>
				<dd>
					<a href="#">隐私声明</a>
				</dd>
				<dd>
					<a href="#">推荐分享说明</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">配送与支付</a>
				</dt>
				<dd>
					<a href="#">货到付款区域</a>
				</dd>
				<dd>
					<a href="#">配送支付查询</a>
				</dd>
				<dd>
					<a href="#">支付方式说明</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">会员中心</a>
				</dt>
				<dd>
					<a href="#">资金管理</a>
				</dd>
				<dd>
					<a href="#">我的收藏</a>
				</dd>
				<dd>
					<a href="#">我的订单</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">服务保证</a>
				</dt>
				<dd>
					<a href="#">退换货原则</a>
				</dd>
				<dd>
					<a href="#">售后服务保证</a>
				</dd>
				<dd>
					<a href="#">产品质量保证</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">联系我们</a>
				</dt>
				<dd>
					<a href="#">网站故障报告</a>
				</dd>
				<dd>
					<a href="#">购物咨询</a>
				</dd>
				<dd>
					<a href="#">投诉与建议</a>
				</dd>
			</dl>
			<div class="b_tel_bg">
				<a href="#" class="b_sh1">新浪微博</a> <a href="#" class="b_sh2">腾讯微博</a>
				<p>
					服务热线：<br /> <span>400-123-4567</span>
				</p>
			</div>
			<div class="b_er">
				<div class="b_er_c">
					<img src="images/er.gif" width="118" height="118" />
				</div>
				<img src="images/ss.png" />
			</div>
		</div>
		<div class="btmbg">
			<div class="btm">
				备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright © 2015-2018
				尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
				<img src="images/b_1.gif" width="98" height="33" /><img
					src="images/b_2.gif" width="98" height="33" /><img
					src="images/b_3.gif" width="98" height="33" /><img
					src="images/b_4.gif" width="98" height="33" /><img
					src="images/b_5.gif" width="98" height="33" /><img
					src="images/b_6.gif" width="98" height="33" />
			</div>
		</div>
		<!--End Footer End -->
	</div>
</body>
<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>

<%-- <div class="top">
	<div class="logo">
		<a href="${ctx}/Home?action=index"><img
			src="${ctx}/statics/images/logo.png"></a>
	</div>
	<div class="search">
		<form>
			<input txype="text" value="" class="s_ipt"> <input
				type="submit" value="搜索" class="s_btn">
		</form>
		<span class="fl"> <a href="javascript:void(0)">咖啡</a> <a
			href="javascript:void(0)">iphone 6S</a> <a href="javascript:void(0)">新鲜美食</a>
			<a href="javascript:void(0)">蛋糕</a> <a href="javascript:void(0)">日用品</a>
			<a href="javascript:void(0)">连衣裙</a>
		</span>
	</div>
	<div class="i_car">
		<div class="car_t">
			购物车 [ <span>3</span> ]
		</div>
		<div class="car_bg">
			<!--Begin 购物车未登录 Begin-->
			<c:if test="${sessionScope.loginUser==null}">
				<div class="un_login">
					还未登录！<a href="${ctx}/Login?action=toLogin" style="color:#ff4e00;">马上登录</a>
					查看购物车！
				</div>
			</c:if>
			<!--End 购物车未登录 End-->
			<!--Begin 购物车已登录 Begin-->
			<ul class="cars">
				<c:if
					test="${sessionScope.cart2==null || sessionScope.cart2.items.size()<1}"> 您尚未购买任何物品，是否进入<a
						href="${ctx}/Home?action=index">商品页</a>进行购买！</c:if>
				<c:if test="${sessionScope.cart2.items.size()>=1}">
					<li>
						<div class="img">
							<a href="javascript:void(0)"> <img
								src="${ctx}/statics/images/car1.jpg" width="58" height="58">
							</a>
						</div>
						<div class="name">
							<a href="javascript:void(0)">法颂浪漫梦境50ML 香水女士持久清新淡香 送2ML小样3只</a>
						</div>
						<div class="price">
							<font color="#ff4e00">￥399</font>X1
						</div>
					</li>
				</c:if>
			</ul>
			<div class="price_sum">
				共计&nbsp; <font color="#ff4e00">￥</font><span>1058</span>
			</div>
			<div class="price_a">
				<a href="javascript:void(0)">去购物车结算</a>
			</div>
			<!--End 购物车已登录 End-->
		</div>
	</div>
</div> --%>