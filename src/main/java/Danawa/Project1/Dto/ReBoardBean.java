package Danawa.Project1.Dto;

public class ReBoardBean {
  private int num;
  private String writer;
  private String reg_date;
  private String content;
	private int ref;
	
  
  public ReBoardBean() {
	// TODO Auto-generated constructor stub
}



public ReBoardBean(int num, String writer,  String reg_date, String content
		,int ref) {
	super();
	this.num = num;
	this.writer = writer;
	this.reg_date = reg_date;
	this.content = content;
	this.ref = ref;
}



public int getNum() {
	return num;
}



public void setNum(int num) {
	this.num = num;
}



public String getWriter() {
	return writer;
}



public void setWriter(String writer) {
	this.writer = writer;
}











public String getReg_date() {
	return reg_date;
}



public void setReg_date(String reg_date) {
	this.reg_date = reg_date;
}



public String getContent() {
	return content;
}



public void setContent(String content) {
	this.content = content;
}



public int getRef() {
	return ref;
}



public void setRef(int ref) {
	this.ref = ref;
}
  
  
  
}
