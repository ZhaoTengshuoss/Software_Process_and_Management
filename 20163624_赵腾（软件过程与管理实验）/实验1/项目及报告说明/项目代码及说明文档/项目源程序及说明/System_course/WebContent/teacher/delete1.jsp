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
      
   String  id=request.getParameter("id2");
   UserDaoImpl userDao=DaoFactory.getDaoImpl();
   userDao.delete_user_C(id);
   response.sendRedirect("./course.jsp");
 %>