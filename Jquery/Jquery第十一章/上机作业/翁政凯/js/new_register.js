$(document).ready(function(){
	//问题：valueMissing、setCustomValidity、patternMismatch、typeMismatch
	$("#registerBtn").click(function(){
		var emailname = document.getElementById("email");
		if(emailname.validity.valueMissing == true){
			emailname.setCustomValidity("Email不能为空");
		}else if(emailname.validity.typeMismatch == true){
//			 \w+@\w+(\.[a-zA-Z]{2,3}){1,2};
			emailname.setCustomValidity("邮箱格式不正确,必须包含@和.");
		}else{
			emailname.setCustomValidity("");
		}
		
		var username = document.getElementById("nickName");
		if(username.validity.valueMissing == true){
			username.setCustomValidity("昵称不能为空");
		}else if(username.validity.patternMismatch == true){
			username.setCustomValidity("用户名必须是4~20位的英文字母和数字");
		}else{
			username.setCustomValidity("");
		}
		
		var pass = document.getElementById("pwd");
		if(pass.validity.valueMissing == true){
			pass.setCustomValidity("密码不能为空");
		}else if(pass.validity.patternMismatch == true){
			pass.setCustomValidity("密码必须是6~20位的英文字母和数字");
		}else{
			pass.setCustomValidity("");
		}
		
		var repass = document.getElementById("repwd");
		if(repass.validity.valueMissing == true){
			repass.setCustomValidity("密码不能为空");
		}else if(repass.value != pass.value){
			repass.setCustomValidity("两次输入密码不一样。");
		}else{
			repass.setCustomValidity("");
		}
	});
	
	$("#registerBtn").hover(function(){
		$(this).attr("src","images/register_btn_over.gif");
	},function(){
		$(this).attr("src","images/register_btn_out.gif");
	});
	
	//代码不懂 ， i,参数n. append renturn.
	var as = new Array();
	as['重庆市'] = ['朝阳区','东城区','西城区', '海淀区','怀柔区','延庆区','房山区'];
	as['杭州市'] = ['朝阳区','东城区','怀柔区','延庆区','房山区'];
	as['北京市'] = ['朝阳区','东城区','西城区', '海淀区','宣武区','丰台区','怀柔区','延庆区','房山区'];
	as['深圳市'] = ['海淀区','宣武区','丰台区','怀柔区','延庆区','房山区'];
	as['郑州市'] = ['朝阳区','房山区'];
	as['其他'] = ['其他'];
	$("#province").append(function(){
		var s = "";
		for(var i in as){
			s += "<option value="+i+">"+i+"</option>";
		}
		return $(s);
	});
	$("#province").change(function(){
        var a = $(this).val();
        var b= "";
        if(a == "请选择省/城市"){
            b = "<option>请选择城市/地区</option>";
            $("#city").html(b);
            return;
        }
        var citys =as[a];
        $.each(citys,function(i,n){
            html += "<option value="+n+">"+n+"</option>";
        });
        $("#city").html(html);
    });
});