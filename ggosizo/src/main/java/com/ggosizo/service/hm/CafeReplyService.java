package com.ggosizo.service.hm;

import java.util.List;

import com.ggosizo.domain.hm.CafeReplyVO;
import com.ggosizo.domain.yj.Criteria;

public interface CafeReplyService {
	
	public List<CafeReplyVO> list(int no) throws Exception;
	public int addReply(CafeReplyVO vo) throws Exception;
	public void update(CafeReplyVO vo) throws Exception;
	public int delete(int reply_no) throws Exception;
	public List<CafeReplyVO> listReplyPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
}
