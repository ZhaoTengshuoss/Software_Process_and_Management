<%@page import="java.util.List"%>
<%@page import="oracle.UserException"%>
<%@page import="Dao.UserDaoImpl"%>
<%@page import="model.User"%>
<%@ page import="oracle.ValidateUtil" %>
<%@page import="Dao.IUserDao"%>
<%@page import="oracle.DaoFactory"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    //接收客户端传递过来的参数
    String ID=(String)session.getAttribute("ID");
    UserDaoImpl userDao = new UserDaoImpl();
    List<User> users=userDao.find_user3(ID);
    int j=-1;
    for(User user:users)
    {
    	j++;
    	
    	user.setGrade(Integer.parseInt(request.getParameter("Score"+j+"")));
    	user.setSno(Integer.parseInt(request.getParameter("Sno"+j+"")));
    	user.setCno(ID);
    	userDao.update_SC(user); 
    }
    session.setAttribute("id2", ID);
   response.sendRedirect("show_s.jsp"); 
   
%>
