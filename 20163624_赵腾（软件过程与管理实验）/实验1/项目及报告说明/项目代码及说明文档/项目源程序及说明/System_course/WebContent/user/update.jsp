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
    String Sname=request.getParameter("姓名");
    String Ssex=request.getParameter("ssex");
    String age=request.getParameter("年龄");
    String Sdept=request.getParameter("所在系");
    boolean flag=true;
     boolean validate=ValidateUtil.validateNull(request, new String[]{"姓名","年龄","所在系"});
     if(!validate){
    	 session.setAttribute("INFO", "所有更改项均不可为空");
    	%>
     <jsp:forward page="updateInput.jsp"></jsp:forward>
    <%
     }
     int Sage=Integer.parseInt(age);
     IUserDao userDao=DaoFactory.getDaoImpl();
     List<User> users=userDao.find_users();
     User user=userDao.find_user(id);
     user.setSname(Sname);
   	 user.setSsex(Ssex);
     user.setSage(Sage);
     
     if(Sdept==null&&"".equals(Sdept))
     {
   	    user.setSdept("暂无");
     }
     else
     {
    	 user.setSdept(Sdept);
     }
     userDao.update_user(user);
     user=userDao.find_user(id);
     session.setAttribute("INFO", "修改成功");
     //将查询出来的数据封装到session中
     session.setAttribute("id", user.getSno()+"");
     %>
     <input type="hidden" name="id" value="<%=user.getSno()%>"/>
<%
   response.sendRedirect("updateInput.jsp");
     
    	  
%>
