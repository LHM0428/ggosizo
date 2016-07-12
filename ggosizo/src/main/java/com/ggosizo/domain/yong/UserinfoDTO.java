package com.ggosizo.domain.yong;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UserinfoDTO {
	private String u_id;
	private String u_pass;
	private String u_name;
	private String u_gender;
	private Date u_birth;
	private String u_year;
	private String u_month;
	private String u_day;
	private String u_addr;
	private String u_addr1;
	private String u_addr2;
	private String u_tel;
	private String u_tel1;
	private String u_tel2;
	private String u_tel3;
	private String u_email;
	private String u_email1;
	private String u_email2;
	private Date u_logintime;
	private SimpleDateFormat transFormat;
	
	public UserinfoDTO() {
		transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	}

	@Override
	public String toString() {
		return "UserinfoDTO [u_id=" + u_id + ", u_pass=" + u_pass + ", u_name=" + u_name + ", u_gender="
				+ u_gender + ", u_birth=" + u_birth + ", u_year=" + u_year + ", u_month=" + u_month
				+ ", u_day=" + u_day + ", u_addr=" + u_addr + ", u_addr1=" + u_addr1 + ", u_addr2=" + u_addr2
				+ ", u_tel=" + u_tel + ", u_tel1=" + u_tel1 + ", u_tel2=" + u_tel2 + ", u_tel3=" + u_tel3
				+ ", u_email=" + u_email + ", u_email1=" + u_email1 + ", u_email2=" + u_email2
				+ ", u_logintime=" + u_logintime + "]";
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
		this.setU_year(u_birth);
		this.setU_month(u_birth);
		this.setU_day(u_birth);
	}

	public String getU_year() {
		return u_year;
	}

	public void setU_year(Date u_birth) {
		this.u_year = transFormat.format(u_birth).substring(0, 4);
	}

	public String getU_month() {
		return u_month;
	}

	public void setU_month(Date u_birth) {
		this.u_month = transFormat.format(u_birth).substring(5, 7);
	}

	public String getU_day() {
		return u_day;
	}

	public void setU_day(Date u_birth) {
		this.u_day = transFormat.format(u_birth).substring(8, 10);
	}

	public String getU_addr() {
		return u_addr;
	}

	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
		this.setU_addr1(u_addr);
		this.setU_addr2(u_addr);
		
	}

	public String getU_addr1() {
		return u_addr1;
	}

	public void setU_addr1(String u_addr) {
		this.u_addr1 = u_addr.substring(0,u_addr.indexOf(" "));
	}

	public String getU_addr2() {
		return u_addr2;
	}

	public void setU_addr2(String u_addr) {
		this.u_addr2 = u_addr.substring(u_addr.indexOf(" ")+1);
	}

	public String getU_tel() {
		return u_tel;
	}

	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
		this.setU_tel1(u_tel);
		this.setU_tel2(u_tel);
		this.setU_tel3(u_tel);
	}

	public String getU_tel1() {
		return u_tel1;
	}

	public void setU_tel1(String u_tel) {
		this.u_tel1 = u_tel.substring(0,u_tel.indexOf("-"));
	}

	public String getU_tel2() {
		return u_tel2;
	}

	public void setU_tel2(String u_tel) {
		this.u_tel2 = u_tel.substring(u_tel.indexOf("-")+1,u_tel.lastIndexOf("-"));
	}

	public String getU_tel3() {
		return u_tel3;
	}

	public void setU_tel3(String u_tel) {
		this.u_tel3 = u_tel.substring(u_tel.lastIndexOf("-")+1);
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
		this.setU_email1(u_email);
		this.setU_email2(u_email);
	}

	public String getU_email1() {
		return u_email1;
	}

	public void setU_email1(String u_email) {
		this.u_email1 = u_email.substring(0,u_email.indexOf("@"));
	}

	public String getU_email2() {
		return u_email2;
	}

	public void setU_email2(String u_email) {
		this.u_email2 = u_email.substring(u_email.indexOf("@")+1);
	}

	public Date getU_logintime() {
		return u_logintime;
	}

	public void setU_logintime(Date u_logintime) {
		this.u_logintime = u_logintime;
	}
	
	
}
