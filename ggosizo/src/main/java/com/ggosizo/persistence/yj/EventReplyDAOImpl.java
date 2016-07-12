package com.ggosizo.persistence.yj;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.EventReplyVO;

@Repository
public class EventReplyDAOImpl implements EventReplyDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public List<EventReplyVO> list(int no) throws Exception {
		return session.selectList("event_reply.list", no);
	}

	@Override
	public void create(EventReplyVO vo) throws Exception {
		session.insert("event_reply.create", vo);
	}

	@Override
	public void update(EventReplyVO vo) throws Exception {
		session.update("event_reply.update", vo);
	}

	@Override
	public void delete(int reply_no) throws Exception {
		session.update("event_reply.delete", reply_no);
	}

	@Override
	public List<EventReplyVO> listPage(int no, Criteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("event_reply.list", no, bound);
	}

	@Override
	public int count(int no) throws Exception {
		return session.selectOne("event_reply.count", no);
	}

	@Override
	public int getNo(int reply_no) throws Exception {
		return session.selectOne("event_reply.getNo", reply_no);
	}

}
