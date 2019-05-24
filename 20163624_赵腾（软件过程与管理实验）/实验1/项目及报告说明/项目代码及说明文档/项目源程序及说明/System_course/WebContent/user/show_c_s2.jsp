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
<body>
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
  <a href="teacher.jsp">所有老师</a>
  <a href="tp_info3.jsp">老师信息</a>
  <a><cite>已选学生</cite></a>
</span>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>课程选课情况</legend>
    </fieldset>
      
</div>
<%
  
String ID;
if(request.getParameter("c_id")==null)
{
 ID=(String)session.getAttribute("c_id");

}
else
{
ID=request.getParameter("c_id");
}
	UserDaoImpl userDao = new UserDaoImpl();
    
    List<User> users=userDao.find_user3(ID);
    
	
	
%>
<div style="margin-left:50px;margin-right:30px;margin-top:100px;font-size:50px"> 
    <table class="layui-table">
			<thead>
			<tr>
			
			<th style="font-size:30px;text-align:center;">课程号</th>
			<th style="font-size:30px;text-align:center;">学生学号</th>
			<th style="font-size:30px;text-align:center;">学生姓名</th>
			<th style="font-size:30px;text-align:center;">学生所在系</th>
		
		</tr>
		</thead>
		<%
			for( User user : users ){
				
		%>
		<tr>
			
			<td style="font-size:30px;text-align:center;"> <%=user.getCno()%></td>
			<td style="font-size:30px;text-align:center;"> <%=user.getSno()%></td>
			<td style="font-size:30px;text-align:center;"> <%=user.getSname()%></td>
			<td style="font-size:30px;text-align:center;"> <%=user.getSdept()%></td>
			
		</tr>
		<%
			}                                                 
		%>
	</table>
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