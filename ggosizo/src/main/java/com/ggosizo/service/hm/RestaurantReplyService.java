package com.ggosizo.service.hm;

import java.util.List;

import com.ggosizo.domain.hm.RestaurantReplyVO;
import com.ggosizo.domain.yj.Criteria;

public interface RestaurantReplyService {
	
	public List<RestaurantReplyVO> list(int no) throws Exception;
	public int addReply(RestaurantReplyVO vo) throws Exception;
	public void update(RestaurantReplyVO vo) throws Exception;
	public int delete(int reply_no) throws Exception;
	public List<RestaurantReplyVO> listReplyPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;
}
