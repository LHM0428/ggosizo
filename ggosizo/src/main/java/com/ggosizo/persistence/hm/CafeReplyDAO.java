package com.ggosizo.persistence.hm;

import java.util.List;

import com.ggosizo.domain.hm.CafeReplyVO;
import com.ggosizo.domain.yj.Criteria;

public interface CafeReplyDAO {
	
	public List<CafeReplyVO> list(int no) throws Exception;
	public void create(CafeReplyVO vo) throws Exception;
	public void update(CafeReplyVO vo) throws Exception;
	public void delete(int reply_no) throws Exception;
	public List<CafeReplyVO> listPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
	public int getNo(int reply_no) throws Exception;
}
