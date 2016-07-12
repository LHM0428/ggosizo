package com.ggosizo.domain.yong;

import java.util.Date;

/**
 * @author kosta-G-073
 *
 */
public class UserinfoVO {
/*	u_id varchar2(30) primary key,
	u_pass varchar2(30),
	u_name varchar2(20),
	u_gender varchar2(5),
	u_birth date,
	u_addr varchar2(100),
	u_tel varchar2(50),
	u_email varchar2(30),
	u_logintime date
*/
	private String u_id;
	private String u_pass;
	private String u_name;
	private String u_gender;
	private Date u_birth;
	private String u_addr;
	private String u_tel;
	private String u_email;
	private Date u_logintime;
	
public UserinfoVO() {
	// TODO Auto-generated constructor stub
}

public UserinfoVO(String u_id, String u_pass, String u_name, String u_gender, Date u_birth, String u_addr,
		String u_tel, String u_email, Date u_logintime) {
	super();
	this.u_id = u_id;
	this.u_pass = u_pass;
	this.u_name = u_name;
	this.u_gender = u_gender;
	this.u_birth = u_birth;
	this.u_addr = u_addr;
	this.u_tel = u_tel;
	this.u_email = u_email;
	this.u_logintime = u_logintime;
}

public String getU_id() {
	return u_id;
}

public void setU_id(String u_id) {
	this.u_id = u_id;
}

public String getU_pass() {
	return u_pass;
}

public void setU_pass(String u_pass) {
	this.u_pass = u_pass;
}

public String getU_name() {
	return u_name;
}

public void setU_name(String u_name) {
	this.u_name = u_name;
}

public String getU_gender() {
	return u_gender;
}

public void setU_gender(String u_gender) {
	this.u_gender = u_gender;
}

public Date getU_birth() {
	return u_birth;
}

public void setU_birth(Date u_birth) {
	this.u_birth = u_birth;
}

public String getU_addr() {
	return u_addr;
}

public void setU_addr(String u_addr) {
	this.u_addr = u_addr;
}

public String getU_tel() {
	return u_tel;
}

public void setU_tel(String u_tel) {
	this.u_tel = u_tel;
}

public String getU_email() {
	return u_email;
}

public void setU_email(String u_email) {
	this.u_email = u_email;
}

public Date getU_logintime() {
	return u_logintime;
}

public void setU_logintime(Date u_logintime) {
	this.u_logintime = u_logintime;
}



}