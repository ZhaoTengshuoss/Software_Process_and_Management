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
    int id=Integer.parseInt(request.getParameter("id"));
    String Tname=request.getParameter("姓名");
    String Tsex=request.getParameter("ssex");
    String age=request.getParameter("年龄");
    String Tdept=request.getParameter("所在系");
    boolean flag=true;
     boolean validate=ValidateUtil.validateNull(request, new String[]{"姓名","年龄","所在系"});
     if(!validate){
    	 session.setAttribute("INFO_t", "所有更改项均不可为空");
    	%>
     <jsp:forward page="updateInput.jsp"></jsp:forward>
    <%
     }
     int Tage=Integer.parseInt(age);
     IUserDao userDao=DaoFactory.getDaoImpl();
     List<User> users=userDao.find_t();
     User user=userDao.find_t_info(id);
     user.setTname(Tname);
   	 user.setTsex(Tsex);
     user.setTage(Tage);
   	 user.setTdept(Tdept);
     
     userDao.update_user_t(user);
     user=userDao.find_t_info(id);
     session.setAttribute("INFO_t", "修改成功");
     //将查询出来的数据封装到session中
     session.setAttribute("t_id", user.getTno()+"");
     %>
     <input type="hidden" name="t_id" value="<%=user.getTno()%>"/>
<%
   response.sendRedirect("updateInput_t.jsp");
     
    	  
%>
