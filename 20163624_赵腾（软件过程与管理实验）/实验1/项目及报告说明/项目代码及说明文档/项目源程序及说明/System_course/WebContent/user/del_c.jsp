<%@page import="java.util.List"%>
<%@page import="oracle.UserException"%>
<%@page import="Dao.UserDaoImpl"%>
<%@page import="model.User"%>
<%@ page import="oracle.ValidateUtil" %>
<%@page import="Dao.IUserDao"%>
<%@page import="oracle.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    //接收客户端传递过来的参数
    
    String Cno=request.getParameter("Cno");
    String Sno=request.getParameter("Sno"); 
    int sno=Integer.parseInt(Sno);
    IUserDao userDao=DaoFactory.getDaoImpl();
    userDao.delete_SC(Cno,sno);
    session.setAttribute("info9", "成功删除选课");
    response.sendRedirect("show.jsp");
    session.setAttribute("s_id", Sno);
    %>
</body>
</html>