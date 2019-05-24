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
<title>首页</title>
<link href="css/style2.css" rel="stylesheet" type="text/css"/>
<link href="css/font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="css/layui/css/layui.css" rel="stylesheet"  media="all">
<script type="text/javascript">
		function showLocale(objD) {
			var str, colorhead, colorfoot;
			var yy = objD.getYear();
			if (yy < 1900)
				yy = yy + 1900;
			var MM = objD.getMonth() + 1;
			if (MM < 10)
				MM = '0' + MM;
			var dd = objD.getDate();
			if (dd < 10)
				dd = '0' + dd;
			var hh = objD.getHours();
			if (hh < 10)
				hh = '0' + hh;
			var mm = objD.getMinutes();
			if (mm < 10)
				mm = '0' + mm;
			var ss = objD.getSeconds();
			if (ss < 10)
				ss = '0' + ss;
			var ww = objD.getDay();
			if (ww == 0)
				colorhead = "<font color=\"#FF0000\">";
			if (ww > 0 && ww < 6)
				colorhead = "<font color=\"#373737\">";
			if (ww == 6)
				colorhead = "<font color=\"#008000\">";
			if (ww == 0)
				ww = "星期日";
			if (ww == 1)
				ww = "星期一";
			if (ww == 2)
				ww = "星期二";
			if (ww == 3)
				ww = "星期三";
			if (ww == 4)
				ww = "星期四";
			if (ww == 5)
				ww = "星期五";
			if (ww == 6)
				ww = "星期六";
			colorfoot = "</font>"
			str = colorhead + yy + "-" + MM + "-" + dd + " " + hh + ":" + mm
					+ ":" + ss + "  " + ww + colorfoot;
			return (str);
		}
		function tick() {
			var today;
			today = new Date();
			document.getElementById("localtime").innerHTML = showLocale(today);
			window.setTimeout("tick()", 1000);
		}
		tick();
	</script>
	
</head>
<body class="layui-layout-body"  onload="tick()">
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
  <%
String ID;
if(request.getParameter("id2")==null)
{
 ID=(String)session.getAttribute("id2");

}
else
{
ID=request.getParameter("id2");
}
	UserDaoImpl userDao = new UserDaoImpl();
	
    User user=userDao.find_user_C(ID);
    if(user==null)
    {
    	user=new User();
    }
    String Meg=(String)session.getAttribute("INFO2");
    if(Meg==null)
    {
 	   Meg="";
        
    }
    session.putValue("INFO2", "");
    
%>
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="margin-top:10px;margin-left:20px;margin-bottom:10px;">
    <span class="layui-breadcrumb">
   <a href="course.jsp">课程信息</a>
   <a><cite>更新课程信息</cite></a>
   </span>
   </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>更新课程信息</legend> 
    </fieldset>
     <span id="localtime" style="float:right"></span>

<div style="margin-left:50px;margin-right:30px;margin-top:0px;font-size:50px"> 
   <form class="layui-form" action="update2.jsp" onsubmit="return tijiao()">
	<table  class="layui-table">
	<input type="hidden" name="id" value="<%=ID%>"/>
	&nbsp;&nbsp;  <span style="color:blue; font-family:楷体 ;font-size:20px"><%=Meg %></span>
		<tr>
			<td>课程名:</td>
			<td colspan="3"><input type="text"  name="课程名"  value="<%=user.getCname() %>" onfocus="CnameGetFocus()" onblur="CnameLoseFocus()"/>
			 <span id="Cname_span"></span><br/>
			</td>
		</tr>
	<tr>
	       <td>学分:</td>
			<td><input type="text"  name="学分" value="<%=user.getCcredit()%>" onfocus="CcreditGetFocus()" onblur="CcreditLoseFocus()"/>
			<span id="Ccredit_span"></span><br/>
			</td>
	</tr>
	<tr>
	       <td>所在学期:</td>
			<td><input type="text"  name="所在学期"  value="<%=user.getSemester() %>" onfocus="SemesterGetFocus()" onblur="SemesterLoseFocus()"/>
			 <span id="Semester_span"></span><br/>
			</td>
	</tr>
	<tr>
	       <td>课程性质:</td>
			<td><input type="text" name="课程性质"  value="<%=user.getXklb() %>" onfocus="typeGetFocus()" onblur="typeLoseFocus()"/>
			<span id="type_span"></span><br/>
			</td>
	</tr>
	</table>
    <br>
    <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo"style="width:150px;padding-left: 30px;margin-left: 350px;">提交</button>
      <button type="reset" class="layui-btn layui-btn-primary"style="width:150px;margin-left: 30px">重置</button>
    </div>
  </div>
