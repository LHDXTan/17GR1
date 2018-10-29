$(document).ready(function(){
	//表单验证
	$("#registerBtn").click(function(){
		
		var email = document.getElementById("email");
		if(email.validity.valueMissing==true){
			email.setCustomValidity("邮箱不可以为空");
		}
		if(email.validity.typeMismatch==true){
			email.setCustomValidity("邮箱格式不正确，例如cao@wen.qi");
		}else{
			email.setCustomValidity("");
		}
		var name =document.getElementById("nickName");
		if(name.validity.valueMissing==true){
			name.setCustomValidity("名字不可以为空");
		}
		if(name.validity.patternMismatch==true){
			name.setCustomValidity("名字必须是4~20位的数字或者字母");
		}else{
			email.setCustomValidity("");
		}
		var pwd=document.getElementById("pwd");
		if(pwd.validity.valueMissing==true){
			pwd.setCustomValidity("密码不可以为空")
		}
		if(pwd.validity.patternMismatch==true){
			pwd.setCustomValidity("密码必须是6~20位字母或者数字")
		}else{
			pwd.setCustomValidity("");
		}
		var repwd = document.getElementById("repwd");
		if(repwd.val()=pwd.val()){
			repwd.setCustomValidity("");
		}else{
			repwd.setCustomValidity("两次密码输入不一致");
		}		
	});
	//提交按钮样式变化
	$("#registerBtn").mouseover(function(){
		//鼠标事件 移入事件
		$(this).attr("src","images/register_btn_over.gif");
		}).mouseover(function(){
			$(this).attr("src","images/register_btn_out.gif");
		});
	//省市级联
	var cityList = new Array();
	cityList['北京市']=['朝阳区','东城区','西城区', '海淀区','宣武区','丰台区','怀柔','延庆','房山'];
	cityList['上海']=['宝山区','长宁区','丰贤区', '虹口区','黄浦区','青浦区','南汇区','徐汇区','卢湾区'];
	cityList['深圳']=['福田区', '罗湖区', '盐田区', '宝安区', '龙岗区', '南山区', '深圳周边'];
	cityList['广州']=['广州市','惠州市','汕头市','珠海市','佛山市','中山市','东莞市'];
	cityList['河南省']=['郑州市','周口市','洛阳市'];
	cityList['江苏省']=['南京市','无锡市','苏州市'];
	cityList['浙江省']=['杭州市','宁波市','温州市'];
	$("#province").append(function(){
		//添加
		var html =" ";
		for(var i in cityList){
			html +="<option value="+i+">"+i+"</option>"
		}
		return $(html);
	});
	$("#province").change(function(){
		//内容发生改变执行
		var v = $(this).val();
		var html ="";
		if(v=="请选择省/城市"){
			html="<option>请选择城市/地区</option>"
			$("#city").html(html);
			return;
		}
		var citys =cityList[v];
		$.each(citys,function(i,n){
			html +="<option value="+n+">"+n+"</option>"
		});
		$("#city").html(html);
	});





});