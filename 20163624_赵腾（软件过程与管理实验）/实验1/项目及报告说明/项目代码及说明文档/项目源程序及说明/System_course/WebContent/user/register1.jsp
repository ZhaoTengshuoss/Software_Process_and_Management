<%@page import="Dao.UserDaoImpl"%>
<%@page import="model.User"%>
<%@page import="oracle.UserException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//接收客户端传递过来的参数
	request.setCharacterEncoding("utf-8");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String type=request.getParameter("u_type");
	String st_no=request.getParameter("st_no");/*工号/学号*/
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String age=request.getParameter("age");
	String dept=request.getParameter("dept");
	
	int number=0;
	int u_age=0;
	int u_type=1;
	if("老师".contentEquals(type))/* 0-管理员  1-学生  2-老师 */
		 u_type=2;
	u_age=Integer.parseInt(age);
	number=Integer.parseInt(st_no);
	User user = new User();
	user.setUsername(username);
	user.setPassword(password);
    user.setU_type(u_type);
    
	UserDaoImpl userDao = new UserDaoImpl();
	try{
		userDao.add_user(username, password,u_type,number,name,sex,u_age,dept);
		//重定向
		System.out.print("添加成功");
		%>
		 <script  language="javascript">
	 		alert('添加成功即将跳转登录页面');
	 		window.location.href="loginInput.jsp";
	 		</script>
	 		<% 
		
	} catch (UserException e) {
	/* 	System.out.print(e.getMessage()); */
		%>
		<input type="hidden" value="<%=e.getMessage()%>" id="sum" name="sum"/>
		 <script  language="javascript">
		 window.onload=function(){
		 var meg=document.getElementById('sum').value;
		 if(meg!=null)
	 		{
			 alert(meg);
	 		}
		    window.history.back(-1); 
		 };
	 		</script>
	 		<% 
	 		
		
	}
%>
</body>
</html>