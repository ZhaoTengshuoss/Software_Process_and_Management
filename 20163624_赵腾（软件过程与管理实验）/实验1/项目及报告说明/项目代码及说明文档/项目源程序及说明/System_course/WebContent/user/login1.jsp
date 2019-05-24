<%@page import="oracle.UserException"%>
<%@page import="model.User"%>
<%@page import="Dao.UserDaoImpl"%>
<%@page import="oracle.DaoFactory"%>
<%@page import="Dao.IUserDao"%>
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
	IUserDao userDao=DaoFactory.getDaoImpl();
	 User user= userDao.load(username);
     if(!(user==null))
     {
    	 if(password.contentEquals(user.getPassword()))
    	 {
    		 session.setAttribute("loginUser",user);
    		 if(user.getU_type()==1)
    		 {
    			 response.sendRedirect(request.getContextPath()+"/student/info.jsp");
    		 }
    		 if(user.getU_type()==2)
    		 {
    			 
    			 response.sendRedirect(request.getContextPath()+"/teacher/info.jsp");
    		 }	
    		 if(user.getU_type()==0)
    		 {
    			 response.sendRedirect(request.getContextPath()+"/user/info.jsp");
    		 }
    	 }
    	 else
    	 {
    		 session.setAttribute("loginError","密码错误");
    		 %>
    		<script language="javascript" type="text/javascript">
    	   
               	alert("密码错误,请重新输入");
               	window.location.href="loginInput.jsp";
         </script>
    		 <%
    		 
    	 }
     }
     else
     {
    	  session.setAttribute("loginError","用户不存在");
    	  %>
 		 <script  language="javascript">
 	
 		alert('用户不存在,请重新登录');
 		 window.history.back(-1);  
 		</script>
 		 <%
    	 /*  response.sendRedirect("loginInput.jsp");  */
 		  
     }
 %>
</body>
</html>