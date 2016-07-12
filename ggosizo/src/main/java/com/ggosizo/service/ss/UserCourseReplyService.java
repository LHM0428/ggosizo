package com.ggosizo.service.ss;

import java.util.List;

import com.ggosizo.domain.Reply;
import com.ggosizo.domain.ss.UserCourseReplyVO;
import com.ggosizo.domain.yj.Criteria;

public interface UserCourseReplyService {
	
	public List<Reply> list(int no) throws Exception;
	public int addReply(Reply vo) throws Exception;
	public int delete(int reply_no) throws Exception;
	public List<Reply> listReplyPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
	void update(UserCourseReplyVO vo) throws Exception;
}
