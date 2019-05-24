<%@page import="java.util.List"%>
<%@page import="oracle.UserException"%>
<%@page import="Dao.UserDaoImpl"%>
<%@page import="model.User"%>
<%@ page import="oracle.ValidateUtil" %>
<%@page import="Dao.IUserDao"%>
<%@page import="oracle.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选课情况</title>
<link href="css/style2.css" rel="stylesheet" type="text/css"/>
<link href="css/font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="css/layui/css/layui.css" rel="stylesheet"  media="all">
</head>


<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin" >
  <div class="layui-header" style="height:60px">
    <div class="layui-logo" style="font-size:20px">课程信息管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a style="font-size:20px" href="info.jsp">首页</a></li>
       <li class="layui-nav-item"><a style="font-size:20px" href="course.jsp">课程信息</a></li>
       <li class="layui-nav-item"><a style="font-size:20px" href="s_info.jsp">学生信息</a></li>
       <li class="layui-nav-item"><a style="font-size:20px" href="teacher.jsp">老师信息</a></li>
        <li class="layui-nav-item"><a style="font-size:20px" href="u_info.jsp">用户信息</a></li>
    </ul> 
   
    <ul class="layui-nav layui-layout-right">
      <!-- <li class="layui-nav-item">
       <li  style="float:right" class="layui-nav-item">
    <a href="" style="font-size:20px">个人中心<span class="layui-badge-dot"></span></a>
  </li> -->
   <li  style="float:right"class="layui-nav-item" lay-unselect="">
    <a href="javascript:;" style="font-size:20px"><img src="../images/person.jpg" class="layui-nav-img">个人中心</a>
    <dl class="layui-nav-child">
      <dd><a href="myself.jsp" style="font-size:20px">修改资料</a></dd>
      <dd><a href="Loginout.jsp" style="font-size:20px">退出登录</a></dd>
       </dl>
       </li>
       </ul>
        </div>
 <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll" >
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;" style="height:50px;font-size:20px;">课程信息操作</a>
          <dl class="layui-nav-child">
            <dd><a href="course.jsp" style="height:50px;font-size:20px;">课程信息查看</a></dd>
          </dl>
        </li>
        <!-- <li class="layui-nav-item"><a href="">云市场</a></li> -->
      </ul>
    </div>
  </div>
   
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="margin-left:10px;margin-top:10px;">
   <span class="layui-breadcrumb">
     <a href="u_info.jsp">用户信息</a>
     <a><cite>添加用户</cite></a>
   </span>
       </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>添加用户</legend>
    </fieldset>
  <%--   <%    
     String error=(String)session.getAttribute("error2");
       if(error==null)
       {
    	   error="";
           
       }
       session.putValue("error2", "");
