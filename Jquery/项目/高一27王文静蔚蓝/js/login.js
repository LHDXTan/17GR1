$(function(){
//邮箱验证
$("#email").blur(function(){
var email=$(this).val();
var reg =/^[0-9a-zA-Z]{8,10}@[a-zA-Z]{2}(\.[a-zA-Z]{2,3}){1,2}$/;
if(email==""){
	alert("邮箱不能为空");
}else if(reg.test(email)==false){
	alert("邮箱格式不正确");
}else{
	alert("邮箱正确");
}
});
//密码验证
$("#pwd").blur(function(){
var miam=$(this).val();
if(miam==""){
	alert("密码不能为空");
}
});
//点击登陆
    $("#loginForm").submit(function(){
        var email=$("#email").val();
        var pwd=$("#pwd").val();
        if(email==""){
            alert("请输入Email地址或昵称");
            return false;
        }
        if(pwd==""){
            alert("请输入密码");
            return false;
        }
        return true;
    });
//点击变色
$("#btn").mouseover(function(){
	$(this).removeClass().addClass("login_btn_over");
});
$("#btn").mouseout(function(){
	$(this).removeClass().addClass("login_btn_out");
})
//点击快速登陆
 $("#quick_register").mouseover(function(){
        $(this).removeClass().addClass("login_register_over");
    }).mouseout(function(){
        $(this).removeClass().addClass("login_register_out");
    }).click(function(){
        window.location.href="register.html";
    });


})