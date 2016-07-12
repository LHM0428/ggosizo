package com.ggosizo.persistence.hm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.hm.RestaurantReplyVO;
import com.ggosizo.domain.yj.Criteria;

@Repository
public class RestaurantReplyDAOImpl implements RestaurantReplyDAO {
	
	@Inject
	SqlSession session;
	
	@Override
	public List<RestaurantReplyVO> list(int no) throws Exception {
		return session.selectList("restaurantReply.list", no);
	}

	@Override
	public void create(RestaurantReplyVO vo) throws Exception {
		session.insert("restaurantReply.create", vo);
	}

	@Override
	public void update(RestaurantReplyVO vo) throws Exception {
		session.update("restaurantReply.update", vo);
	}

	@Override
	public void delete(int reply_no) throws Exception {
		session.update("restaurantReply.delete", reply_no);
	}

	@Override
	public List<RestaurantReplyVO> listPage(int no, Criteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("restaurantReply.list", no, bound);
	}

	@Override
	public int count(int no) throws Exception {
		return session.selectOne("restaurantReply.count", no);
	}

	@Override
	public int getNo(int reply_no) throws Exception {
		return session.selectOne("restaurantReply.getNo", reply_no);
	}

}
