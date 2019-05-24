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
    String Cname=request.getParameter("Cname");
    String Ccredit=request.getParameter("Ccredit");
    String Semester=request.getParameter("Semester").trim();
    String Xklb=request.getParameter("课程性质");
    
    int Tno=(int)session.getAttribute("tno1");
    
    boolean flag=true;
    
    boolean validate=ValidateUtil.validateNull(request, new String[]{"Cno","Cname","Ccredit","Semester","课程性质"}); 
    if(!validate){
   	%>
    <jsp:forward page="add_c.jsp"></jsp:forward>
   <%
    }
    
    int Ccredit1=Integer.parseInt(request.getParameter("Ccredit"));
    int Semester1=Integer.parseInt(request.getParameter("Semester"));
    IUserDao userDao=DaoFactory.getDaoImpl();
    
	
    List<User> users=userDao.find_users2();
    for(User user2:users)
    {
        if((user2.getCname().trim()).contentEquals(Cname.trim()))
        {
    		 {
    			 
    			 flag=false;	
    		 }
    	}
    }
    if(flag)
	{
		 
    try{
    User user=userDao.add_user_C(Cno, Cname, Ccredit1, Semester1,Xklb,Tno);
    if(user==null)
    {
    	session.setAttribute("error", "添加失败");
    }
    else
    {
    	session.setAttribute("error", "添加成功");
    }
 	response.sendRedirect("add_c.jsp");
    
    }catch(UserException e){
	 session.setAttribute("error", e.getMessage()+"");
	 response.sendRedirect("add_c.jsp");
    }
	}
    else
    {
    	session.setAttribute("error", "课程名已存在");
    	response.sendRedirect("add_c.jsp");
    }
   %>
</body>
</html>