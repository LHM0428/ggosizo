package com.ggosizo.persistence.yj;

import java.util.List;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.NoticeReplyVO;

public interface NoticeReplyDAO {
	public List<NoticeReplyVO> list(int no) throws Exception;
	public void create(NoticeReplyVO vo) throws Exception;
	public void update(NoticeReplyVO vo) throws Exception;
	public void delete(int reply_no) throws Exception;
	public List<NoticeReplyVO> listPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
	public int getNo(int reply_no) throws Exception;
}

 






