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
<title>选课</title>
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
      
    </ul> 
   
    <ul class="layui-nav layui-layout-right">
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
         
          </dl>
        </li>
         <li class="layui-nav-item"><a href="teacher.jsp" style="height:50px;font-size:20px;">老师信息</a></li>
       <li class="layui-nav-item"><a style="height:50px;font-size:20px;" href="show.jsp">个人信息</a></li>
      </ul>
    </div>
  </div>
   
  <div class="layui-body">
    <!-- 内容主体区域 -->
     <div style="margin-left:10px;margin-top:10px;">
     <span class="layui-breadcrumb">
       <a href="show.jsp">个人信息</a>
     <a><cite>选课</cite></a>
   </span>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>选课</legend>
    </fieldset>
<%
  
	int id2;
	String ID;
	if(request.getParameter("id3")==null)
	{
	 ID=(String)session.getAttribute("id3");
	 id2=Integer.parseInt(ID);//Integer.parseInt()  此方法仅适用于数字字符串的转换，若该字符串含字母，无法转换，会发生错误
	}
	else
	{
	id2=Integer.parseInt(request.getParameter("id3"));
	}
	UserDaoImpl userDao = new UserDaoImpl();
    List<User> users1=userDao.find_user2(id2);//已选课程
    List<User> users=userDao.find_users2();//全部课程
	boolean flag=true;
    String xklb=null;
	
%>

<div style="margin-left:50px;margin-right:30px;margin-top:100px;font-size:50px">
<form action="cho_c1.jsp">
       <table class="layui-table">
			<thead>
			<tr>
			<th style="font-size:30px;text-align:center;">课程号</th>
			<th style="font-size:30px;text-align:center;">课程名</th>
			<th style="font-size:30px;text-align:center;">课程学分</th>
			<th style="font-size:30px;text-align:center;">所在学期</th>
			<th style="font-size:30px;text-align:center;">课程老师工号</th>
			<th style="font-size:30px;text-align:center;">课程类型</th>
			<th colspan="2" style="font-size:30px;text-align:center;">操作</th>
		</tr>
		</thead>
		<%
			for( User user : users ){
				%>
		<tr>
			<td style="font-size:30px;text-align:center;"> <%=user.getCno()%></td>
			<td style="font-size:30px;text-align:center;"> <%=user.getCname()%></td>
			<td style="font-size:30px;text-align:center;"> <%=user.getCcredit()%></td>
			<td style="font-size:30px;text-align:center;"> <%=user.getSemester() %></td>
			<td style="font-size:30px;text-align:center;">  <%=user.getTno() %></td>
			<% 
			flag=true;
			String data=null;
			for(User user1 :users1)
			{
				
				if(user1.getCno().contentEquals(user.getCno()))
				{
					flag=false;
				}	
			}
			%>
			   <td style="font-size:30px;text-align:center;"> <%=user.getXklb()  %></td>
			 <%
			if(!flag)
			{%>
				<td style="font-size:30px;text-align:center;"> <a disabled onclick="return false;"><span style="font-size:30px ;text-align:center">
				已选</span></a></td>
			   <%    
			}
			else
			{
				%>
				 <input type="hidden" value="<%=user.getCno() %>" name="id4">
				 <input type="hidden" value="<%=id2%>" name="id_s">
				 <td style="font-size:30px;text-align:center;">
				  <a  href="cho_c1.jsp?id4=<%=user.getCno()%>&id_s=<%=id2%>"><span style="color:blue;font-size:30px">选课</span>
				  </a>  
				  </td>
			   
			<%
			}
			
			}
		%>
		</tr>
	</table>
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