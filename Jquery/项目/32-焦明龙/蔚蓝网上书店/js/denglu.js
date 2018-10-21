$(function() {
	//邮箱校验
	$("#email").blur(function() {
		//获取到当前的Email
		var email = $(this).val();
		//Email的正则表达式
		var zz = /^[0-9a-zA-Z]{5,11}@[a-zA-Z]{2}(\.[a-zA-Z]{2,3}){1,2}$/;
		//如果为空
		if(email == "") {
			//弹出提示
			alert("邮箱不能为空");
			//邮箱格式不正确
		} else if(zz.test(email) == false) {
			alert("邮箱格式不正确");
		}
	});
	//密码校验
	$("#pwd").blur(function() {
		var pwd = $(this).val();
		var pp = /^[A-Za-z0-9]{6-16}$/;
		if(pwd == "") {
			alert("密码不能为空");
		} else if(pp.test(pwd) == false) {
			alert("密码必须是6-16位的数字和字母");
		}
	});
	//点击按钮
	$("#loginForm").submit(function() {
		//点击按钮选获取Email和pwd
		var email = $("#email").val();
		var pwd = $("#pwd").val();
		//再判断
		if(email == "") {
			alert("请输入Email地址或昵称");
			//如果为空返回false
			return false;
		}
		if(pwd == "") {
			alert("请输入密码");
			return false;
		}
		return true;
	});

	//提交按钮变色
	$("#btn").mouseover(function() {
		//当前的样式先清空在追加新的样式
		$(this).removeClass().addClass("login_btn_over");
	}).mouseout(function() {
		$(this).removeClass().addClass("login_btn_out");
	});
	//跳转注册页面
	$("#quick_register").mouseover(function() {
		//当前的样式先清空在追加新的样式
		$(this).removeClass().addClass("login_register_over");
	}).mouseout(function() {
		$(this).removeClass().addClass("login_register_out");
	}).click(function() {
		//点击跳转到窗口为register.html的页面
		window.location.href = "register.html";
	});

});