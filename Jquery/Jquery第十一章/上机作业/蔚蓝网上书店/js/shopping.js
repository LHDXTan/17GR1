$(function(){
	//隔行变色
	$(window).load(function(){
		i=0;
		$("#myTableProduct").find("tr").each(function(){
			i++;
			if(i%2==0){
				 $(this).css("backgroundColor","#fefbf2");
			}else{
				$(this).css("backgroundColor","#ffebcd")
			}
		})
		
	})
	//删除
	$(".shopping_product_list .shopping_product_list_6").find(".blue").click(function(){
		$(this).parent().parent().remove();
	})
	//清空购物车
	$(".shopping_list_end #removeAllProduct").click(function(){
		$("#myTableProduct tr").remove();
		$("#myTableProduct").remove();
		$(".shopping_list_end").remove();
		$(".shopping_list_border").append("<div class='empty_product'><div>您还没有挑选商品，<a href='index.html'>go to shopping>></a></div></div>");
		
	})
	//商品推荐
	$("#shopping_commend_arrow").click(function(){
		$("#shopping_commend_sort").toggle();
	})
	//计算money
	function jisuan(){
		var jifen=0;
		var shi=0;
		var wei=0;
		var dangqian=$("#myTableProduct").find("tr");
		dangqian.each(function(i,ele){
			num=$(ele).find(".shopping_product_list_5").find("input").val();
			jifen+=parseInt($(ele).find(".shopping_product_list_2").find("label").text())*num;
			var s=parseInt($(ele).find(".shopping_product_list_3").find("label").text().replace(".",""))*num;
			shi+=s;
			var w=parseInt($(ele).find(".shopping_product_list_4").find("label").text().replace(".",""))*num;
			wei+=w;
		})
		
		$("#product_total").text(wei/100);
		$("#product_save").text((shi-wei)/100);
		$("#product_integral").text(jifen);
		return wei/100;
	}
	jisuan()
	$("#myTableProduct").find(".shopping_product_list_5").find("input").change(function(){
		var va=$(this).val();
		if(va==" "||!(/^[0-9]*[1-9][0-9]*$/.test(va))){
			alert("不能为空，并且必须为正整数");
			$(this).val(1);
		}
		var jia=jisuan();
		alert("修改成功,您的商品总金额是"+jia+"元")
	})
	
	
})
