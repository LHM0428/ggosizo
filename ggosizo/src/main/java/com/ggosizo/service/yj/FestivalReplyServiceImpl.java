package com.ggosizo.service.yj;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.FestivalReplyVO;
import com.ggosizo.persistence.yj.FestivalDAO;
import com.ggosizo.persistence.yj.FestivalReplyDAO;

@Service
public class FestivalReplyServiceImpl implements FestivalReplyService{
	@Inject
	FestivalReplyDAO dao;
	@Inject
	FestivalDAO festivalDAO;
	
	@Override
	public List<FestivalReplyVO> list(int no) throws Exception {
		return dao.list(no);
	}

	@Override
	public int addReply(FestivalReplyVO vo) throws Exception {
		dao.create(vo);
		festivalDAO.updateReplyCnt(vo.getNo(), 1);
		return festivalDAO.select(vo.getNo()).getReplycnt();
	}

	@Override
	public void update(FestivalReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public int delete(int reply_no) throws Exception {
		int no = dao.getNo(reply_no);
		dao.delete(reply_no);
		festivalDAO.updateReplyCnt(no, -1);
		return festivalDAO.select(no).getReplycnt();
	}

	@Override
	public List<FestivalReplyVO> listReplyPage(int no, Criteria cri) throws Exception {
		return dao.listPage(no, cri);
	}

	@Override
	public int count(int no) throws Exception {
		return dao.count(no);
	}

}
