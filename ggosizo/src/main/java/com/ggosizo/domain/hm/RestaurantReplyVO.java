package com.ggosizo.domain.hm;

import java.util.Date;

import com.ggosizo.domain.Reply;

public class RestaurantReplyVO extends Reply{
	
	public RestaurantReplyVO() {
		// TODO Auto-generated constructor stub
	}
	public RestaurantReplyVO(int no, int reply_no, String reply_content, String reply_writer, Date reply_regdate,
			Date reply_updatedate) {
		super(no, reply_no, reply_content, reply_writer, reply_regdate, reply_updatedate);
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "RestaurantReplyVO [toString()=" + super.toString() + ", getNo()=" + getNo() + ", getReply_no()="
				+ getReply_no() + ", getReply_content()=" + getReply_content() + ", getReply_writer()="
				+ getReply_writer() + ", getReply_regdate()=" + getReply_regdate() + ", getReply_updatedate()="
				+ getReply_updatedate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
}
