package com.ggosizo.domain.yj;

import java.util.Date;

import com.ggosizo.domain.Reply;

public class FestivalReplyVO extends Reply{

	public FestivalReplyVO() {
	}

	public FestivalReplyVO(int no, int reply_no, String reply_content, String reply_writer, Date reply_regdate,
			Date reply_updatedate) {
		super(no, reply_no, reply_content, reply_writer, reply_regdate, reply_updatedate);
	}

	@Override
	public String toString() {
		return "FestivalReplyVO [toString()=" + super.toString() + ", getNo()=" + getNo() + ", getReply_no()="
				+ getReply_no() + ", getReply_content()=" + getReply_content() + ", getReply_writer()="
				+ getReply_writer() + ", getReply_regdate()=" + getReply_regdate() + ", getReply_updatedate()="
				+ getReply_updatedate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
}
