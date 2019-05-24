//打开字滑入效果
window.onload = function(){
	$(".connect p").eq(0).animate({"left":"0%"}, 600);
	$(".connect p").eq(1).animate({"left":"0%"}, 400);
};
//jquery.validate表单验证
$(document).ready(function(){
	//登陆表单验证
	$("#loginForm").validate({
		rules:{
			username:{
				required:true,//必填
				minlength:2, //最少6个字符
				maxlength:32,//最多20个字符
			},
			password:{
				required:true,
				minlength:3, 
				maxlength:32,
			},
		},
		//错误信息提示
		messages:{
			username:{
				required:"必须填写用户名",
				minlength:"用户名至少为2个字符",
				maxlength:"用户名至多为32个字符",
				remote: "用户名已存在",
			},
			password:{
				required:"必须填写密码",
				minlength:"密码至少为3个字符",
				maxlength:"密码至多为32个字符",
			},
		},

	});
	//注册表单验证
	$("#registerForm").validate({
		rules:{
			username:{
				required:true,//必填
				minlength:2, //最少6个字符
				maxlength:32,//最多20个字符
				
			},
			password:{
				required:true,
				minlength:3, 
				maxlength:32,
			},
			email:{
				required:true,
				email:true,
			},
			confirm_password:{
				required:true,
				minlength:3,
				equalTo:'.password'
			},
			p_number:{
				required:true,
				/*phone_number:true,//自定义的规则*/				
				digits:true,//整数
			},
			tech_area:{
				required:true,
				minlength:3, 
				maxlength:32,
			},
			p_day:{
				required:true,
				date:true,
			},
			p_referenceNumber:{
				required:true,
				minlength:3, 
				maxlength:32,
			},
			p_name:{
				required:true,
				minlength:3, 
				maxlength:32,
			},
			
			
		},
		//错误信息提示
		messages:{
			username:{
				required:"必须填写用户名",
				minlength:"用户名至少为1个字符",
				maxlength:"用户名至多为32个字符",
				
			},
			password:{
				required:"必须填写密码",
				minlength:"密码至少为1个字符",
				maxlength:"密码至多为32个字符",
			},
			email:{
				required:"请输入邮箱地址",
				email: "请输入正确的email地址",
			},
			confirm_password:{
				required: "请再次输入密码",
				minlength: "确认密码不能少于3个字符",
				equalTo: "两次输入密码不一致",//与另一个元素相同
			},
			p_number:{
				required:"请输入平台编号",
				digits:"请输入正确的平台编号",
			},
			p_name:{
				required:"请输入平台名称",
				minlength:"名称至少为3个字符",
				maxlength:"名称至多为32个字符",
			},
			p_day:{
				required:"请输入批准年月",
				date: "请输入正确的批准年月格式",
			},
			p_referenceNumber:{
				required:"请输入技术文号",
				minlength:"技术文号至少为3个字符",
				maxlength:"技术文号至多为32个字符",
			},
			tech_area:{
				required:"请输入技术领域",
				minlength:"名称至少为3个字符",
				maxlength:"名称至多为32个字符",
			},
		
			
		
		},
	});
	
	//添加自定义验证规则
	/*jQuery.validator.addMethod("phone_number", function(value, element) { 
		var length = value.length; 
		var phone_number = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/ 
		return this.optional(element) || (length == 11 && phone_number.test(value)); 
	}, "手机号码格式错误"); */
});
