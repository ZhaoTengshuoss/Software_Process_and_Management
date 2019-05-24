package Dao;

import java.util.List;

import model.User;

public interface IUserDao {
	public User load(String username);
	public void add_user(String username,String password,int u_type,int st_no,String name,String sex,int age,String dept);//ע��ʱ����
	
	public List<User> load2(String content);/*ģ����ѯ�γ���Ϣ*/
	public List<User> find_users();//���ұ��е�ȫ��ѧ����Ϣ
	public List<User> find_users_u();//���ұ��е�ȫ���û���Ϣ
	public void delete_user_S(int id,String username); //ɾ��student����Ϣ
	public void delete_user_t(int id,String username); //ɾ��teacher����Ϣ
	public User find_user(int id);//����ѧ�Ų��Ҹ�ѧ���Ļ���ѧ����Ϣ  ��student��
	public void update_user(User user);//�޸�ѧ����Ϣ
	public void update_user_t(User user);//�޸���ʦ��Ϣ
	public List<User> find_user2(int id);//����ѧ�Ų��Ҷ�Ӧ�γ���Ϣ
	public List<User> find_users2();//���ұ��е�ȫ���γ���Ϣ
	public List<User> find_user3(String id);//���ݿγ̺Ų��Ҷ�Ӧѧ����Ϣ
	public User find_user_C(String id);//���ݿγ̺Ų��Ҹÿγ̵Ļ����γ���Ϣ  ��course��
	public void update_user_C(User user);//�޸Ŀγ���Ϣ
	public void delete_user_C(String  id); //ɾ��course����Ϣ
	public void delete_SC(String  Cno,int Sno); //ɾ��SC����Ϣ
	public void update_SC(User user);//����SC����Ϣ
	public User find_user_C1(String id);//���ݿγ̺Ų��Ҹÿγ̵Ļ����γ���Ϣ  ��SC��
	public void add_user_SC(int Sno,String Cno);//��ӿγ���Ϣ(SC��Ϣ)
	public User add_user_C(String Cno,String Cname,int Ccredit,int Semester,String Xklb,int Tno);//��ӿγ���Ϣ
	public User add_user_S(String Sno,String Sname,String Ssex,int Sage,String Sdept,String Username);//���ѧ����Ϣ	
	
	public List<User> load1(String content);/*ģ����ѯѧ����Ϣ*/
	
	public User find_s(String username);/*�����û������Ҹ�ѧ����Ϣ*/
	public User find_t(String username);/*�����û������Ҹ���ʦ��Ϣ*/
	
	public User find_t_info(int tno);/*���ݹ��Ų��Ҹ���ʦ��Ϣ*/
	public List<User> find_c_info(int tno);/*���ݹ��Ų��Ҹ���ʦ�����пγ���Ϣ*/
	
	public List<User> find_t();/*����teacher����������ʦ��Ϣ*/
	public List<User> load3(String content);/*ģ����ѯ��ʦ��Ϣ*/
	
	public void update_user_s(User user,String username);//�޸�ѧ���ĵ�¼��Ϣ
	public void update_user_t(User user,String username);//�޸���ʦ�ĵ�¼��Ϣ
	public void update_user_u(User user);//�޸��û��ĵ�¼��Ϣ
	
	public User find_user_u(int id);//�����û�id���Ҹ��û���Ϣ
	public List<User> find_user4(String id);//���ݿγ̺Ų��Ҷ�Ӧѧ����Ϣ(������)
	
	public List<User> load4(String content);/*ģ����ѯ�û���Ϣ*/
	
	public void delete_u(int id,String username,int type); //ɾ���û�����Ϣ
	
	public void update_user_a(User user,String username);//�޸ģ����У��û��ĵ�¼��Ϣ
	
	
}
