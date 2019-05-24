package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;
import oracle.DBUtil;
import oracle.UserException;

public class UserDaoImpl implements IUserDao {
	public User load(String username) {
		
		        //获得连接对象
				Connection connection=DBUtil.getConnection();
			    //准备sql语句
				String sql="select * from s_user where username = ?";
				//创建语句传输对象
				PreparedStatement preparedStatement=null;
				ResultSet resultSet=null;
				//集合中只能放User对象
				User user=null;
				try {
					preparedStatement=connection.prepareStatement(sql);
					preparedStatement.setString(1,username);
					resultSet=preparedStatement.executeQuery();
					 //遍历结果集
					 while(resultSet.next())
					 {
						 user=new User();
						 user.setId(resultSet.getInt("id"));
						 user.setUsername(username);
						 user.setPassword(resultSet.getString("password"));
				         user.setU_type(resultSet.getInt("u_type"));
					 }
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally
				{
					//关闭资源
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
					
				}   
		          return user;	
			}
	public void add_user(String username, String password, 
			int u_type,int st_no,String name,String sex,int age,String dept) {
		//获得链接对象
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select count(*) from s_user where username = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,username);
			//接收结果集
			resultSet = preparedStatement.executeQuery();
			//遍历结果集
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					throw new UserException("用户已存在") ;
				}
			}
			
			sql = "insert into s_user(username,password,u_type) values(?,?,?)";	
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,username);
			preparedStatement.setString(2, password);
			preparedStatement.setInt(3, u_type);
			preparedStatement.executeUpdate();
			if(u_type==1)
			{
			sql ="select count(*) from student where sno = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,st_no);
			//接收结果集
			resultSet = preparedStatement.executeQuery();
			//遍历结果集
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					throw new UserException("该学号已存在") ;
				}
			}
			sql = "insert into student(username,sno,sname,ssex,sage,sdept) values(?,?,?,?,?,?)";	
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,username);
			preparedStatement.setInt(2, st_no);
			preparedStatement.setString(3, name);
			preparedStatement.setString(4, sex);
			preparedStatement.setInt(5, age);
			preparedStatement.setString(6, dept);
			preparedStatement.executeUpdate();
			
			}
			else
			{
				sql ="select count(*) from teacher where tno = ?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1,st_no);
				//接收结果集
				resultSet = preparedStatement.executeQuery();
				//遍历结果集
				while(resultSet.next()) {
					if (resultSet.getInt(1) > 0) {
						throw new UserException("该工号已存在") ;
					}
				}
				sql = "insert into teacher(username,tno,tname,tsex,tage,tdept) values(?,?,?,?,?,?)";	
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1,username);
				preparedStatement.setInt(2, st_no);
				preparedStatement.setString(3, name);
				preparedStatement.setString(4, sex);
				preparedStatement.setInt(5, age);
				preparedStatement.setString(6, dept);
				preparedStatement.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭资源
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
}
	public List<User> find_users() {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from student ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setSno(resultSet.getInt("sno"));
				user.setSname(resultSet.getString("sname"));
				user.setSsex(resultSet.getString("ssex"));
				user.setSage(resultSet.getInt("sage"));
				user.setSdept(resultSet.getString("sdept"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	@Override
	public List<User> load2(String content) {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from course ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			if (content == null || "".equals(content)) {
				preparedStatement = connection.prepareStatement(sql);
				
			}
			else
			{
				sql +="where cname like ? or cno like ?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, "%"+content+"%");//可匹配含content中的n个字符  _为匹配一个。
				preparedStatement.setString(2, "%"+content+"%");//可匹配含content中的n个字符  _为匹配一个。
			}
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setCno(resultSet.getString("cno"));
				user.setCname(resultSet.getString("cname"));
				user.setCcredit(resultSet.getInt("ccredit"));
				user.setSemester(resultSet.getInt("semester"));
				user.setTno(resultSet.getInt("tno"));
				user.setXklb(resultSet.getString("xklb"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}

	@Override
	public void delete_user_S(int id,String username) {
		Connection connection = DBUtil.getConnection();
		String sql="delete from SC where sno = ?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			sql = "delete from student where sno = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			sql = "delete from s_user where username = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
	}
	@Override
	public User find_user(int id) {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from student where sno = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setSno(resultSet.getInt("sno"));
				user.setSname(resultSet.getString("sname"));
				user.setSsex(resultSet.getString("ssex"));
				user.setSage(resultSet.getInt("sage"));
				user.setSdept(resultSet.getString("sdept"));
				user.setUsername(resultSet.getString("username"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}
	@Override
	public void update_user(User user) {
		//获得连接对象
		Connection connection=DBUtil.getConnection();
	    //准备sql语句
		String sql="update student set sname=?,ssex=?,sage=?,sdept=? where sno= ?";
		//创建语句传输对象
		PreparedStatement preparedStatement=null;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getSname());
			preparedStatement.setString(2, user.getSsex());
			preparedStatement.setInt(3, user.getSage());
			preparedStatement.setString(4, user.getSdept());
			preparedStatement.setInt(5, user.getSno());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			//关闭资源
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
			
		}

		
	}
	@Override
	public List<User> find_user2(int id) {
		//若用户名还没填，则设置用户名为"空"
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select sc.sno,sc.cno,cname,ccredit,semester,grade,xklb from course c inner join sc on sc.cno = c.cno where sc.sno = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setSno(id);
				user.setCno(resultSet.getString("cno"));
				user.setCname(resultSet.getString("cname"));
				user.setCcredit(resultSet.getInt("ccredit"));
				user.setSemester(resultSet.getInt("semester"));
				user.setGrade(resultSet.getInt("grade"));
				user.setXklb(resultSet.getString("xklb"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
		
		
	}
	@Override
	public List<User> find_users2() {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from course ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setCno(resultSet.getString("cno"));
				user.setCname(resultSet.getString("cname"));
				user.setCcredit(resultSet.getInt("ccredit"));
				user.setSemester(resultSet.getInt("semester"));
				user.setTno(resultSet.getInt("tno"));
				user.setXklb(resultSet.getString("xklb"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	@Override
	public List<User> find_user3(String id) {
		//若用户名还没填，则设置用户名为"空"
				Connection connection = DBUtil.getConnection();
				//准备sql语句
			
				String sql = "select sc.cno,sc.sno,sname,sdept,grade from student s inner join sc on sc.sno = s.sno where sc.cno = ?";
				//创建语句传输对象
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				List<User> users = new ArrayList<User>();
				User user = null;
				try {
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1,id);
					resultSet = preparedStatement.executeQuery();
					while(resultSet.next()) {
						user = new User();
						user.setCno(resultSet.getString("cno"));
						user.setSno(resultSet.getInt("sno"));
						user.setSname(resultSet.getString("sname"));
						user.setSdept(resultSet.getString("sdept"));
						user.setGrade(resultSet.getInt("grade"));
						users.add(user);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				return  users;
				
	}
	@Override
	public User find_user_C(String id) {

		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from course where cno = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setCno(resultSet.getString("cno"));
				user.setCname(resultSet.getString("cname"));
				user.setCcredit(resultSet.getInt("ccredit"));
				user.setSemester(resultSet.getInt("semester"));
				user.setXklb(resultSet.getString("xklb"));
				user.setTno(resultSet.getInt("tno"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
		}
	@Override
	public void update_user_C(User user) {
        //获得连接对象
		Connection connection=DBUtil.getConnection();
	    //准备sql语句	
		String sql="update course set cname=?,ccredit=?,semester=?,xkLb=? where cno= ?";
		//创建语句传输对象
		PreparedStatement preparedStatement=null;
		try {
			preparedStatement=connection.prepareStatement(sql);
			
			preparedStatement.setString(1, user.getCname());
			preparedStatement.setInt(2, user.getCcredit());
			preparedStatement.setInt(3, user.getSemester());
			preparedStatement.setString(4, user.getXklb());
			preparedStatement.setString(5, user.getCno());
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			//关闭资源
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
			
		}

}
	@Override
	public void delete_user_C(String  id) {
		Connection connection = DBUtil.getConnection();
		String sql="delete from SC where cno = ?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, id);
			preparedStatement.executeUpdate();
			sql = "delete from course where cno = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	
	}
	@Override
	public void delete_SC(String Cno, int Sno) {
		Connection connection = DBUtil.getConnection();
		String sql="delete from SC where cno = ? and sno = ?";
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, Cno);
			preparedStatement.setInt(2, Sno);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
	}
	@Override
	public void update_SC(User user) {
		//获得连接对象
		Connection connection=DBUtil.getConnection();
	    //准备sql语句
		
		String sql="update SC set Grade=? where Sno= ? and Cno=?";
		//创建语句传输对象
		PreparedStatement preparedStatement=null;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, user.getGrade());
			preparedStatement.setInt(2, user.getSno());
			preparedStatement.setString(3, user.getCno());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			//关闭资源
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
			
		}
		
	}
	@Override
	public User find_user_C1(String id) {//根据课程号查找该课程的基本课程信息  （SC表）
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from sc where cno = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,id);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				user = new User();
				user.setCno(resultSet.getString("cno"));
				user.setSno(resultSet.getInt("sno"));
				user.setGrade(resultSet.getInt("grade"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}
	@Override
	public void add_user_SC(int Sno, String Cno) {
		//获得链接对象
				Connection connection = DBUtil.getConnection();
				//准备sql语句
				String sql = "insert into sc(sno,cno) values(?,?)";
				//创建语句传输对象
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				try {
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setInt(1,Sno);
					preparedStatement.setString(2,Cno);
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					//关闭资源
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
		
	}
	@Override
	public User add_user_C(String Cno, String Cname, int Ccredit, int Semester,String Xklb,int Tno) {
		//获得链接对象
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select count(*) from course where cno = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user=null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,Cno);
			//接收结果集
			resultSet = preparedStatement.executeQuery();
			//遍历结果集
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					
					throw new UserException("该课程号已存在") ;
				}
			}
			
			sql = "insert into course(cno,cname,ccredit,semester,xklb,tno) values(?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,Cno);
			preparedStatement.setString(2, Cname);
			preparedStatement.setInt(3, Ccredit);
			preparedStatement.setInt(4, Semester);
			preparedStatement.setString(5, Xklb);
			preparedStatement.setInt(6, Tno);
			preparedStatement.executeUpdate();
			sql = "select * from course where cno = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,Cno);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setCno(resultSet.getString("cno"));
				user.setCname(resultSet.getString("cname"));
				user.setCcredit(resultSet.getInt("ccredit"));
				user.setSemester(resultSet.getInt("semester"));	
				user.setXklb(resultSet.getString("xklb"));
				user.setTno(resultSet.getInt("tno"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭资源
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
     return user;
	}
	@Override
	public User add_user_S(String Sno, String Sname, String Ssex, int Sage, String Sdept,String Username) {
		//获得链接对象
				Connection connection = DBUtil.getConnection();
				//准备sql语句
				String sql = "select count(*) from student where Sno = ?";
				//创建语句传输对象
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				User user=null;
				try {
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1,Sno);
					//接收结果集
					resultSet = preparedStatement.executeQuery();
					//遍历结果集
					while(resultSet.next()) {
						if (resultSet.getInt(1) > 0) {
							
							throw new UserException("该学号已被注册") ;
						}
					}
					
					sql = "insert into student(sno,sname,ssex,sage,sdept,username) values(?,?,?,?,?,?)";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1,Sno);
					preparedStatement.setString(2, Sname);
					preparedStatement.setString(3, Ssex);
					preparedStatement.setInt(4, Sage);
					preparedStatement.setString(5,Sdept);
					preparedStatement.setString(6,Username);
					preparedStatement.executeUpdate();
					sql = "select * from student where sno = ?";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1,Sno);
					resultSet = preparedStatement.executeQuery();
					while(resultSet.next()) {
						user = new User();
						user.setSno(resultSet.getInt("sno"));
						user.setSname(resultSet.getString("sname"));
						user.setSsex(resultSet.getString("ssex"));
						user.setSage(resultSet.getInt("sage"));
						user.setSdept(resultSet.getString("sdept"));
						user.setUsername(resultSet.getString("username"));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					//关闭资源
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				return user;
	}
	@Override
	public List<User> load1(String content) {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from student ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			if (content == null || "".equals(content)) {
				preparedStatement = connection.prepareStatement(sql);
				
			}
			else
			{
				sql +="where sname like ? or sno like ?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, "%"+content+"%");//可匹配含content中的n个字符  _为匹配一个。
				preparedStatement.setString(2, "%"+content+"%");//可匹配含content中的n个字符  _为匹配一个。
			}
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setSno(resultSet.getInt("sno"));
				user.setSname(resultSet.getString("sname"));
				user.setSsex(resultSet.getString("ssex"));
				user.setSage(resultSet.getInt("sage"));
				user.setSdept(resultSet.getString("sdept"));
				user.setUsername(resultSet.getString("username"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	@Override
	public User find_s(String username) {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from student where username = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,username);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setSno(resultSet.getInt("sno"));
				user.setSname(resultSet.getString("sname"));
				user.setSsex(resultSet.getString("ssex"));
				user.setSage(resultSet.getInt("sage"));
				user.setSdept(resultSet.getString("sdept"));
				user.setUsername(username);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}
	@Override
	public User find_t(String username) {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from teacher where username = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,username);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setTno(resultSet.getInt("tno"));
				user.setTname(resultSet.getString("tname"));
				user.setTsex(resultSet.getString("tsex"));
				user.setTage(resultSet.getInt("tage"));
				user.setTdept(resultSet.getString("tdept"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}
	@Override
	public User find_t_info(int tno) {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from teacher where tno = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,tno);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setTno(resultSet.getInt("tno"));
				user.setTname(resultSet.getString("tname"));
				user.setTsex(resultSet.getString("tsex"));
				user.setTage(resultSet.getInt("tage"));
				user.setTdept(resultSet.getString("tdept"));
				user.setUsername(resultSet.getString("username"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}
	@Override
	public List<User> find_c_info(int tno) {
		//若用户名还没填，则设置用户名为"空"
				Connection connection = DBUtil.getConnection();
				//准备sql语句
				String sql = "select * from course where tno = ?";
				//创建语句传输对象
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				List<User> users = new ArrayList<User>();
				User user = null;
				try {
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setInt(1,tno);
					resultSet = preparedStatement.executeQuery();
					while(resultSet.next()) {
						user = new User();
						user.setCno(resultSet.getString("cno"));
						user.setCname(resultSet.getString("cname"));
						user.setCcredit(resultSet.getInt("ccredit"));
						user.setSemester(resultSet.getInt("semester"));
						user.setXklb(resultSet.getString("xklb"));
						user.setTno(tno);
						users.add(user);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				return  users;
	}
	@Override
	public List<User> find_t() {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from teacher ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setTno(resultSet.getInt("tno"));
				user.setTname(resultSet.getString("tname"));
				user.setTsex(resultSet.getString("tsex"));
				user.setTage(resultSet.getInt("tage"));
				user.setTdept(resultSet.getString("tdept"));
				user.setUsername(resultSet.getString("username"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	@Override
	public List<User> load3(String content) {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from teacher ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			if (content == null || "".equals(content)) {
				preparedStatement = connection.prepareStatement(sql);
				
			}
			else
			{
				sql +="where tname like ? or tno like ?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, "%"+content+"%");//可匹配含content中的n个字符  _为匹配一个。
				preparedStatement.setString(2, "%"+content+"%");//可匹配含content中的n个字符  _为匹配一个。
			}
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setTno(resultSet.getInt("tno"));
			    user.setTname(resultSet.getString("tname"));
				user.setTsex(resultSet.getString("tsex"));
				user.setTage(resultSet.getInt("tage"));
				user.setTdept(resultSet.getString("tdept"));
				user.setUsername(resultSet.getString("username"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	@Override
	public void update_user_s(User user,String  username) {
		//获得连接对象
				Connection connection=DBUtil.getConnection();
			    //准备sql语句
				
				String sql="update s_user set username=?,password=? where id= ?";
				//创建语句传输对象
				PreparedStatement preparedStatement=null;
				try {
					preparedStatement=connection.prepareStatement(sql);
					preparedStatement.setString(1, user.getUsername());
					preparedStatement.setString(2, user.getPassword());
					preparedStatement.setInt(3, user.getId());
					preparedStatement.executeUpdate();
				    sql="update student set username=? where username= ?";
					preparedStatement=connection.prepareStatement(sql);
					preparedStatement.setString(1, user.getUsername());
					preparedStatement.setString(2, username);
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally
				{
					//关闭资源
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
					
				}
		
	}
	@Override
	public void update_user_t(User user, String username) {
		//获得连接对象
		Connection connection=DBUtil.getConnection();
	    //准备sql语句
		
		String sql="update s_user set username=?,password=? where id= ?";
		//创建语句传输对象
		PreparedStatement preparedStatement=null;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setInt(3, user.getId());
			preparedStatement.executeUpdate();
		    sql="update teacher set username=? where username= ?";
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, username);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			//关闭资源
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
			
		}
		
	}
	@Override
	public void update_user_u(User user) {
		//获得连接对象
				Connection connection=DBUtil.getConnection();
			    //准备sql语句
				
				String sql="update s_user set username=?,password=? where id= ?";
				//创建语句传输对象
				PreparedStatement preparedStatement=null;
				try {
					preparedStatement=connection.prepareStatement(sql);
					preparedStatement.setString(1, user.getUsername());
					preparedStatement.setString(2, user.getPassword());
					preparedStatement.setInt(3, user.getId());
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally
				{
					//关闭资源
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
					
				}
	}
	@Override
	public List<User> find_users_u() {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from s_user ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setId(resultSet.getInt("id"));
				user.setUsername(resultSet.getString("username"));
				user.setPassword(resultSet.getString("password"));
				user.setU_type(resultSet.getInt("u_type"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	@Override
	public User find_user_u(int id) {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from s_user where id = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setId(id);
				user.setPassword(resultSet.getString("password"));
				user.setUsername(resultSet.getString("username"));
				user.setU_type(resultSet.getInt("u_type"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}
	@Override
	public List<User> find_user4(String id) {
		//若用户名还没填，则设置用户名为"空"
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		
		String sql = "select * from student s where not EXISTS (select sno from sc where sc.cno = ? and s.sno=SC.sno)";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,id);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setSno(resultSet.getInt("sno"));
				user.setSname(resultSet.getString("sname"));
				user.setSsex(resultSet.getString("ssex"));
				user.setSage(resultSet.getInt("sage"));
				user.setSdept(resultSet.getString("sdept"));
				
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}

	public List<User> load4(String content) {
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from s_user ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			if (content == null || "".equals(content)) {
				preparedStatement = connection.prepareStatement(sql);
				
			}
			else
			{
				sql +="where username like ? ";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, "%"+content+"%");//可匹配含content中的n个字符  _为匹配一个。
				
			}
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				 user.setId(resultSet.getInt("id"));
				 user.setUsername(resultSet.getString("username"));
				 user.setPassword(resultSet.getString("password"));
		         user.setU_type(resultSet.getInt("u_type"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	public void delete_user_t(int id,String username) {
		Connection connection = DBUtil.getConnection();
		String sql="delete from course where tno = ?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			sql = "delete from teacher where tno = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			sql = "delete from s_user where username = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
	}
	@Override
	public void delete_u(int id,String username,int type) {
		Connection connection = DBUtil.getConnection();
		String sql="delete from s_user where id = ?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			if(type==1)
			{
				User user=find_s(username);
				delete_user_S(user.getSno(),username);
			}
			if(type==2)
			{
				User user=find_t(username);
				delete_user_t(user.getTno(),username);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
	}
	@Override
	public void update_user_a(User user,String username) {
		//获得连接对象
		Connection connection=DBUtil.getConnection();
	    //准备sql语句
		String sql="update s_user set username=?,password=? where id= ?";

		//创建语句传输对象
		PreparedStatement preparedStatement=null;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setInt(3, user.getId());
			preparedStatement.executeUpdate();
			if(user.getU_type()==1)
			{
				update_user_s(user,username);
			}
			if(user.getU_type()==2)
			{
				update_user_t(user,username);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			//关闭资源
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
			
		}
	}
	@Override
	public void update_user_t(User user) {
		//获得连接对象
				Connection connection=DBUtil.getConnection();
			    //准备sql语句
				String sql="update teacher set tname=?,tsex=?,tage=?,tdept=? where tno= ?";
				//创建语句传输对象
				PreparedStatement preparedStatement=null;
				try {
					preparedStatement=connection.prepareStatement(sql);
					preparedStatement.setString(1, user.getTname());
					preparedStatement.setString(2, user.getTsex());
					preparedStatement.setInt(3, user.getTage());
					preparedStatement.setString(4, user.getTdept());
					preparedStatement.setInt(5, user.getTno());
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally
				{
					//关闭资源
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
					
				}
		
	}
	
	


}
