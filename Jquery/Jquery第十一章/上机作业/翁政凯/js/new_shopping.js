	//显示隐藏
	$("#shopping_commend_arrow").click(function(){
		if($("#shopping_commend_sort").css("display")=="none"){
		$("#shopping_commend_arrow").attr("src","images/shopping_arrow_up.gif");
		}else{
		$("#shopping_commend_arrow").attr("src","images/shopping_arrow_down.gif");
		}
		$("#shopping_commend_sort").toggle();
	});
	
	//变色
	 $("#myTableProduct").find("tr:odd").css("backgroundColor","#ffebcd");
	  $("#myTableProduct").find("tr").hover(function(){
	  	$(this).css("background-color","#fefbf2");
	  },function(){
	  	 if($("#myTableProduct").find("tr").index($(this))%2==1) {
            $(this).css("backgroundColor","#ffebcd");
        }else{
            $(this).css("backgroundColor","#fefbf2");
        }
	  });
	  
	//删除
	$(".shopping_product_list_6").children("a").click(function(){
		if(confirm("您确定要删除商品么？")){
		 	$(this).parent().parent().remove();
		 	 ss();
        }
	});
	//清空购物车，删除全部。
	$("#removeAllProduct").click(function(){
		if(confirm("您确定要清空购物车？")){
			$("#myTableProduct").next().remove();
       		$("#myTableProduct").remove();
			$(".shopping_list_border").append("<div class='empty_product'><div>您还没有挑选商品，<a href='index.html'>去挑选看看>></a></div></div>");
        }
	});
	
	//计算积分和金额 
	function ss(){
        var jifen= 0;//积分
        var shijia= 0;//原价
        var weilan=0; //现价
        $("#myTableProduct").find("tr").each(function(i,ele){
            var num = $(ele).find(".shopping_product_list_5").find("input").val();//数量
            //积分
            jifen += parseInt($(ele).find(".shopping_product_list_2").text())*num;
            var price = parseInt($(ele).find(".shopping_product_list_4").find("label").text().replace(".",""))*num;//String replace替换字符串-->去除小数点相当于乘100。
            //蔚蓝价
            weilan += price;
            var prePrice = parseInt($(ele).find(".shopping_product_list_3").find("label").text().replace(".",""))*num;
            //市场价
            shijia += prePrice;
        });
        $("#product_integral").text(jifen);
        $("#product_total").text(weilan/100);
        $("#product_save").text((shijia-weilan)/100);
        return weilan/100;
    }
    ss();
    //改变数量。
    $("#myTableProduct").find(".shopping_product_list_5").children("input").change(function(){
        var value=$(this).val();
        if((value == "")||!(/^[0-9]*[1-9][0-9]*$/.test(value))){
            alert("数量不能为空，且只能为正整数");
            $(this).val(1);
        }
        var t = ss();
    });
