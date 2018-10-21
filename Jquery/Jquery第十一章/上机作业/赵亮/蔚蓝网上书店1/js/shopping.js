$(function(){
	//商品列表的隐藏和显示
	    //根据您挑选的商品，当当为您推荐部分的显示和隐藏
    $("#shopping_commend_arrow").click(function(){
       if($("#shopping_commend_sort").css("display")=="none"){
            $(this).attr("src","images/shopping_arrow_up.gif");
        }else{
            $(this).attr("src","images/shopping_arrow_down.gif");
        }
        $("#shopping_commend_sort").toggle();
    });
	
	
	//删除
	$(".shopping_product_list_6 a").click(function(){
		$(this).parent().parent().hide();
	});
	//清空购物车
	$("#removeAllProduct").click(function(){
		$("#myTableProduct tr").hide();
	});
	
	
	
	/*function u(){
	$("#removeAllProduct tr:visible");
	
		
	}*/
	
	//总计
	$(".shopping_product_list_5 input").change(function(){
		//积分
		var ji=0.0;
		//市场价
		var shi=0.0;
		//蔚蓝价
		var wei=0.0;
		//总价
		var zong=0.0;
		$(this).val();
//		alert($(this).val());
		//显示的积分
		$(".shopping_product_list_2>label:visible").each(function(){
	  		
			var b=$(this).html();
			var g=$(this).parent().next().next().next().children().val();
			ji+=parseFloat(b)*parseInt(g);
		});
		$("#product_integral").html(ji);
		//市场价
		$(".shopping_product_list_3>label:visible").each(function(){
	  		
			var b=$(this).html();
			var g=$(this).parent().next().next().children().val();
			shi+=parseFloat(b)*parseInt(g);
		});
		//蔚蓝价
		$(".shopping_product_list_4>label:visible").each(function(){
	  		
			var b=$(this).html();
			var g=$(this).parent().next().children().val();
			wei+=parseFloat(b)*parseInt(g);
		});
		$("#product_save").html(parseInt(shi-wei));
		$(".shopping_list_end_3").html("商品金额总计："+parseFloat(wei));
	})
	
})
