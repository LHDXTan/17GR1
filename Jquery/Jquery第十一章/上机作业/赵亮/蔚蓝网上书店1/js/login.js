	
	
	
	//为邮箱绑定事件
	$("#email").focus(femail).blur(bemail);
	//邮箱的事件
	function femail(){
		$("#email").removeClass("shi").addClass("di");
	}
	function bemail(){
		$("#email").removeClass("di").addClass("shi");
		var reg=/^[0-9]{6,10}@[a-zA-Z0-9]{2,3}(\.[A-Za-z]{2,3}){1,2}$/;
		if($("#email").val()==""){
			alert("Email地址或昵称不能为空");
			return false;
		}else if(!reg.test($("#email").val())){
			alert("邮箱格式不符合");
			return false;
			
		}else{
//			alert("邮箱格式正确");
			return true;
		}
	}
	//为密码绑定事件
	$("#pwd").focus(fmima).blur(bmima);
	//密码事件
	function fmima(){
		$("#pwd").removeClass("shi").addClass("di");
	}
	function bmima(){
		$("#pwd").removeClass("di").addClass("shi");
		var reg=/^[0-9a-zA-Z]{6,16}$/;
		if($("#pwd").val()==""){
			alert("密码不能为空");
			return false;
		}else if(!reg.test($("#pwd").val())){
			alert("密码必须是6-16位的");
			return false;
			
		}else{
//			alert("密码格式正确");
			return true;
		}
	}
	//跳转的判定
$("#loginForm").submit(function(){
	var t=true;
	if(!bemail()) t=false;
	if(!bmima()) t=false;
	return t;
})
