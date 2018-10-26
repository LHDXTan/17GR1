
$(function($){
    //打开一个广告窗口 
    //设置广告窗口的大小
   window.open('open.html','','top=0,left=200,width=500,height=327,scrollbars=0,resizable=0');
    //随滚动条滚动的可关闭广告窗口
    $(window).scroll(function(){
    //随着滚动条滚动而滚动
    var st = $(this).scrollTop()+50;
    //调用css里面的样式
        $("#right").css("top",st);
    });
    //鼠标事件 
    $("#right").find("a").click(function(){
    //将广告隐藏
        $("#right").hide();
    });
    //轮换图片
    function changeImg(){
    	//定义
        var index=0;
        var stop=false;
        var $li=$("#content").find("#scroll_img").children("li");
        var $page = $("#content").find("#scroll_number").children("li");
        $page.eq(index).addClass("scroll_number_over").stop(true,true).siblings().removeClass("scroll_number_over");
       	//鼠标事件 鼠标滑入滑出
       	$page.mouseover(function(){
            stop=true;
            index=$page.index($(this));
            $li.eq(index).stop(true,true).fadeIn().siblings().fadeOut();
            $(this).addClass("scroll_number_over").stop(true,true).siblings().removeClass("scroll_number_over");
        }).mouseout(function(){
            stop=false;
        });
        setInterval(function(){
            if(stop) return;
            index++;
            if(index>=$li.length){
                index=0;
            }
            $li.eq(index).stop(true,true).fadeIn().siblings().fadeOut();
            $page.eq(index).addClass("scroll_number_over").stop(true,true).siblings().removeClass("scroll_number_over");
        },3000);
    }
    //改变图片
    changeImg();
    $(".book ul img").mouseenter(function(){
        $(this).animate({width:"110%"},"slow");
    });
    $(".book ul img").mouseleave(function(){
        $(this).animate({width:"80%"},"slow");
    });

    //图书畅销榜切换
    //鼠标事件
    $(".tab ol li:first-of-type").mouseover(function(){
       //调用css动画
       	$(".tab ol li:last-of-type").css({"background":"#efefef","border-left":"1px solid #cccccc","border-bottom":"1px solid #ccc","width":"118px"});
        $(this).css({"width":"119px","background":"#ffffff","border":"none"});
        //显示
        $(".tab ul:first-of-type").show();
        //隐藏 
        $(".tab ul:last-of-type").hide();
    });
    //鼠标事件
    $(".tab ol li:last-of-type").mouseover(function(){
        $(".tab ol li:first-of-type").css({"background":"#efefef","border-right":"1px solid #cccccc","border-bottom":"1px solid #ccc","width":"118px"});
        $(this).css({"width":"119px","background":"#ffffff","border":"none"});
        $(".tab ul:first-of-type").hide();
        $(".tab ul:last-of-type").show();
    });
    $(".tab ul li p").mouseenter(function(){
        $(this).next().show();
        $(this).hide();
        $(this).parent().siblings().children("p").show().end().children("dl").hide();
    })
    //书讯快递循环垂直向上滚动
    function movedome(){
        var marginTop=0;
        var stop=false;
        var interval=setInterval(function(){
            if(stop) return;
            $("#express").children("li").first().animate({"margin-top":marginTop--},0,function(){
                var $first=$(this);
                if(!$first.is(":animated")){
                    if((-marginTop)>$first.height()){
                        $first.css({"margin-top":0}).appendTo($("#express"));
                        marginTop=0;
                    }
                }
            });
        },50);
        
        //书讯快递
        $("#express").mouseover(function(){
            stop=true;
        }).mouseout(function(){
            stop=false;
        });
    }
    movedome();
});
