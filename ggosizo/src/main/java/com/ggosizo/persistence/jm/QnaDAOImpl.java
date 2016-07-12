package com.ggosizo.persistence.jm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.jm.Criteria;
import com.ggosizo.domain.jm.QnaVO;
import com.ggosizo.domain.jm.SearchCriteria;



@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject
	private SqlSession session;

	@Override
	public void insert(QnaVO vo) throws Exception {
		session.insert("qna.insert", vo);

	}

	@Override
	public List<QnaVO> selectAll() throws Exception {

		return session.selectList("qna.selectAll");
	}

	@Override
	public QnaVO select(int no) throws Exception {
		return session.selectOne("qna.select", no);
	}

	@Override
	public void update(QnaVO vo) throws Exception {
		System.out.println(vo.toString());
		session.update("qna.update", vo);
	}

	@Override
	public void delete(int no) throws Exception {
		session.delete("qna.delete", no);

	}

	@Override
	public List<QnaVO> selectPage(int page) throws Exception {
	if(page < 1) page=1;
		
		page= (page-1) * 10; //계산결과 page: 0, 10, 20
		                     //------> MyBatis에게 전달할 skip행의 갯수	
		
		return session.selectList("qna.selectPage", page);
	}

	@Override
	public List<QnaVO> selectCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("qna.selectAll",null, 
        		new RowBounds(cri.getPageStart(), cri.getPerPageNum()));		
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		
		return session.selectOne("qna.countPaging",cri);
	}

	@Override
	public List<QnaVO> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList("qna.listSearch",cri,
				new RowBounds(cri.getPageStart(), cri.getPerPageNum()));	
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne("qna.listSearchCount",cri);
	}

	@Override
	public int updateViewCnt(int no) throws Exception {
		return session.update("qna.updateViewCnt",no);
		
	}

	@Override
	public List<QnaVO> selectId(String writer) throws Exception {
		return session.selectList("qna.selectId", writer);
	}

	@Override
	public void updateReplyCnt(int no, int amount) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("qna_no", no);
		map.put("amount", amount);
		session.update("qna.updateReplyCnt", map);
	
	}


}
