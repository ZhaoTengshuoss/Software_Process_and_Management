<%@page import="java.util.List"%>
<%@page import="oracle.UserException"%>
<%@page import="Dao.UserDaoImpl"%>
<%@page import="model.User"%>
<%@ page import="oracle.ValidateUtil" %>
<%@page import="Dao.IUserDao"%>
<%@page import="oracle.DaoFactory"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">   
<% 
   //工厂模式（习惯分装--模式）
   int id=Integer.parseInt(request.getParameter("u_id"));
    String username=request.getParameter("username");
    int type=Integer.parseInt(request.getParameter("type"));
    User login_user=(User)session.getAttribute("loginUser"); 
    UserDaoImpl userDao=DaoFactory.getDaoImpl();
    if(login_user.getId()==id)
    {
    	 userDao.delete_u(id,username,type);
    	 response.sendRedirect("./Loginout.jsp");
    }
    else
    {
   userDao.delete_u(id,username,type);
   response.sendRedirect("./u_info.jsp");
    }
 %>