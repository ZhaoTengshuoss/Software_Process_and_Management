<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面</title>
<link href="css/style2.css" rel="stylesheet" type="text/css"/>
<link href="css/font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="css/layui/css/layui.css" rel="stylesheet"  media="all">
<script language="javascript" type="text/javascript">
//准备好body中的内容
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
if(len==0){
var spanId=document.getElementById("user_span");
spanId.innerHTML="<font color='red' size='2'>*请输入3~19位的用户名</font>";
return false;
}else if(len<3 ||len>19){
var spanId=document.getElementById("user_span");
spanId.innerHTML="<font color='red' size='2'>*您输入的用户名不符合规范，请重新输入！</font>";
return false;
}else{

var spanId=document.getElementById("user_span");
spanId.innerHTML="<font color='blue' size='2'>您输入的用户名格式正确！</font>";
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
if(user_result && pass_result ){
return true;
}else{
return false;
} 
}
</script>
</head>

    <%
    User login_user=(User)session.getAttribute("loginUser"); 
    String login_nickname=login_user.getUsername();//获取用户昵称
%>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin" >
  <div class="layui-header" style="height:60px">
    <div class="layui-logo" style="font-size:20px">课程信息管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a style="font-size:20px" href="info.jsp">首页</a></li>
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
           <!--  <dd><a href="teacher.jsp" style="height:50px;font-size:20px;">老师信息查看</a></dd> -->
          </dl>
        </li>
         <li class="layui-nav-item"><a href="teacher.jsp" style="height:50px;font-size:20px;">老师信息</a></li>
         <li class="layui-nav-item"><a href="show.jsp" style="height:50px;font-size:20px;">个人信息</a></li>
      </ul>
    </div>
  </div>
  <div class="layui-body">
  <div style="margin-top:10px;margin-left:20px;margin-bottom:10px;">
    <span class="layui-breadcrumb">
   <a href="info.jsp">首页</a>
   <a><cite>修改个人资料</cite></a>
   </span>
   </div>
  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">修改个人资料</legend>
    </fieldset>
    <div style="margin-top:30px;margin-left:20px;margin-right:20px;">

    <div style="text-align:right;font-size:20px;">
            你好[<%=login_nickname %>]&nbsp;
     </div>
     <%    
    String Meg=(String)session.getAttribute("INFO");
       if(Meg==null)
       {
    	   Meg="";
           
       }
       session.putValue("INFO", "");
%>
<form class="layui-form" action="../user/updateSelf.jsp"  onsubmit="return tijiao()">
  <input type="hidden" name="id" value="<%=login_user.getId()%>"/>
   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span style="color:blue; font-family:楷体 ;font-size:20px"><%=Meg %></span>
  <div class="layui-form-item">
    <label class="layui-form-label"style="width:100px"><h2>用户名:</h2></label>
    <div class="layui-input-inline">
      <input type="text" id="username" name="username" value="<%=login_user.getUsername()%>" onfocus="userGetFocus()" onblur="userLoseFocus()" class="layui-input"style="font-size:20px;width:400px;height:50px;color:gray"/><br/><span id="user_span"></span><br/>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label" style="width:100px"><h2>密码:</h2></label>
    <div class="layui-input-inline">
     <input type="text" id="password" name="password" onfocus="passGetFocus()" onblur="passLoseFocus()" value="<%=login_user.getPassword()%>" class="layui-input"style="font-size:20px;width:400px;height:50px;color:gray"/><br/><span id="pass_span"></span><br/>
    </div>
    <br><br><br>
    <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo"style="width:150px">提交</button>
      <button type="reset" class="layui-btn layui-btn-primary"style="width:150px">重置</button>
    </div>
  </div>
</form>
	</div>
<div class="layui-footer">
  <p style="text-align:center"> &copy;&nbsp;软件工程 某某学生制作&nbsp;|&nbsp;<a href="#" style="font-size:16px; color:red">联系管理员</a></p>
  </div>
</div>
<script src="css/layui/layui.js" charset="utf-8"></script>
<script>
layui.use('element', function(){
  var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
layui.use('ul', function(){
	  var ul = ul.form; //只有执行了这一步，部分表单元素才会自动修饰成功
	  
	  //……
	  
	  //但是，如果你的HTML是动态生成的，自动渲染就会失效
	  //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
	  form.render();
	});      
</script>
<script></script>
</body>
</html>