%> --%>
<div style="margin-left:50px;margin-right:30px;margin-top:100px;"> 
    <form action="do_add_u.jsp" onsubmit="return tijiao()"> <!-- class="layui-form" 中限制了radio的样式 -->
   <%--  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span style="color:blue; font-family:楷体 ;font-size:20px"><%=error %></span> --%>
	<table  class="layui-table" style="text-align:center">
	     <tr>
		   <td>
		   用户名：
		   </td>
		   <td>
		   <input id="username" name="username"   onfocus="userGetFocus()" onblur="userLoseFocus()">
		  <span id="user_span"></span><br/>
		  <span style="color:red"><%=ValidateUtil.showError(request,"Username")
					 %></span>
		   </td>
		</tr>
		<tr>
		   <td>
		   密码：
		   </td>
		   <td>
		   <input  name="password" id="password" onfocus="passGetFocus()" onblur="passLoseFocus()">
		  <span id="pass_span"></span><br/>
		   </td>
		</tr>
		<tr>
		   <td>
		   用户类别：
		   </td>
		   <td>
		   <input  type="radio" id="u_type" name="u_type" value="老师" onfocus="u_typeGetFocus()" onblur="u_typeLoseFocus()"/>老师
		   <input  type="radio" id="u_type"  name="u_type" value="学生" onfocus="u_typeGetFocus()" onblur="u_typeLoseFocus()"/>学生
		   <span id="u_type_span"></span><br/>
		   </td>
		</tr>
		<tr>
		   <td>
		学号/工号
		   </td>
		   <td>
		   <input  id="st_no" name="st_no" onfocus="st_noGetFocus()" onblur="st_noLoseFocus()"/>
		   <span id="st_no_span"></span><br/>
		   </td>
		</tr>
		<tr>
		   <td>
		姓名
		   </td>
		   <td>
		   <input  id="name" name="name" onfocus="nameGetFocus()" onblur="nameLoseFocus()"/>
		  <span id="name_span"></span><br/>
		   </td>
		</tr>
			<tr>
		   <td>
		 性别
		   </td>
		   <td colspan="2">
		   <input  type="radio" id="sex" name="sex" value="男" onfocus="sexGetFocus()" onblur="sexLoseFocus()"/>男
		   <input  type="radio" id="sex" name="sex" value="女" onfocus="sexGetFocus()" onblur="sexLoseFocus()"/>女
		   <span id="sex_span"></span><br/>
		   </td>
		</tr>
		
		
			<tr>
		   <td>
		   年龄：
		   </td>
		   <td>
		   <input id="age" name="age" onfocus="ageGetFocus()" onblur="ageLoseFocus()"/>
		  <span id="age_span"></span><br/>
		   </td>
		</tr>

			<tr>
		   <td>
		   院系：
		   </td>
		   <td>
		   <input id="dept" name="dept" onfocus="deptGetFocus()" onblur="deptLoseFocus()"/>
		   <span id="dept_span"></span><br/>
		   </td>
		</tr>
	</table>
	<div class="layui-form-item">
    <div class="layui-input-block">
		<button class="layui-btn" lay-submit lay-filter="formDemo"style="width:150px">添加</button>
        <button type="reset"  class="layui-btn layui-btn-primary"style="width:150px">重置</button>
    </div>
  </div>
  </form>
  </div>
  
<div class="layui-footer">
  <p style="text-align:center"> &copy;&nbsp;软件工程 某某学生制作&nbsp;|&nbsp;<a href="#" style="font-size:16px; color:red">联系管理员</a></p>
  </div>
</div>
<% 
IUserDao userDao=DaoFactory.getDaoImpl();
List<User> users =userDao.find_users_u();
int i=0;
for(User user :users)
{
	i++;
%>
<input type="hidden" name="users" value="<%=user.getUsername()%>"></input>
<%
}
%>
<input type="hidden" id="length" name="length" value="<%=i%>"></input>
<script language="javascript" type="text/javascript">
//准备好body中的内容
var le=document.getElementById("length").value;
var no= new Array(le);
no=document.getElementsByName("users");
var flag=false; 
//使用用户聚焦的函数
function userGetFocus(){
//获取userspan的Id
var spanId=document.getElementById("user_span");
//给span中添加内容
spanId.innerHTML="<font color='blue' size='2'>请输入3~19位的用户名</font>"
}
//使用用户失去焦点的函数
function userLoseFocus(){
//这里先获取input文本框 的内容

var user_Name=document.getElementById("username");
var len =user_Name.value.length;
for (i=0;i<le;i++)
{
  if(no[i].value==(user_Name.value))
   {
      flag=false;
    }
}
if(len==0){
var spanId=document.getElementById("user_span");
spanId.innerHTML="<font color='red' size='2'>*请输入3~19位的用户名</font>";
return false;
}else if(len<3 ||len>19){
var spanId=document.getElementById("user_span");
spanId.innerHTML="<font color='red' size='2'>*您输入的用户名不符合规范，请重新输入！</font>";
return false;
}else if(!flag)
{
	var spanId=document.getElementById("user_span");
	spanId.innerHTML="<font color='red' size='2'>*用户名已存在，请重新输入！</font>";
	flag=true;
	return false;
	
	
}else{

var spanId=document.getElementById("user_span");
spanId.innerHTML="<font color='blue' size='2'>您输入的用户名格式正确！</font>";
return true;
     }

  
}//函数

