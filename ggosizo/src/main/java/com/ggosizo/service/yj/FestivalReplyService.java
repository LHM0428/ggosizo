package com.ggosizo.service.yj;

import java.util.List;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.FestivalReplyVO;

public interface FestivalReplyService {
	
	public List<FestivalReplyVO> list(int no) throws Exception;
	public int addReply(FestivalReplyVO vo) throws Exception;
	public void update(FestivalReplyVO vo) throws Exception;
	public int delete(int reply_no) throws Exception;
	public List<FestivalReplyVO> listReplyPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
}
