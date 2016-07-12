package com.ggosizo.service.hm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.hm.RestaurantReplyVO;
import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.persistence.hm.RestaurantDAO;
import com.ggosizo.persistence.hm.RestaurantReplyDAO;

@Service
public class RestaurantReplyServiceImpl implements RestaurantReplyService {
	@Inject
	RestaurantReplyDAO dao;
	@Inject
	RestaurantDAO restaurantDAO;
	
	@Override
	public List<RestaurantReplyVO> list(int no) throws Exception {
		return dao.list(no);
	}

	@Override
	public int addReply(RestaurantReplyVO vo) throws Exception {
		dao.create(vo);
		restaurantDAO.updateReplyCnt(vo.getNo(), 1);
		return restaurantDAO.selectRestaurant(vo.getNo()).getReplycnt();
	}

	@Override
	public void update(RestaurantReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public int delete(int reply_no) throws Exception {
		int no = dao.getNo(reply_no);
		dao.delete(reply_no);
		restaurantDAO.updateReplyCnt(no, -1);
		return restaurantDAO.selectRestaurant(no).getReplycnt();
	}

	@Override
	public List<RestaurantReplyVO> listReplyPage(int no, Criteria cri) throws Exception {
		return dao.listPage(no, cri);
	}

	@Override
	public int count(int no) throws Exception {
		return dao.count(no);
	}

}
