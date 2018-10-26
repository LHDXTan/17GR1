$(function(){
	//点击登录时验证。
	$("form").submit(function(){
		var emailname = $("#email");
		var prass = $("#pwd");
		var t = true;
		if(emailname.val() == "" && prass.val() == ""){
			alert("email和密码不能为空！")
			t=false;
		}else if(!s2()==true & !s1()==true){
			alert("规则不符合");
			t=false;
		}
		return t;
	});
	$("#email,#pwd").focus(function(){
		$(this).addClass("sd");
	});
	
	$("#email").blur(s1);
	$("#pwd").blur(s2);
	//验证邮箱
	function s1(){
			var reg = /^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/;
			$("#email").removeClass("sd");
			var emailname = $("#email");
			if(emailname.val() == ""){
				alert("email不能为空！");
				return false;
			}else if(emailname.val() != reg){
				return false;
			}
			return true;
	}
	//验证密码。
	function s2(){		
			var reg = /^[a-zA-Z0-9]{6,20}$/;
			$("#pwd").removeClass("sd");
			var emailname = $("#email");
			var prass = $("#pwd");
			if(prass.val() == ""){
				alert("密码不能为空！");
				return false;
			}else if(prass.val() != reg){
				return false;
			}
			return true;
	}
});
