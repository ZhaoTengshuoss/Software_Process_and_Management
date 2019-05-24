<%@page import="Dao.UserDaoImpl"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
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
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>系统简介</legend>
    </fieldset>
    <form action="info.jsp"  method="post">
  </from>
<div style="margin-left:50px;margin-right:30px;margin-top:90px;font-size:50px"> 
 <div style="padding: 20px; background-color: #F2F2F2;">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header" style="font-size:17px">功能简介(学生)</div>
        <div class="layui-card-body">
    <table class="layui-table" style="color:blue;font-weight:bold;font-size:16px" lay-skin="row" lay-even="">
     <tr>
       <td>
                    ①.查看课程 （课程基本信息，考试成绩）。
      </td>
    </tr> 
      <tr>
       <td>
             ②.查看老师（老师基本信息，老师的课程信息）。
                  ③.进行选课.
      </td>
    </tr>
     <tr>
       <td>
                  ③.进行选课.
      </td>
    </tr>
	</table>
		</div>
      </div>
    </div>
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header" style="font-size:17px">功能简介(老师)</div>
        <div class="layui-card-body">
        <table class="layui-table" lay-even="" lay-skin="row"style="color:blue;font-weight:bold;font-size:16px;">
           <tr>
       <td>
                    ①.可查看课程（自己的课程基本信息、全体的课程信息情况）、修改删除课程。
      </td>
    </tr> 
      <tr>
       <td>
             ②查看学生（自己课程中的学生基本信息），删除学生
                 
      </td>
    </tr>
     <tr>
       <td>
                 ③.进行学生的成绩提交，向课程中添加学生。
      </td>
    </tr>
        </table>
         </div>
      </div>
    </div>
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-header" style="font-size:17px">标题</div>
        <div class="layui-card-body">
        <table class="layui-table" lay-even="" lay-skin="row"style="color:blue;font-weight:bold;font-size:16px;">
        <tr>
       <td>
        1.“课程信息管理”：学生可使用此系统查看自己的课程信息，老师可管理自己的课程信息，管理员可进行后台的管理。
      </td>
    </tr>  
     <tr>
       <td>
         2. “信息查找”：提供课程、学生信息查找等功能
      </td>
    </tr>
     <tr>
       <td>
         3. “修改个人资料”：更改登录用户名、密码等。
      </td>
    </tr>
    </table>
        </div>
      </div>
    </div>
  </div>
  </div>
  </div>

 
 
  <div class="layui-footer">
  <p style="text-align:center"> &copy;&nbsp;软件工程 某某学生制作&nbsp;|&nbsp;<a href="#" style="font-size:16px; color:red">联系管理员</a></p>
  </div>
</div>

 
<script src="css/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
</body>
</html>