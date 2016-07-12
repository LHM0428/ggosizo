package com.ggosizo.service.yj;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.EventReplyVO;
import com.ggosizo.persistence.yj.EventDAO;
import com.ggosizo.persistence.yj.EventReplyDAO;

@Service
public class EventReplyServiceImpl implements EventReplyService {

	@Inject
	EventReplyDAO dao;
	@Inject
	EventDAO eventDAO;
	
	@Override
	public List<EventReplyVO> list(int no) throws Exception {
		return dao.list(no);
	}

	@Override
	public int addReply(EventReplyVO vo) throws Exception {
		dao.create(vo);
		eventDAO.updateReplyCnt(vo.getNo(), 1);
		return eventDAO.select(vo.getNo()).getEvent_replycnt();
	}

	@Override
	public void update(EventReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public int delete(int reply_no) throws Exception {
		int no = dao.getNo(reply_no);
		dao.delete(reply_no);
		eventDAO.updateReplyCnt(no, -1);
		return eventDAO.select(no).getEvent_replycnt();
	}

	@Override
	public List<EventReplyVO> listReplyPage(int no, Criteria cri) throws Exception {
		return dao.listPage(no, cri);
	}

	@Override
	public int count(int no) throws Exception {
		return dao.count(no);
	}

}
