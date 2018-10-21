$(function($){
	$("#menu").mouseover(function(){
	$("#dd_menu_top_down").slideDown(1000);
}).mouseleave(function(){
	$("#dd_menu_top_down").slideUp(1000);
})
    $("#myTableProduct").find("tr:odd").css("background","#ffebcd");
    
       $("#myTableProduct").find("tr").mouseover(function(){
        $(this).css("background","#fff");
    }).mouseout(function(){
        if($("#myTableProduct").find("tr").index($(this))%2==1) {//判断是否奇数行
            $(this).css("background","#ffebcd");
        }else{
            $(this).css("background","#fefbf2");
        }
    });
	   //计算总价
    function totalPrice(){
        var percents= 0,prePrices= 0,prices=0;//积分，原价，现价
        $("#myTableProduct").find("tr").each(function(i,ele){
            var num=$(ele).find(".shopping_product_list_5").find("input").val();//数量
            percents+=parseInt($(ele).find(".shopping_product_list_2").text())*num;
            //解决下js中浮点数的bug问题，因此建议浮点数的运算不要放在前台，这里是指粗略的解决了一下
            var price=parseInt($(ele).find(".shopping_product_list_4").find("label").text().replace(".",""))*num;
            prices+=price;
            var prePrice=parseInt($(ele).find(".shopping_product_list_3").find("label").text().replace(".",""))*num;
            prePrices+=prePrice;
        });
        $("#product_integral").text(percents);
        $("#product_total").text(prices/100);
        $("#product_save").text((prePrices-prices)/100);
        return prices/100;
    }
    totalPrice();
      //根据您挑选的商品，当当为您推荐部分的显示和隐藏
    $("#shopping_commend_arrow").click(function(){
        if($("#shopping_commend_sort").css("display")=="none"){
            $(this).attr("src","images/shopping_arrow_up.gif");
        }else{
            $(this).attr("src","images/shopping_arrow_down.gif");
        }
        $("#shopping_commend_sort").toggle();
    });
  
})

