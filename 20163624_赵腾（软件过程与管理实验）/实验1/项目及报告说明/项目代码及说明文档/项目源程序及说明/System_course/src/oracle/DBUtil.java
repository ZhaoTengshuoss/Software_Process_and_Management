package oracle;

import java.sql.*;
public class DBUtil {
	  
        /*private Connection con ;  
        private String user = "ilanni" ;  
        private String password = "zhaoTENG681998" ; //密码 
        private String className = "oracle.jdbc.driver.OracleDriver" ;  
        private String url = "jdbc:oracle:thin:@localhost:1521:orcl" ;//   
  
        public static void main(String[] args) {  
               // TODO Auto-generated method stub  
        	DBUtil c = new DBUtil();  
               c.ConnectOracle();  
               c.getCon();  
               c.closed();  
       }  
  
        public void ConnectOracle() {  
               try {  
                     Class. forName(className);  
                     System. out.println("加载数据库驱动成功！" );  
              } catch (ClassNotFoundException e ) {  
                     System. out.println("加载数据库驱动失败！" );  
                      e.printStackTrace();  
              }  
       }  
  
        *//** 创建数据库连接 *//*  
        public Connection getCon() {  
               try {  
                      con = DriverManager. getConnection(url, user, password);  
                     System. out.println("创建数据库连接成功！" );  
              } catch (SQLException e ) {  
                     System. out.print(con );  
                     System. out.println("创建数据库连接失败！" );  
                      con = null;  
                      e.printStackTrace();  
              }  
               return con ;  
       }  
  
        public void closed() {  
               try {  
                      if (con != null) {  
                            con.close();  
                     }  
              } catch (SQLException e ) {  
                     System. out.println("关闭con对象失败！" );  
                      e.printStackTrace();  
              }  
       }  */
  
	 /* Oracle数据库连接URL*/
    private final static String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
     
   /** Oracle数据库连接驱动*/ 
    private final static String DB_DRIVER = "oracle.jdbc.driver.OracleDriver"; 
     
    /** 数据库用户名*/ 
    private final static String DB_USERNAME = "ilanni"; 
     
    /** 数据库密码*/ 
    private final static String DB_PASSWORD = "zhaoTENG681998"; 
     
    /** 
     * 获取数据库连接 
     * @return 
     */ 
    public static Connection getConnection(){ 
        /** 声明Connection连接对象*/ 
        Connection conn = null; 
        try{ 
            /** 使用Class.forName()方法自动创建这个驱动程序的实例且自动调用DriverManager来注册它*/ 
            Class.forName(DB_DRIVER); 
           /** 通过DriverManager的getConnection()方法获取数据库连接*/ 
            conn = DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD); 
            System. out.println("数据库连接成功！" );  
        }catch(Exception ex){ 
        	System. out.println("数据库连接失败！" );  
            ex.printStackTrace(); 
        } 
        return conn; 
    } 
     
    /** 
     * 关闭数据库连接 
     *  
     * @param connect 
     */ 
    public static void close(Connection conn){ 
        try{ 
            if(conn!=null){ 
                /** 判断当前连接连接对象如果没有被关闭就调用关闭方法*/ 
                if(!conn.isClosed()){ 
                    conn.close(); 
                } 
            } 
        }catch(Exception ex){ 
            ex.printStackTrace(); 
        } 
    } 
    public static void close(PreparedStatement preparedStatement ) {
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(ResultSet resultSet ) {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
   public static void main(String[] args) {  
        // TODO Auto-generated method stub  
 	DBUtil c = new DBUtil();  
        c.getConnection(); 
}
     
}



