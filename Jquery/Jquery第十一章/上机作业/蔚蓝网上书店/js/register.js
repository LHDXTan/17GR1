$(document).ready(function() {
	$("#registerBtn").click(function() {
		//名字
		var uName = document.getElementById("nickName");
		if(uName.validity.valueMissing == true) {
			uName.setCustomValidity("昵称不能为空")
		} else if(uName.validity.patternMismatch == true) {
			uName.setCustomValidity("昵称必须是4-20位数字、字母")
		} else {
			uName.setCustomValidity("")
		};
		//密码
		var pwd = document.getElementById("pwd");
		if(pwd.validity.valueMissing == true) {
			pwd.setCustomValidity("密码不能为空")
		} else if(pwd.validity.patternMismatch == true) {
			pwd.setCustomValidity("密码必须是6-20位数字、字母")
		} else {
			pwd.setCustomValidity("")
		};
		//确认密码
		var repwd = document.getElementById("repwd");
		if(pwd.val() == repwd.val()) {
			repwd.setCustomValidity("")
		} else {
			repwd.setCustomValidity("两次密码不一致");
		}
	});
	//提交按钮
	$("#registerBtn").mousemove(function() {
		$(this).attr("src", "images/register_btn_over.gif");

	}).mouseout(function() {
		$(this).attr("src", "images/register_btn_out.gif");
	});
	//二级联动
	var cityList = new Array();
	cityList['河南省'] = ['商丘市', '周口市', '漯河市', '开封市', '郑州市'];
	cityList['广东省'] = ['广州市', '惠州市', '珠海市', '佛山市', '中山市', '东莞市'];
	$("#province").append(function() {
		var html = "";
		for(var i in cityList) {
			html += "<option value="+i+">"+i+"</option>"
		}
		return $(html);
	});
	$("#province").change(function(){
		var v=$(this).val();
		var html="";
		if(v=="请选择省/城市"){
			html="<option>请选择城市/地区</option>";
			$("#city").html(html);
			return;
		}
		var citys=cityList[v];
		$.each(citys,function(i,n){
			html+="<option value="+n+">"+n+"</option>"
		});
		$("#city").html(html);
	});

});
