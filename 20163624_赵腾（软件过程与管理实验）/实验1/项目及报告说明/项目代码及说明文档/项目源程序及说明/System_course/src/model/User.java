package model;

public class User {
  
  private int id;//�û�id
  private String username;//�û���
  private String password;//����
  private int u_type;//�û����
  private int sno;//ѧ�� 
  private String sname;//ѧ������
  private String ssex;//ѧ���Ա�
  private int sage;//ѧ������
  private String sdept;//ѧ������ϵ
  
  private int tno;//��ʦ����
  private String tname;//��ʦ����
  private String tsex;//��ʦ�Ա�
  private int tage;//��ʦ����
  private String tdept;//��ʦ����ϵ

  public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

public String getTname() {
	return tname;
}
public void setTname(String tname) {
	this.tname = tname;
}
public String getTsex() {
	return tsex;
}
public void setTsex(String tsex) {
	this.tsex = tsex;
}
public int getTage() {
	return tage;
}
public void setTage(int tage) {
	this.tage = tage;
}
public String getTdept() {
	return tdept;
}
public void setTdept(String tdept) {
	this.tdept = tdept;
}
  private String cno;//�γ̺�
  private String cname;//�γ���
  private int ccredit;//�γ�ѧ��
  private int semester;//�γ�ѧ��
  private int grade;//�γ̵÷�
  private String xklb;//ѡ�����ͣ����ޡ�ѡ�޵ȣ�
  
  public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getU_type() {
		return u_type;
	}
	public void setU_type(int u_type) {
		this.u_type = u_type;
	}
	public String getXklb() {
	return xklb;
   }
   public void setXklb(String xklb) {
	this.xklb = xklb;
   }
	
	public int getSno() {
	return sno;
}
public void setSno(int sno) {
	this.sno = sno;
}
public int getTno() {
	return tno;
}
public void setTno(int tno) {
	this.tno = tno;
}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSsex() {
		return ssex;
	}
	public void setSsex(String ssex) {
		this.ssex = ssex;
	}
	public int getSage() {
		return sage;
	}
	public void setSage(int sage) {
		this.sage = sage;
	}
	public String getSdept() {
		return sdept;
	}
	public void setSdept(String sdept) {
		this.sdept = sdept;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCcredit() {
		return ccredit;
	}
	public void setCcredit(int ccredit) {
		this.ccredit = ccredit;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	  
	}
