package com.ggosizo.persistence.ss;

import java.util.List;

import com.ggosizo.domain.Reply;
import com.ggosizo.domain.yj.Criteria;

public interface UserCourseReplyDAO {
	
	public List<Reply> list(int no) throws Exception;
	public void create(Reply vo) throws Exception;
	public void update(Reply vo) throws Exception;
	public void delete(int reply_no) throws Exception;
	public List<Reply> listPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
	public int getNo(int reply_no) throws Exception;
}
