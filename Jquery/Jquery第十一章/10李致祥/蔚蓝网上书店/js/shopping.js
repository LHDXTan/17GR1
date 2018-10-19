$(document).ready(function () {
	//计算总价
	function price(){
		var parcents = 0;//积分
		var prices = 0;//原价
		var pricess = 0;//现价
		$("#myTableProduct").find("tr").each(function (i,dom) {
			var num = $(dom).find(".shopping_product_list_5").find("input").val();//数量
			parcents += parseInt($(dom).find(".shopping_product_list_2").text())*num;//积分
			var pricesss = parseInt($(dom).find(".shopping_product_list_4").find("label").text().replace(".",""))*num;
			pricess += pricesss;
			var priceS= parseInt($(dom).find(".shopping_product_list_3").find("label").text().replace(".",""))*num;
			prices +=priceS; 
		});
		$("#product_integral").text(parcents);
        $("#product_total").text(pricess/100);
        $("#product_save").text((prices-pricess)/100);
        return pricess/100;
	}
	price();
	//删除商品
	$("#myTableProduct").find(".shopping_product_list_6").children("a").click(function () {
		if (confirm("是否删除该商品？")) {
			$(this).parent().parent().hide();
			price();
		}
	});
	//清空购物车
	$("#removeAllProduct").click(function () {
		$("#myTableProduct").next().remove();
		$("#myTableProduct").remove();
		$(".shopping_list_border").append("<div class='empty_product'><div>您还没有挑选商品，<a href='index.html'>去挑选看看>></a></div></div>");
	});
	//修改数量
    $("#myTableProduct").find(".shopping_product_list_5").children("input").change(function(){
        var value=$(this).val();
        if((value == "")||!(/^[0-9]*[1-9][0-9]*$/.test(value))){
            alert("数量不能为空，且只能为正整数");
            $(this).val(1);
        }
        var t =price();
        alert("修改成功！，您的商品总金额是"+t+"元");
    });
    //隔行变色
    $("#myTableProduct").find("tr:odd").css("background-color","#ffebcd");
    //商品变色
    $("#myTableProduct").find("tr").mouseover(function(){
        $(this).css("backgroundColor","#fff");
    }).mouseout(function(){
        if($("#myTableProduct").find("tr").index($(this))%2==1) {//判断是否奇数行
            $(this).css("backgroundColor","#ffebcd");
        }else{
            $(this).css("backgroundColor","#fefbf2");
        }
    });
    //显示和隐藏
    $("#shopping_commend_arrow").click(function(){
        if($("#shopping_commend_sort").css("display")=="none"){
            $(this).attr("src","images/shopping_arrow_up.gif");
        }else{
            $(this).attr("src","images/shopping_arrow_down.gif");
        }
        $("#shopping_commend_sort").toggle();
    });
})