function u_typeGetFocus(){
	//获取userspan的Id
	var u_typeId=document.getElementById("u_type_span");
	//给span中添加内容
	u_typeId.innerHTML="<font color='blue' size='2'>请选择老师/学生（必选）</font>"
	}
	//使用用户失去焦点的函数
	function u_typeLoseFocus(){
	//这里先获取input文本框 的内容

	var u_type=document.getElementById("u_type");
	
	var len1 =u_type.value.length;
	var singal1=0,singal2=0;
	var checks = document.getElementsByName("u_type");
	for (var i = 0; i < checks.length; i++) {
		if (checks[i].checked == false) {
			singal1=1;
		}
		else
			{
			singal2=1;
			}
	}
	if(singal2==1&&singal1==1){
		
		var u_typeId=document.getElementById("u_type_span");
		u_typeId.innerHTML="<font color='blue' size='2'>合法选择</font>";
		return true;
	}else{
		var u_typeId=document.getElementById("u_type_span");
		u_typeId.innerHTML="<font color='red' size='2'>*请选择老师/学生（必选）</font>";	
		return false;
	     }
	
	

	  
	}//函数

	 function sexGetFocus(){
		//获取userspan的Id
		var sexId=document.getElementById("sex_span");
		//给span中添加内容
		sexId.innerHTML="<font color='blue' size='2'>请选择男/女（必选）</font>"
		}
		//使用用户失去焦点的函数
		function sexLoseFocus(){
		//这里先获取input文本框 的内容

		var sex=document.getElementById("sex");
		var len2 =sex.value.length;
		var singal1=0,singal2=0;
		var checks = document.getElementsByName("sex");
		for (var i = 0; i < checks.length; i++) {
			if (checks[i].checked == false) {
				singal1=1;
			}
			else
				{
				singal2=1;
				}
		}
		if(singal2==1&&singal1==1){
			var sexId=document.getElementById("sex_span");
			sexId.innerHTML="<font color='blue' size='2'>合法选择</font>";
			return true;
		
		}else{
			var sexId=document.getElementById("sex_span");
			sexId.innerHTML="<font color='red' size='2'>*请选择男/女（必选）</font>";
			return false;
		     }

		  
		}//函数 
		var st_noNum = /[0-9]{8}$/;
		
		function st_noGetFocus(){
			//获取userspan的Id
			var spanId=document.getElementById("st_no_span");
			//给span中添加内容
			spanId.innerHTML="<font color='blue' size='2'>请输入8位数字的工号/学号</font>"
			}
		function st_noLoseFocus(){
			//这里先获取input文本框 的内容

			var st_no=document.getElementById("st_no");
			var len =st_no.value.length;
			if(len==0||len!=8){
			var spanId=document.getElementById("st_no_span");
			spanId.innerHTML="<font color='red' size='2'>*请输入8位数字的工号/学号</font>";
			return false;
			}else if(!(st_noNum.test(st_no.value)))
					{
			        var spanId=document.getElementById("st_no_span");
			        spanId.innerHTML="<font color='red' size='2'>*您输入的工号/学号不符合规范(8位数字)，请重新输入！</font>";
			         return false;	
			}else{
			var spanId=document.getElementById("st_no_span");
			spanId.innerHTML="<font color='blue' size='2'>您输入的工号/学号格式正确！</font>";
			return true;
			     }

			  
			}//函数
			
			
			var ageNum = /[0-9]{2}$/;
			
			function ageGetFocus(){
				//获取userspan的Id
				var spanId=document.getElementById("age_span");
				//给span中添加内容
				spanId.innerHTML="<font color='blue' size='2'>年龄大于15岁</font>"
				}
			function ageLoseFocus(){
				//这里先获取input文本框 的内容

				var age=document.getElementById("age");
				var len =age.value.lenth;
				if(len<0||age.value<15){
				var spanId=document.getElementById("age_span");
				spanId.innerHTML="<font color='red' size='2'>*年龄大于15岁</font>";
				return false;
				}else if(!ageNum.test(age.value)){
				var spanId=document.getElementById("age_span");
				spanId.innerHTML="<font color='red' size='2'>*您输入的年龄信息不符合规范(2位数字)，请重新输入！</font>";
				return false;
				}else{
				var spanId=document.getElementById("age_span");
				spanId.innerHTML="<font color='blue' size='2'>您输入的年龄信息格式正确！</font>";
				return true;
				     }

				  
				}//函数

				
				
				function nameGetFocus(){
					//获取userspan的Id
					var spanId=document.getElementById("name_span");
					//给span中添加内容
					spanId.innerHTML="<font color='blue' size='2'>请输入2-19位的姓名信息</font>"
					}
				function nameLoseFocus(){
					//这里先获取input文本框 的内容
					var name=document.getElementById("name");
					var name_len =name.value.length;
					if(name_len<2||name_len>19){
					var spanId=document.getElementById("name_span");
					spanId.innerHTML="<font color='red' size='2'>*请输入2-19位的姓名信息</font>";
					return false;
					}else{
					var spanId=document.getElementById("name_span");
					spanId.innerHTML="<font color='blue' size='2'>您输入的姓名信息格式正确！</font>";
					return true;
					     }

					  
					}//函数
				
				function deptGetFocus(){
					//获取userspan的Id
					var spanId=document.getElementById("dept_span");
					//给span中添加内容
					spanId.innerHTML="<font color='blue' size='2'>请输入3-19位的院系信息</font>"
					}
				function deptLoseFocus(){
					//这里先获取input文本框 的内容
					var dept=document.getElementById("dept");
					var d_len =dept.value.length;
					if(d_len<3||d_len>19){
					var spanId=document.getElementById("dept_span");
					spanId.innerHTML="<font color='red' size='2'>*请输入3-19位的院系信息</font>";
					return false;
					}else{
					var spanId=document.getElementById("dept_span");
					spanId.innerHTML="<font color='blue' size='2'>您输入的院系信息格式正确！</font>";
					return true;
					     }

					  
					}//函数





