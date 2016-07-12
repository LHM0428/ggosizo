package com.ggosizo.service.jm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.ggosizo.domain.jm.Criteria;
import com.ggosizo.domain.jm.QnaVO;
import com.ggosizo.domain.jm.SearchCriteria;
import com.ggosizo.persistence.jm.QnaDAO;


@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	private QnaDAO dao;

	@Override
	public void insert(QnaVO vo) throws Exception {
		System.out.println("¼­ºñ½º");
		dao.insert(vo);

	}

	@Override
	public List<QnaVO> selectAll() throws Exception {
		return dao.selectAll();
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public QnaVO select(int no) throws Exception {
		dao.updateViewCnt(no);
		return dao.select(no);
	}

	@Override
	public void update(QnaVO vo) throws Exception {
		dao.update(vo);

	}

	@Override
	public void delete(int no) throws Exception {
		dao.delete(no);

	}

	@Override
	public List<QnaVO> selectCriteria(Criteria cri) throws Exception {
		
		return dao.selectCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public void selectPage(Criteria cri) throws Exception {
		
	}

	@Override
	public void selectCount() throws Exception {
		
	}

	@Override
	public List<QnaVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}

	@Override
	public List<QnaVO> selectId(String writer) throws Exception {
		return dao.selectId(writer);
	}

	
	
	

}
