package com.ggosizo.service.yj;

import java.util.List;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.NoticeReplyVO;


public interface NoticeReplyService {

	public List<NoticeReplyVO> list(int no) throws Exception;
	public int addReply(NoticeReplyVO vo) throws Exception;
	public void update(NoticeReplyVO vo) throws Exception;
	public int delete(int reply_no) throws Exception;
	public List<NoticeReplyVO> listReplyPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
}


