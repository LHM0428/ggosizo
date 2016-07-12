package com.ggosizo.domain.yong;

import java.util.Date;

/**
 * @author kosta-G-
 *
 */

//m_id varchar2(30) primary key,
//m_pass varchar2(30),
//m_tel varchar2(50),
//m_logintime date default sysdate
public class ManageVO{
	private String m_id;
	private String m_pass;
	private String m_name;
	private String u_tel;
	private Date m_logintime;
	
public ManageVO() {
	// TODO Auto-generated constructor stub
}

public ManageVO(String m_id, String m_pass, String m_name, String u_tel, Date m_logintime) {
	super();
	this.m_id = m_id;
	this.m_pass = m_pass;
	this.m_name = m_name;
	this.u_tel = u_tel;
	this.m_logintime = m_logintime;
}

public String getM_id() {
	return m_id;
}

public void setM_id(String m_id) {
	this.m_id = m_id;
}

public String getM_pass() {
	return m_pass;
}

public void setM_pass(String m_pass) {
	this.m_pass = m_pass;
}

public String getM_name() {
	return m_name;
}

public void setM_name(String m_name) {
	this.m_name = m_name;
}

public String getU_tel() {
	return u_tel;
}

public void setU_tel(String u_tel) {
	this.u_tel = u_tel;
}

public Date getM_logintime() {
	return m_logintime;
}

public void setM_logintime(Date m_logintime) {
	this.m_logintime = m_logintime;
}


}