</form>
</div>

  <div class="layui-footer">
  <p style="text-align:center"> &copy;&nbsp;软件工程 某某学生制作&nbsp;|&nbsp;<a href="#" style="font-size:16px; color:red">联系管理员</a></p>
  </div>
</div>
<script>

var CcreditNum=/[1-9]{1}$/;
function CcreditGetFocus(){
	//获取userspan的Id
	var spanId=document.getElementById("Ccredit_span");
	//给span中添加内容
	spanId.innerHTML="<font color='blue' size='2'>请输入1位数字的学分（大于0）</font>"
	}
function CcreditLoseFocus(){
	//这里先获取input文本框 的内容

	var Ccredit=document.getElementById("学分");
	var len =Ccredit.value.length;
	if(len!=1){
	var spanId=document.getElementById("Ccredit_span");
	spanId.innerHTML="<font color='red' size='2'>*请输入1位数字的学分（大于0）</font>";
	return false;
	}else if(!CcreditNum.test(Ccredit.value)){
	var spanId=document.getElementById("Ccredit_span");
	spanId.innerHTML="<font color='red' size='2'>*您输入的学分信息不符合规范(1位数字)，请重新输入！</font>";
	return false;
	}else{
	var spanId=document.getElementById("Ccredit_span");
	spanId.innerHTML="<font color='blue' size='2'>您输入的学分信息格式正确！</font>";
	return true;
	     }

	  
	}//函数
	
	
	var SemesterNum = /[1-9]{1}$/;
	
	function SemesterGetFocus(){
		//获取userspan的Id
		var spanId=document.getElementById("Semester_span");
		//给span中添加内容
		spanId.innerHTML="<font color='blue' size='2'>学期格式为数字（大于0）</font>"
		}
	function SemesterLoseFocus(){
		//这里先获取input文本框 的内容

		var Semester=document.getElementById("所在学期");
		var Semester_len =Semester.value.length;
		if(Semester_len!=1){
		var spanId=document.getElementById("Semester_span");
		spanId.innerHTML="<font color='red' size='2'>*学期格式为1位数字（大于0）</font>";
		return false;
		}else if(!SemesterNum.test(Semester.value)){
		var spanId=document.getElementById("Semester_span");
		spanId.innerHTML="<font color='red' size='2'>*您输入的学期信息不符合规范(1位数字)，请重新输入！</font>";
		return false;
		}else{
		var spanId=document.getElementById("Semester_span");
		spanId.innerHTML="<font color='blue' size='2'>您输入的学期信息格式正确！</font>";
		return true;
		     }

		  
		}//函数

		
		function CnameGetFocus(){
			//获取userspan的Id
			var spanId=document.getElementById("Cname_span");
			//给span中添加内容
			spanId.innerHTML="<font color='blue' size='2'>请输入课程名</font>"
			}
		function CnameLoseFocus(){
			//这里先获取input文本框 的内容
			var cname=document.getElementById("课程名");
			var cname_len =cname.value.length;
			
			if(cname_len<2||cname_len>19){
			var spanId=document.getElementById("Cname_span");
			spanId.innerHTML="<font color='red' size='2'>*课程名不能为空</font>";
			return false;
			}else{
			var spanId=document.getElementById("Cname_span");
			spanId.innerHTML="<font color='blue' size='2'>您输入的课程名信息格式正确！</font>";
			return true;
			     }

			  
			}//函数
			
			
			
			function typeGetFocus(){
				//获取userspan的Id
				var typeId=document.getElementById("type_span");
				//给span中添加内容
				typeId.innerHTML="<font color='blue' size='2'>请选择选修/必修（必选）</font>"
				}
				//使用用户失去焦点的函数
				function typeLoseFocus(){
				//这里先获取input文本框 的内容

				var type=document.getElementById("课程性质");
				var len2 =type.value.length;
				
				if(type.value=='必修'||type.value=='选修'){
					var typeId=document.getElementById("type_span");
					typeId.innerHTML="<font color='blue' size='2'>合法填写</font>";
					return true;
				
				}else{
					var typeId=document.getElementById("type_span");
					typeId.innerHTML="<font color='red' size='2'>*请填写选修/必修（必填）</font>";
					return false;
				     }

				  
				}//函数 
				

			function tijiao(){
				
				var type_result=typeLoseFocus();
				var Ccredit_result=CcreditLoseFocus();
				var Semester_result=SemesterLoseFocus();
				var Cname_result=CnameLoseFocus();
				
				if(Cname_result&&type_result&&Ccredit_result&&Semester_result){
				return true;
				}else{
				return false;
				} 
				}

</script>
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
</script>
</body>
</html>