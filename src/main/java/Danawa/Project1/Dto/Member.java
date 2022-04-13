package Danawa.Project1.Dto;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Member {
 private String email;
 private String pwd;
 private String name;
 private String nickname;
 private Date regdate;
 private String phone;
 
 
 
 
 
 
 
 public Member(String email, String pwd, String nickname) {
	super();
	this.email = email;
	this.pwd = pwd;
	this.nickname = nickname;
}



public Member(String email, String pwd, String name, String nickname, String phone) {
	super();
	this.email = email;
	this.pwd = pwd;
	this.name = name;
	this.nickname = nickname;
	this.phone = phone;
}








public Member(String email, String pwd, String name, String nickname) {
	super();
	this.email = email;
	this.pwd = pwd;
	this.name = name;
	this.nickname = nickname;
}



public Member(String nickname) {
	super();
	this.nickname = nickname;
}



public Member()  {

	}



public Member(String email, String nickname) {
	super();
	this.email = email;
	this.nickname = nickname;
}
 
 
 

 
 
 
 
 

 
 
}



