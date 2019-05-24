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
    String id=request.getParameter("id");
    String Cname=request.getParameter("课程名");
    int Ccredit=Integer.parseInt(request.getParameter("学分").trim());
    int Semester=Integer.parseInt(request.getParameter("所在学期").trim());
    String Xklb=request.getParameter("课程性质");
    
    boolean flag=true;
    session.setAttribute("id2", id);
    boolean validate=ValidateUtil.validateNull(request, new String[]{"课程名","学分","所在学期","课程性质"}); 
    if(!validate){
   	 session.setAttribute("INFO2", "修改项不能为空");
   	%>
    <jsp:forward page="updateInput2.jsp"></jsp:forward>
   <%
    }
     IUserDao userDao=DaoFactory.getDaoImpl();
     List<User> users=userDao.find_users2();
     User user=userDao.find_user_C(id);
     for(User user2:users)
     {
    	 if((user2.getCname().trim()).contentEquals(Cname.trim())&&!(id.contentEquals(user2.getCno())))
    	 {
    		 flag=false;
    	 }
     }
     if(flag)
     {

    	 user.setCname(Cname);
    	 user.setCcredit(Ccredit);
         user.setSemester(Semester);
         user.setXklb(Xklb);
    	 session.setAttribute("INFO2", "修改成功");  
    
     }
     else
     {
    	 if(!(user.getCname().equals(Cname)))
    	 {
    	 session.setAttribute("INFO2", "该课程名已存在");
    	 }
    	
     }
     if(session.getAttribute("INFO2")==null||"".contentEquals(((String)session.getAttribute("INFO2"))))
     {
    	 
    	 session.setAttribute("INFO2", "修改成功"); 
    	 System.out.println("error2");
     }
     userDao.update_user_C(user);
     user=userDao.find_user_C(id); 
     //将查询出来的数据封装到session中
     session.setAttribute("id2", user.getCno());
     response.sendRedirect("updateInput2.jsp");
   
     
    	  
%>
