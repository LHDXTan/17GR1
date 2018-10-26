$(document).ready(function() {
	$("#registerBtn").click(function() {
		//邮箱
		//先用document.getElementById（）获取到Email的id
		var e = document.getElementById("email");
		//然后判断e如果为空
		if(e.validity.valueMissing == true) {
			//提示不能为空
			e.setCustomValidity("email不能为空");
			//Email不为空了就在判断Email的格式如果不正确
		} else if(e.validity.typeMismatch == true) {
			//提示格式不正确
			e.setCustomValidity("email的格式不正确");
		} else {
			//如果有其他的输入则就清空输入的内容
			e.setCustomValidity("");
		}
		//昵称
		var n = document.getElementById("nickName");
		if(n.validity.valueMissing == true) {
			n.setCustomValidity("昵称不能为空");
		} else if(n.validity.patternMismatch == true) {
			n.setCustomValidity("必须是4-20位的字母和数字");
		} else {
			n.setCustomValidity("");
		}
		//密码
		var pwd = document.getElementById("pwd");
		if(pwd.validity.valueMissing == true) {
			pwd.setCustomValidity("密码不能为空");
		} else if(pwd.validity.patternMismatch == true) {
			pwd.setCustomValidity("密码必须是6-20位的数字和字母");
		} else {
			pwd.setCustomValidity("");
		}
		//重新输入密码
		var repwd = document.getElementById("repwd");
		if(repwd.val() == pwd.val()) {
			repwd.setCustomValidity("");
		} else {
			repwd.setCustomValidity("两次输入的密码不一致");
		}

	});
	//提交按钮样式变化
	$("#registerBtn").mouseover(function() {
		//当鼠标放在提交按钮是获取的图片是images/register_btn_over.gif
		$(this).attr("src", "images/register_btn_over.gif");
	}).mouseout(function() {
		//当鼠标离开提交按钮是获取的图片是images/register_btn_out.gif
		$(this).attr("src", "images/register_btn_out.gif");
	});
	//地址
	var city = new Array();
	city['北京市'] = ['东城区', '西城区', '怀柔区', '海淀区', '朝阳区'];
	city['河南省'] = ['商丘市', '郑州市', '漯河市', '洛阳市', '周口市', '濮阳市'];
	city['江苏省'] = ['无锡市', '苏州市', '南京市'];
	city['上海市'] = ['黄浦区', '宝山区'];
	city['其他'] = ['其他'];
	//append()内部追加子节点
	$("#province").append(function() {
		//先使你的地址为空,然后再把你选的地址输入进去
		var html = "";
		//用for循环遍历出city
		for(var i in city) {
			//把获取的city放在html中
			html = html + "<option value=" + i + ">" + i + "</option>"
		}
		//返回html
		return $(html);
	});
	//change()改变域里的内容
	$("#province").change(function() {
		//$(this).val()获取当前的<option>标签
		var v = $(this).val();
		var html = "";
		//如果v==请选择省/城市"那光标就会出现在<option>请选择城市/地区</option>的标签中
		if(v == "请选择省/城市") {
			html = "<option>请选择城市/地区</option>";
			$("#city").html(html);
			return;
		}
		var citys = city[v];
		//用each（）方法便利出你选的city所对应的城市
		$.each(citys, function(i, n) {
			//把获取到的城市赋给html
			html = html + "<option value=" + n + ">" + n + "</option>";
		});
		$("#city").html(html);
	});

});