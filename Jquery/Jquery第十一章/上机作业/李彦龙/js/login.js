
$(function($){
 
    $("#email").focus(function(){
        $(this).removeClass().addClass("login_content_input login_content_input_Focus");
    }).blur(function(){
        $(this).removeClass().addClass("login_content_input");
    });
    
    $("#pwd").focus(function(){
        $(this).removeClass().addClass("login_content_input login_content_input_Focus");
    }).blur(function(){
        $(this).removeClass().addClass("login_content_input");
    });
    
    $("#loginForm").click(function(){
        var email=document.getElementById("email");
        为空");if(email.validity.valueMissing==true){
            email.setCustomValidity("昵称或地址不能
        }
        else if(email.validity.patternMismatch==true){
            email.setCustomValidity("昵称或地址必须是4~20位的英文和数字");
        }
        else{
            email.setCustomValidity("");
        }
          var pwd=document.getElementById("pwd");
        if(pwd.validity.valueMissing==true){
            pwd.setCustomValidity("密码不能为空");
        }
        else if(pwd.validity.patternMismatch==true){
            pwd.setCustomValidity("密码必须是6~20位的英文和数字");
        }
        else{
            pwd.setCustomValidity("");
        }
    });
    
    $("#btn").mouseover(function(){
        $(this).removeClass().addClass("login_btn_over");
    }).mouseout(function(){
        $(this).removeClass().addClass("login_btn_out");
    });
   
    $("#quick_register").mouseover(function(){
        $(this).removeClass().addClass("login_zhuce_over");
    }).mouseout(function(){
        $(this).removeClass().addClass("login_zhuce_out");
    }).click(function(){
        window.location.href="zhuce.html";
    });
});