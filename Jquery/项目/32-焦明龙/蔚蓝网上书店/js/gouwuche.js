$(document).ready(function() {
	//隔行变色
	//：even是偶数行变为颜色为#dddddd的颜色
	$(".shopping_product_list:even").css("background-color", "#dddddd");
	$(".shopping_product_list:odd").css("background-color", "antiquewhite");
	//当鼠标停到even行是颜色改变为#dddddd
	$(".shopping_product_list:even").mousemove(function() {
		$(this).css("background-color", "#dddddd");
	});
	//当鼠标离开时颜色变为aquamarine
	$(".shopping_product_list:even").mouseout(function() {               
		$(this).css("background-color", "aquamarine");            
	}); 
	////当鼠标停到odd行是颜色改变为#dddddd
	$(".shopping_product_list:odd").mousemove(function() {
		$(this).css("background-color", "#dddddd");
	}); 
	////当鼠标离开时颜色变为aquamarine          
	$(".shopping_product_list:odd").mouseout(function() {               
		$(this).css("background-color", "antiquewhite");            
	});
	//点击实现显示和隐藏
	//toggle()方法包含了show()和hide()
	$("#shopping_commend_arrow").click(function() {
		$("#shopping_commend_sort").toggle();
	});
	//计算价格
	function jiage() {
		//先创建一个积分,原价,现价的初始值为0
		var percents = 0,
			prePrices = 0,
			prices = 0; //积分，原价，现价
			//用find()找到所有的tr标签用each()便利出来
		$("#myTableProduct").find("tr").each(function(i, ele) {
			//用find()找到所有的tr和input标签val()获取到
			var num = $(ele).find(".shopping_product_list_5").find("input").val(); //数量
			//改变价格
			percents += parseInt($(ele).find(".shopping_product_list_2").text()) * num;
			//解决下js中浮点数的bug问题，因此建议浮点数的运算不要放在前台，这里是指粗略的解决了一下
			//通过上面获取到的数量*现价就是总的价格了
			var price = parseInt($(ele).find(".shopping_product_list_4").find("label").text().replace(".", "")) * num;
			prices += price;
			var prePrice = parseInt($(ele).find(".shopping_product_list_3").find("label").text().replace(".", "")) * num;
			prePrices += prePrice;
		});
		//修改到总价格的text中
		$("#product_integral").text(percents);
		$("#product_total").text(prices / 100);
		$("#product_save").text((prePrices - prices) / 100);
		return prices / 100;
}
jiage();

//删除单行
$("#myTableProduct").find(".shopping_product_list_6").children("a").click(function() {
	//刪除this当前的父类的父类
	$(this).parent().parent().remove();
	jiage();
});
//修改数量
//修改数量用change()的方法
$("#myTableProduct").find(".shopping_product_list_5").children("input").change(function() {
	//获取到当前的数量
	var value = $(this).val();
	//判断value的值是不是为空和是不是符合正则表达式
	if((value == "") || !(/^[0-9]*[1-9][0-9]*$/.test(value))) {
		//弹出一个弹出框提示数量不能为空且只能为正整数
		alert("数量不能为空，且只能为正整数");
		$(this).val(1);
	}
	//调用jiage()的方法
	var t = totalPrice();
	//提示
	alert("修改成功！，您的商品总金额是" + t + "元");
});

//清空购物车
//点击清空购物车的按钮
$("#removeAllProduct").click(function() {
	//使id为#myTableProduct的标签里的内容以及它的同辈元素都remove掉
	$("#myTableProduct").next().remove();
	$("#myTableProduct").remove();
	//删除之后再添加一个div标签提示你去挑选商品
	$(".shopping_list_border").append("<div class='empty_product'><div>您还没有挑选商品，<a href='index.html'>去挑选看看>></a></div></div>")
});
});