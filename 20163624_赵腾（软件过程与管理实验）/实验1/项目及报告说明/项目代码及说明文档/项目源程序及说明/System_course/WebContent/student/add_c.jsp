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
            <dd><a href="show.jsp" style="height:50px;font-size:20px;">课程信息查看</a></dd>
            <dd><a href="cours/cho_c.jsp" style="height:50px;font-size:20px;">选课</a></dd>
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
    <form  action="add_c1.jsp">
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span style="color:blue; font-family:楷体 ;font-size:20px"><%=error %></span>
	<table  class="layui-table" style="text-align:center">
		<tr>
		   <td>
		   课程编号：
		   </td>
		   <td>
		   <input style="width:100%;" name="Cno"/>
		   <span style="color:red"><%=ValidateUtil.showError(request,"Cno")
					 %></span>
		   </td>
		</tr>
		<tr>
		   <td>
		   课程名：
		   </td>
		   <td>
		   <input style="width:100%;" name="Cname"/>
		    <span style="color:red"><%=ValidateUtil.showError(request,"Cname")
					 %></span>
		   </td>
		</tr>
		<tr>
		   <td>
		   课程学分：
		   </td>
		   <td>
		   <input style="width:100%;" name="Ccredit"/>
		    <span style="color:red"><%=ValidateUtil.showError(request,"Ccredit")
					 %></span>
		   </td>
		</tr>
			<tr>
		   <td>
		   所在学期：
		   </td>
		   <td>
		   <input style="width:100%;" name="Semester"/>
		     <span style="color:red"><%=ValidateUtil.showError(request,"Semester")
					 %></span>
		   </td>
		</tr>
		<tr>
		   <td>
		   课程性质：
		   </td>
		   <td>
		   <input  type="radio" name="课程性质" value="选修" >选修&nbsp;&nbsp;
		    <input type="radio" name="课程性质" value="必修" >必修
		     <span style="color:red"><%=ValidateUtil.showError(request,"课程性质")
					 %></span>
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