package com.ggosizo.persistence.yj;

import java.util.List;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.FestivalReplyVO;

public interface FestivalReplyDAO {
	
	public List<FestivalReplyVO> list(int no) throws Exception;
	public void create(FestivalReplyVO vo) throws Exception;
	public void update(FestivalReplyVO vo) throws Exception;
	public void delete(int reply_no) throws Exception;
	public List<FestivalReplyVO> listPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
	public int getNo(int reply_no) throws Exception;
}
