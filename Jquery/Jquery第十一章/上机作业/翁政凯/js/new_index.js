$(document).ready(function(){
	//弹出新窗口
	window.open('open.html','广告','top=0,left=200,width=500,height=327,scrollbars=0,resizable=0');
	
	$("#dd_close").click(function() {
		$("#right").hide();
	});
	
	//滚动窗口相加。
	$(window).scroll(function(){
        var st = $(this).scrollTop()+50;
        $("#right").css("top",st);
    });
    
    //图片动画
	$(".book ul img").hover(function(){
		$(this).animate({width:"110%"},"slow");
	},function(){
		$(this).animate({width:"80%"},"slow");
	});
	
	//轮播图
	var a = ["images/scroll-01.jpg" ,"images/scroll-02.jpg" ,"images/scroll-03.jpg" ,"images/scroll-04.jpg" ];
	var s = 0;
	var i = 0;
	//轮播图-->鼠标轮播。
	$("#scroll_number li").mouseenter(function(){
		var k = $(this).html();
		$("#scroll_img li img").first().attr("src",a[k-1]);
		$(this).addClass("scroll_number_over").siblings().removeClass("scroll_number_over");;
		s=1;
	}).mouseleave(function(){
		s=0;
	});
	//轮播图-->自动轮播
	setInterval(function(){
	if(s==0){
		$("#scroll_img li img").first().attr("src",a[i]);
		$("#scroll_number li:eq("+i+")").addClass("scroll_number_over").siblings().removeClass("scroll_number_over");
		i++;
		if(i==4){i=0};
		}
	},1500);
	
	//图书列表-->畅销榜
	$(".tab ol li:first-of-type").mouseover(function(){
		$(".tab ol li:last-of-type").css({"background":"#efefef","border-left":"1px solid #cccccc","border-bottom":"1px solid #ccc","width":"118px"});
        $(this).css({"width":"119px","background":"#ffffff","border":"none"});
		$(".tab ul:first-of-type").show();
		$(".tab ul:last-of-type").hide();
	});
	
	//图书列表-->新书榜
	$(".tab ol li:last-of-type").mouseover(function(){
        $(".tab ol li:first-of-type").css({"background":"#efefef","border-right":"1px solid #cccccc","border-bottom":"1px solid #ccc","width":"118px"});
        $(this).css({"width":"119px","background":"#ffffff","border":"none"});
        $(".tab ul:first-of-type").hide();
        $(".tab ul:last-of-type").show();
    });
    
    //图书列表
    $(".tab ul li p").mouseenter(function(){
    	$(this).next().show();
    	$(this).hide();
    	$(this).parent().siblings().children("p").show().end().children("dl").hide();
    });
    
    //书讯快递 
    function ss(){
        var sq=0;//高度
        var sd=false;//
        var setd = setInterval(function(){
            if(sd) return; //返回sd,控制动画。
            $("#express").children("li").first().animate({"margin-top":sq--},0,function(){
                var th=$(this);
                if(!th.is(":animated")){ //:animated
                    if((-sq)>th.height()){
                        th.css({"margin-top":0}).appendTo($("#express"));
                        sq=0;
                    }
                }
            });
        },50);
        //书讯快递，鼠标事件
        $("#express").hover(function(){
    		sd = true;
   		},function(){
    		sd = false;
    	});
    }
    ss();
});
    			
    			
	   
