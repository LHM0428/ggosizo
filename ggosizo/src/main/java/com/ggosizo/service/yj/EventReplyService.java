package com.ggosizo.service.yj;

import java.util.List;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.EventReplyVO;


public interface EventReplyService {

	public List<EventReplyVO> list(int no) throws Exception;
	public int addReply(EventReplyVO vo) throws Exception;
	public void update(EventReplyVO vo) throws Exception;
	public int delete(int reply_no) throws Exception;
	public List<EventReplyVO> listReplyPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
}


