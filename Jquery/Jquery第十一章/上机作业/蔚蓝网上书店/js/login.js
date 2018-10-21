$(function(){
	
	$(".login_content").find(".login_content_input").focus(function(){
		$(this).addClass("login_content_input_Focus");
	})
	$(".login_content").find(".login_content_input").blur(function(){
		$(this).removeClass("login_content_input_Focus");
	})
	
	$(".login_btn_out").click(function(){
		if($("#email").val()==""){
			alert("请输入Email地址或昵称");
			return false;
		}
		if($("#pwd").val()==""){
					alert("密码不能为空");
						return false;
			}
		
	})
	$("#quick_register").click(function(){
		window.location="register.html"	
	})
	
	
})