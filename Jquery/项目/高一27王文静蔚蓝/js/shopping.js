$(document).ready(function() {
	//对三角点击进行显示和隐藏
	$("#shopping_commend_arrow").click(function() {
		if($("#shopping_commend_sort").css("display") == "none") {
			$(this).attr("src", "images/shopping_arrow_up.gif");
		} else {
			$(this).attr("src", "images/shopping_arrow_down.gif");
		}
		$("#shopping_commend_sort").toggle();
	});
	//商品隔行变色
	$("#myTableProduct tr:odd").css("background-color", "wheat");
	$("#myTableProduct tr").mouseover(function() {
		$(this).css("background-color", "antiquewhite");
	}).mouseout(function() {
		if($("#myTableProduct tr").index($(this)) % 2 == 1) {
			$(this).css("background-color", "wheat");
		} else {
			$(this).css("background-color", "white");
		}
	})
	//计算总价
	function zhongjia() {
		var jifen = 0; //积分
		var yuanjia = 0; //原价
		var xianjia = 0; //现价
		$("#myTableProduct").find("tr").each(function(i, n) {
			var shuliang = $(n).find(".shopping_product_list_5").find("input").val();
			jifen += parseInt($(n).find(".shopping_product_list_2").text()) * shuliang;
			var xian = parseInt($(n).find(".shopping_product_list_4").find("label").text().replace(".", "")) * shuliang;
			xianjia += xian;
			var yuan = parseInt($(n).find(".shopping_product_list_3").find("label").text().replace(".", "")) * shuliang;
			yuanjia += yuan;
		});
		$("#product_integral").text(jifen);
		$("#product_total").text(xianjia/100);
		$("#product_save").text((yuanjia-xianjia)/100);
		return xianjia/100;
	}
	zhongjia();
	//對商品行刪除
	$("#myTableProduct .shopping_product_list_6").children("a").click(function(){
	if(confirm("你确定要删除该商品吗？")){
	$(this).parent().parent().remove();	
	zhongjia();
	}
	})
//修改商品数量
$("#myTableProduct .shopping_product_list_5").children("input").change(function(){
var $this=$(this).val();
if(($this=="")||!(/^[0-9]*[1-9][0-9]*$/.test($this))){
alert("抱歉数量不能为空,且只能是整数");
$(this).val(1);
}
var zhong=zhongjia();
alert("修改成功,你当前的总额是"+zhong+"元");
})
//清空购物车
$("#removeAllProduct").click(function(){
$("#myTableProduct").next().remove();
$("#myTableProduct").remove();
$(".shopping_list_border").append("<div class='empty_product'><div>你还没有挑选怕商品，<a href='index.html'>再去挑挑看看</a></div></div>")

})
})