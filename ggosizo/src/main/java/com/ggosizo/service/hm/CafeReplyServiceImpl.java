package com.ggosizo.service.hm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.hm.CafeReplyVO;
import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.persistence.hm.CafeDAO;
import com.ggosizo.persistence.hm.CafeReplyDAO;

@Service
public class CafeReplyServiceImpl implements CafeReplyService {
	@Inject
	CafeReplyDAO dao;
	@Inject
	CafeDAO cafeDAO;
	
	@Override
	public List<CafeReplyVO> list(int no) throws Exception {
		return dao.list(no);
	}

	@Override
	public int addReply(CafeReplyVO vo) throws Exception {
		dao.create(vo);
		cafeDAO.updateReplyCnt(vo.getNo(), 1);
		return cafeDAO.selectCafe(vo.getNo()).getReplycnt();
	}

	@Override
	public void update(CafeReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public int delete(int reply_no) throws Exception {
		int no = dao.getNo(reply_no);
		dao.delete(reply_no);
		cafeDAO.updateReplyCnt(no, -1);
		return cafeDAO.selectCafe(no).getReplycnt();
	}

	@Override
	public List<CafeReplyVO> listReplyPage(int no, Criteria cri) throws Exception {
		return dao.listPage(no, cri);
	}

	@Override
	public int count(int no) throws Exception {
		return dao.count(no);
	}

}
