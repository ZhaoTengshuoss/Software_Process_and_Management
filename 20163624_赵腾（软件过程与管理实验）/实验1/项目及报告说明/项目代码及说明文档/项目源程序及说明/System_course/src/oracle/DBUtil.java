package oracle;

import java.sql.*;
public class DBUtil {
	  
        /*private Connection con ;  
        private String user = "ilanni" ;  
        private String password = "zhaoTENG681998" ; //���� 
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
                     System. out.println("�������ݿ������ɹ���" );  
              } catch (ClassNotFoundException e ) {  
                     System. out.println("�������ݿ�����ʧ�ܣ�" );  
                      e.printStackTrace();  
              }  
       }  
  
        *//** �������ݿ����� *//*  
        public Connection getCon() {  
               try {  
                      con = DriverManager. getConnection(url, user, password);  
                     System. out.println("�������ݿ����ӳɹ���" );  
              } catch (SQLException e ) {  
                     System. out.print(con );  
                     System. out.println("�������ݿ�����ʧ�ܣ�" );  
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
                     System. out.println("�ر�con����ʧ�ܣ�" );  
                      e.printStackTrace();  
              }  
       }  */
  
	 /* Oracle���ݿ�����URL*/
    private final static String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
     
   /** Oracle���ݿ���������*/ 
    private final static String DB_DRIVER = "oracle.jdbc.driver.OracleDriver"; 
     
    /** ���ݿ��û���*/ 
    private final static String DB_USERNAME = "ilanni"; 
     
    /** ���ݿ�����*/ 
    private final static String DB_PASSWORD = "zhaoTENG681998"; 
     
    /** 
     * ��ȡ���ݿ����� 
     * @return 
     */ 
    public static Connection getConnection(){ 
        /** ����Connection���Ӷ���*/ 
        Connection conn = null; 
        try{ 
            /** ʹ��Class.forName()�����Զ�����������������ʵ�����Զ�����DriverManager��ע����*/ 
            Class.forName(DB_DRIVER); 
           /** ͨ��DriverManager��getConnection()������ȡ���ݿ�����*/ 
            conn = DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD); 
            System. out.println("���ݿ����ӳɹ���" );  
        }catch(Exception ex){ 
        	System. out.println("���ݿ�����ʧ�ܣ�" );  
            ex.printStackTrace(); 
        } 
        return conn; 
    } 
     
    /** 
     * �ر����ݿ����� 
     *  
     * @param connect 
     */ 
    public static void close(Connection conn){ 
        try{ 
            if(conn!=null){ 
                /** �жϵ�ǰ�������Ӷ������û�б��رվ͵��ùرշ���*/ 
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



