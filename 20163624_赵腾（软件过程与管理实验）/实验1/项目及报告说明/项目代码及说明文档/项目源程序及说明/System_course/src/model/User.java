package model;

public class User {
  
  private int id;//用户id
  private String username;//用户名
  private String password;//密码
  private int u_type;//用户类别
  private int sno;//学号 
  private String sname;//学生姓名
  private String ssex;//学生性别
  private int sage;//学生年龄
  private String sdept;//学生所在系
  
  private int tno;//老师工号
  private String tname;//老师姓名
  private String tsex;//老师性别
  private int tage;//老师年龄
  private String tdept;//老师所在系

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
  private String cno;//课程号
  private String cname;//课程名
  private int ccredit;//课程学分
  private int semester;//课程学期
  private int grade;//课程得分
  private String xklb;//选课类型（必修、选修等）
  
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