//定义password的聚焦函数
function passGetFocus(){
var passSpan=document.getElementById("pass_span");
passSpan.innerHTML="<font size='2' color ='blue'>请输入8~19位的密码,其中至少包含字母、数字、特殊字符的两种</font>";
}
//定义一个password的失焦的函数
function passLoseFocus(){
var pass_num=document.getElementById("password");
var pass_len=pass_num.value.length;
//判断
if(pass_len==0){
var passSpan=document.getElementById("pass_span");
passSpan.innerHTML="<font size='2' color ='red'>*密码不能为空,请输入8~19位密码</font>";
return false;
}else if(pass_len<8 || pass_len>19){
var passSpan=document.getElementById("pass_span");
passSpan.innerHTML="<font size='2' color='red'>*请输入8~19位密码</font>";
return false;
}else{

var regPasswordSpecial = /[~!@#%&=;':",./<>_\}\]\-\$\(\)\*\+\.\[\?\\\^\{\|]/;
var regPasswordAlpha = /[a-zA-Z]/;
var regPasswordNum = /[0-9]/;
var password;
function atLeastTwo(password) {
  var a = regPasswordSpecial.test(password) ? 1 : 0;
  var b = regPasswordAlpha.test(password) ? 1 : 0;
  var c = regPasswordNum.test(password) ? 1 : 0;
  return a + b + c;

}
if(atLeastTwo(pass_num.value) < 2){
 var passSpan=document.getElementById("pass_span");
  passSpan.innerHTML="<font color='red' size='2'>密码中至少包含字母、数字、特殊字符的两种</font>";
     return false;
 }else{
var passSpan=document.getElementById("pass_span");
passSpan.innerHTML="<font color='blue' size='2'>密码格式正确</font>";
return true;
     }

}
}
function tijiao(){
var user_result=userLoseFocus();
var pass_result=passLoseFocus();
var u_type_result=u_typeLoseFocus();
var sex_result=sexLoseFocus();
var st_no_result=st_noLoseFocus();
var age_result=ageLoseFocus();
var dept_result=deptLoseFocus();
var name_result=nameLoseFocus();
if(user_result && pass_result&& u_type_result&&sex_result&&st_no_result&&age_result&&dept_result&&name_result){
return true;
}else{
return false;
} 
}
</script>
<script src="css/layui/layui.js"></script>
<script>
layui.use('element', function(){
  var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
</body>
</html>