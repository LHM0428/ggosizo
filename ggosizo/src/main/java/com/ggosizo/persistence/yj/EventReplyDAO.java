package com.ggosizo.persistence.yj;

import java.util.List;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.EventReplyVO;

public interface EventReplyDAO {
	public List<EventReplyVO> list(int no) throws Exception;
	public void create(EventReplyVO vo) throws Exception;
	public void update(EventReplyVO vo) throws Exception;
	public void delete(int reply_no) throws Exception;
	public List<EventReplyVO> listPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
	public int getNo(int reply_no) throws Exception;
}

 






