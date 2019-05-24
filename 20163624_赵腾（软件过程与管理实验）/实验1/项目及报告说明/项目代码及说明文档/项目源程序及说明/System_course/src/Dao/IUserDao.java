package Dao;

import java.util.List;

import model.User;

public interface IUserDao {
	public User load(String username);
	public void add_user(String username,String password,int u_type,int st_no,String name,String sex,int age,String dept);//注册时调用
	
	public List<User> load2(String content);/*模糊查询课程信息*/
	public List<User> find_users();//查找表中的全部学生信息
	public List<User> find_users_u();//查找表中的全部用户信息
	public void delete_user_S(int id,String username); //删除student表信息
	public void delete_user_t(int id,String username); //删除teacher表信息
	public User find_user(int id);//根据学号查找该学生的基本学生信息  （student表）
	public void update_user(User user);//修改学生信息
	public void update_user_t(User user);//修改老师信息
	public List<User> find_user2(int id);//根据学号查找对应课程信息
	public List<User> find_users2();//查找表中的全部课程信息
	public List<User> find_user3(String id);//根据课程号查找对应学生信息
	public User find_user_C(String id);//根据课程号查找该课程的基本课程信息  （course表）
	public void update_user_C(User user);//修改课程信息
	public void delete_user_C(String  id); //删除course的信息
	public void delete_SC(String  Cno,int Sno); //删除SC的信息
	public void update_SC(User user);//更改SC表信息
	public User find_user_C1(String id);//根据课程号查找该课程的基本课程信息  （SC表）
	public void add_user_SC(int Sno,String Cno);//添加课程信息(SC信息)
	public User add_user_C(String Cno,String Cname,int Ccredit,int Semester,String Xklb,int Tno);//添加课程信息
	public User add_user_S(String Sno,String Sname,String Ssex,int Sage,String Sdept,String Username);//添加学生信息	
	
	public List<User> load1(String content);/*模糊查询学生信息*/
	
	public User find_s(String username);/*根据用户名查找该学生信息*/
	public User find_t(String username);/*根据用户名查找该老师信息*/
	
	public User find_t_info(int tno);/*根据工号查找该老师信息*/
	public List<User> find_c_info(int tno);/*根据工号查找该老师的所有课程信息*/
	
	public List<User> find_t();/*查找teacher表中所有老师信息*/
	public List<User> load3(String content);/*模糊查询老师信息*/
	
	public void update_user_s(User user,String username);//修改学生的登录信息
	public void update_user_t(User user,String username);//修改老师的登录信息
	public void update_user_u(User user);//修改用户的登录信息
	
	public User find_user_u(int id);//根据用户id查找该用户信息
	public List<User> find_user4(String id);//根据课程号查找对应学生信息(不满足)
	
	public List<User> load4(String content);/*模糊查询用户信息*/
	
	public void delete_u(int id,String username,int type); //删除用户表信息
	
	public void update_user_a(User user,String username);//修改（所有）用户的登录信息
	
	
}
