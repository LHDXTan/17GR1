
$(function(){
    //邮箱验证
    $("#email").focus(function(){
        $(this).removeClass().addClass("login_content_input login_content_input_Focus");
    }).blur(function(){
        $(this).removeClass().addClass("login_content_input");
    });
    
    
    
    //密码验证
    $("#pwd").focus(function(){
        $(this).removeClass().addClass("login_content_input login_content_input_Focus");
    }).blur(function(){
        $(this).removeClass().addClass("login_content_input");
    });
    
    
    
    //提交
    $("#loginForm").submit(function(){
        var a=$("#email").val();
        var b=$("#pwd").val();
        if(a==""){
            alert("请输入Email地址或昵称");
            return false;
        }
        
        if(b==""){
        	alert("密码不能为空");
        	return false;	
        }
        return true;
    });
    
    
    
    //变色          
    $("#btn").mouseover(function(){
        $(this).removeClass().addClass("login_btn_over");
    }).mouseout(function(){
        $(this).removeClass().addClass("login_btn_out");
    });
    
    
    
    
    
    //快速注册
    $("#quick_register").mouseover(function(){
        $(this).removeClass().addClass("login_register_over");
    }).mouseout(function(){
        $(this).removeClass().addClass("login_register_out");
    }).click(function(){
        window.location.href="register.html";
    });
    
    
    

});