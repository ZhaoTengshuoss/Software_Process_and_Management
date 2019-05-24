<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="oracle.DaoFactory"%>
<%@page import="Dao.IUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="oracle.ValidateUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加课程界面</title>
<link href="css/style2.css" rel="stylesheet" type="text/css"/>
<link href="css/font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="css/layui/css/layui.css" rel="stylesheet"  media="all">
<link rel="icon" href="./css/image/code.png">
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
     <a href="course.jsp">课程信息</a>
     <a><cite>添加新课程</cite></a>
   </span>
       </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="color:blue">添加新课程</legend>
    </fieldset>

    <%    
     String error=(String)session.getAttribute("error");
       if(error==null)
       {
    	   error="";
           
       }
       session.putValue("error", "");
%>
<div style="margin-left:50px;margin-right:30px;margin-top:0px;font-size:50px">
    <form  action="add_c1.jsp" onsubmit="return tijiao()">
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span style="color:blue; font-family:楷体 ;font-size:20px"><%=error %></span>
	<table  class="layui-table" style="text-align:center">
		<tr>
		   <td>
		   课程编号：
		   </td>
		   <td>
		   <input name="Cno" id="Cno" onfocus="CnoGetFocus()" onblur="CnoLoseFocus()"/>
		    <span id="Cno_span"></span><br/>
		   
		   </td>
		</tr>
		<tr>
		   <td>
		   课程名：
		   </td>
		   <td>
		   <input  name="Cname"  id="Cname" onfocus="CnameGetFocus()" onblur="CnameLoseFocus()"/>
		    <span id="Cname_span"></span><br/>
		   
		   </td>
		</tr>
		<tr>
		   <td>
		   课程学分：
		   </td>
		   <td>
		   <input  name="Ccredit" id="Ccredit"   onfocus="CcreditGetFocus()" onblur="CcreditLoseFocus()"/>
		   <span id="Ccredit_span"></span><br/>
		    
		   </td>
		</tr>
			<tr>
		   <td>
		   所在学期：
		   </td>
		   <td>
		   <input  name="Semester"  id="Semester" onfocus="SemesterGetFocus()" onblur="SemesterLoseFocus()"/>
		    <span id="Semester_span"></span><br/>
		    
		   </td>
		</tr>
		<tr>
		   <td>
		   课程性质：
		   </td>
		   <td>
		   <input  type="radio" id="课程性质" name="课程性质" value="选修" onfocus="typeGetFocus()" onblur="typeLoseFocus()">选修&nbsp;&nbsp;
		    <input type="radio" id="课程性质" name="课程性质" value="必修" onfocus="typeGetFocus()" onblur="typeLoseFocus()">必修
		    <span id="type_span"></span><br/>
		  
		   </td>
		</tr>
	</table>
	<div class="layui-form-item">
    <div class="layui-input-block">
		<button class="layui-btn" lay-submit lay-filter="formDemo"style="width:150px;margin-left:300px">添加</button>
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
List<User> users =userDao.find_users2();
int i=0;
for(User user :users)
{
	i++;
%>
<input type="hidden" name="users" value="<%=user.getCno()%>"></input>
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
function CnoGetFocus(){
//获取userspan的Id
var spanId=document.getElementById("Cno_span");
//给span中添加内容
spanId.innerHTML="<font color='blue' size='2'>请输入课程编号</font>"
}
//使用用户失去焦点的函数
function CnoLoseFocus(){
//这里先获取input文本框 的内容

var Cno=document.getElementById("Cno");
var len =Cno.value.length;
for (i=0;i<le;i++)
{
  if(no[i].value==(Cno.value))
   {
      flag=false;
    }
}
if(len==0){
var spanId=document.getElementById("Cno_span");
spanId.innerHTML="<font color='red' size='2'>*课程编号不能为空</font>";
return false;
}else if(!flag)
{
	var spanId=document.getElementById("Cno_span");
	spanId.innerHTML="<font color='red' size='2'>*课程编号已存在，请重新输入！</font>";
	flag=true;
	return false;
		
}else{

var spanId=document.getElementById("Cno_span");
spanId.innerHTML="<font color='blue' size='2'>您输入的用户名格式正确！</font>";
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
		var singal1=0,singal2=0;
		var checks = document.getElementsByName("课程性质");
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
			var typeId=document.getElementById("type_span");
			typeId.innerHTML="<font color='blue' size='2'>合法选择</font>";
			return true;
		
		}else{
			var typeId=document.getElementById("type_span");
			typeId.innerHTML="<font color='red' size='2'>*请选择选修/必修（必选）</font>";
			return false;
		     }

		  
		}//函数 
		var CcreditNum = /[1-9]{1}$/;
		
		function CcreditGetFocus(){
			//获取userspan的Id
			var spanId=document.getElementById("Ccredit_span");
			//给span中添加内容
			spanId.innerHTML="<font color='blue' size='2'>请输入1位数字的学分（大于0）</font>"
			}
		function CcreditLoseFocus(){
			//这里先获取input文本框 的内容

			var Ccredit=document.getElementById("Ccredit");
			var len =Ccredit.value.length;
			if(len==0){
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

				var Semester=document.getElementById("Semester");
				var Semester_len =Semester.value.length;
				if(Semester_len==0){
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
					var cname=document.getElementById("Cname");
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
				
			
function tijiao(){
var Cno_result=CnoLoseFocus();
var type_result=typeLoseFocus();
var Ccredit_result=CcreditLoseFocus();
var Semester_result=SemesterLoseFocus();
var Cname_result=CnameLoseFocus();
if(Cno_result&& Cname_result&&type_result&&Ccredit_result&&Semester_result&&dept_result&&cname_result){
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