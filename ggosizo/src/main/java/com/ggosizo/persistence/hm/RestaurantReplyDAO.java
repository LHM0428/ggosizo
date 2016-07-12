package com.ggosizo.persistence.hm;

import java.util.List;

import com.ggosizo.domain.hm.CafeReplyVO;
import com.ggosizo.domain.hm.RestaurantReplyVO;
import com.ggosizo.domain.yj.Criteria;

public interface RestaurantReplyDAO {
	
	public List<RestaurantReplyVO> list(int no) throws Exception;
	public void create(RestaurantReplyVO vo) throws Exception;
	public void update(RestaurantReplyVO vo) throws Exception;
	public void delete(int reply_no) throws Exception;
	public List<RestaurantReplyVO> listPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
	public int getNo(int reply_no) throws Exception;
}
