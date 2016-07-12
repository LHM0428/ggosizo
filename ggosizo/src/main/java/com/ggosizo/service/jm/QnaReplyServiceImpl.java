package com.ggosizo.service.jm;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ggosizo.domain.jm.Criteria;
import com.ggosizo.domain.jm.QnaReplyVO;
import com.ggosizo.persistence.jm.QnaDAO;
import com.ggosizo.persistence.jm.QnaReplyDAO;






@Service
public class QnaReplyServiceImpl implements QnaReplyService {

	@Inject
    private QnaReplyDAO dao;
	
	@Inject
	private QnaDAO qnaDao;
	
	
	@Override
	public int insert(QnaReplyVO vo) throws Exception {
	
		dao.insert(vo);
		qnaDao.updateReplyCnt(vo.getno(), 1);
		return qnaDao.select(vo.getno()).getQna_replycnt();
	   
	}

	@Override
	public void update(QnaReplyVO vo) throws Exception {
       dao.update(vo);
	}

	@Override
	public void delete(int reply_no) throws Exception {
		int no = dao.getNo(reply_no);
		dao.delete(reply_no);
		qnaDao.updateReplyCnt(no, -1);;
		qnaDao.select(no).getQna_replycnt();
	}
	

	@Override
	public List<QnaReplyVO> list(int no) throws Exception {		
		return dao.list(no);
	}

	@Override
	public List<QnaReplyVO> listPage(int no, Criteria cri) throws Exception {
		return dao.listPage(no, cri);
	}

	@Override
	public int count(int no) throws Exception {		
		return dao.count(no);
	}

}
