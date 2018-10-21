$(function(){
	$("#menu").hover(function(){
		$("#dd_menu_top_down").toggle();
	});
	$("#dd_close a").click(function(){
		$("#right").hide();
	});
	$(window).scroll(function(){
		var ht=$(this).scrollTop()+50;
		$("#right").css("top",ht);
	})
	
	$("#scroll_number li").not("#scroll_number li:eq(0)").removeClass("scroll_number_over");
	$("#scroll_number li:eq(0)").addClass("scroll_number_over");
	function luobo(){
		var stop=false;
		$("#scroll_number li").hover(function(){
			stop=true;
			$(this).removeClass().addClass("scroll_number_over");
			$(this).siblings().removeClass("scroll_number_over");
			var a=$(this).text();
			$("#scroll_img li:eq("+(a-1)+")").fadeIn().show();
			$("#scroll_img li:eq("+(a-1)+")").siblings().fadeOut().hide();
		},function(){
			stop=false;
		})
		
		var i=1;
	$(setInterval(function(){
		if(stop==true){
			return false;
		}
		if(i==1){
		$("#scroll_number li").not("#scroll_number li:eq(0)").removeClass("scroll_number_over");
		$("#scroll_number li:eq(0)").addClass("scroll_number_over");
		}
		if(i==4){
			i=0;
		}
		$("#scroll_number li").not("#scroll_number li:eq("+i+")").removeClass("scroll_number_over");
		$("#scroll_img li:eq("+i+")").show();
		$("#scroll_img li").not("#scroll_img li:eq("+i+")").hide();
		$("#scroll_number li:eq("+i+")").addClass("scroll_number_over");
		i++;
	},1000)) 
	}
	luobo();
	
	function gundong(){
		var mt=0;
		var stop=false;
		setInterval(function(){
			if(stop) return;
			$("#express").children("li").first().animate({"margin-top":mt--},0,function(){
			//	if(!$(this).is(":animated")){
				if((-mt)>$(this).height()){
					$(this).css({"margin-top":0}).appendTo($("#express"));
					mt=0;
				}
			//  }
			})
		},50)
		$("#express").hover(function(){
			stop=true;
		},function(){
			stop=false;
		})
	}
	gundong();
	
	$(".book img").mouseenter(function(){
	$(this).animate({"width":"110%"},"slow");
	})
	$(".book ul img").mouseleave(function(){
	$(this).animate({"width":"80%"},"slow");
	})
	
//	$(".tab ol li").mousemove(function(){
//	var ind=$(this).index();
//	$(".tab ol li:eq("+ind+")").css({"background":"rgb(255,255,255)","width":"118px","border-bottom":"none"});
//	$(".tab ol li:eq("+ind+")").siblings().css({"background":"rgb(239,239,239)","width":"118px","border-left":"1px solid rgb(204,204,204)","border-bottom":"1px solid rgb(204,204,204)","border-right":"none","border-top":"none"})
//	//$(".tab ul:eq("+ind+")").css({"display":"block","border-top":"none"});
//	//$(".tab ul").not(".tab ul:eq("+ind+")").children().hide();
//	//$(".tab ul:eq("+ind+")").siblings().css("display","none");
//	})
	$(".tab ol li:first-of-type").mousemove(function(){
	$(this).css({"background":"rgb(255,255,255)","width":"115px","border-bottom":"none"});
	$(".tab ol li:last-of-type").css({"background":"rgb(239,239,239)","width":"115px","border-left":"1px solid rgb(204,204,204)","border-bottom":"1px solid rgb(204,204,204)","border-right":"none","border-top":"none"})
	$(".tab ul:first-of-type").show();
	$(".tab ul:last-of-child").hide();
	})
	
	$(".tab ol li:last-of-type").mousemove(function(){
	$(this).css({"background":"rgb(255,255,255)","width":"115px","border-bottom":"none"});
	$(".tab ol li:first-of-type").css({"background":"rgb(239,239,239)","width":"115px","border-left":"1px solid rgb(204,204,204)","border-bottom":"1px solid rgb(204,204,204)","border-right":"none","border-top":"none"})
	$(".tab ul:first-of-type").hide();
	$(".tab ul:last-of-type").show();
	})
	
	 $(".tab ul li p").mouseenter(function(){
        $(this).next().show();
        $(this).hide();
        $(this).parent().siblings().children("p").show().end().children("dl").hide();
    })
	
})


