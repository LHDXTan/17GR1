$(function($){
    //打开一个广告窗口
   window.open('open.html','','top=0,left=200,width=500,height=327,scrollbars=0,resizable=0');
    //随滚动条滚动的可关闭广告窗口
    $(window).scroll(function(){
        var st = $(this).scrollTop()+50;
        $("#right").css("top",st);
    });
    $("#right").find("a").click(function(){
        $("#right").hide();
    });
    //轮换图片
    function changeImg(){
        var index=0;
        var stop=false;
        var $li=$("#content").find("#scroll_img").children("li");
        var $page = $("#content").find("#scroll_number").children("li");
        $page.eq(index).addClass("scroll_number_over").stop(true,true).siblings().removeClass("scroll_number_over");
        //index当前对象 addclass添加样式 stop停止 ，siblings()查找出了自己其他的同辈元素，
//      removeClass删除除了自己其他的样式
        $page.mouseover(function(){
//      	鼠标移入事件
            stop=true;
            index=$page.index($(this));
//          根据下标数字找到相对于的图片
            $li.eq(index).stop(true,true).fadeIn().siblings().fadeOut();
//          fadeIN淡入 fadeOut淡出 siblings()查找出了自己其他的同辈元素，
            $(this).addClass("scroll_number_over").stop(true,true).siblings().removeClass("scroll_number_over");
//      siblings()查找出了自己其他的同辈元素，
//      removeClass删除除了自己其他的样式
        }).mouseout(function(){
//      	鼠标移入移除事件
            stop=false;
        });
        setInterval(function(){
        	//定时器
            if(stop) return;
            index++;
//          下标
            if(index>=$li.length){
                index=0;
            }
            $li.eq(index).stop(true,true).fadeIn().siblings().fadeOut();
            //eq当前对象
            
            $page.eq(index).addClass("scroll_number_over").stop(true,true).siblings().removeClass("scroll_number_over");
        },3000);
    }
    changeImg();
    //执行这个方法

//电子图书放大放小时间
    $(".book ul img").mouseenter(function(){
    	            //鼠标移入事件
        $(this).animate({width:"110%"},"slow");
    });
    $(".book ul img").mouseleave(function(){
        $(this).animate({width:"80%"},"slow");
        //animate自定义动画
    });




    //图书畅销榜切换
    $(".tab ol li:first-of-type").mouseover(function(){
    	//鼠标移入事件
        $(".tab ol li:last-of-type").css({"background":"#efefef","border-left":"1px solid #cccccc","border-bottom":"1px solid #ccc","width":"118px"});
        $(this).css({"width":"119px","background":"#ffffff","border":"none"});
        $(".tab ul:first-of-type").show();
       //显示图书效果
       $(".tab ul:last-of-type").hide();
       //进行隐藏
    });
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
// 查找父辈,删除除了自己的同辈元素children查找儿子 ,end最近一次恢复过来。
    })
    
    
    
    //书讯快递循环垂直向上滚动
    function movedome(){
        var marginTop=0;
        var stop=false;
        var interval=setInterval(function(){
//      	定时器
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
        $("#express").mouseover(function(){
            stop=true;
        }).mouseout(function(){
            stop=false;
        });
    }
    movedome();
});
