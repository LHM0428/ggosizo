package com.ggosizo.persistence.yj;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.EventFileVO;
import com.ggosizo.domain.yj.EventVO;
import com.ggosizo.domain.yj.SearchCriteria;

@Repository
public class EventDAOImpl implements EventDAO {
	
	@Inject
	private SqlSession session;
	
	@Override
	public void insert(EventVO vo) throws Exception {
		session.insert("event.insert", vo);
	}

	@Override
	public void delete(int no) throws Exception {
		session.delete("event.delete", no);
	}

	@Override
	public void update(EventVO vo) throws Exception {
		session.update("event.update", vo);
	}

	@Override
	public EventVO select(int no) throws Exception {
		return session.selectOne("event.select", no);
	}

	@Override
	public List<EventVO> selectAll() throws Exception {
		return session.selectList("event.selectAll");
	}

	@Override
	public List<EventVO> selectPage(int page) throws Exception {
		if(page < 1) page=1;
		
		page= (page-1) * 10; 
		
		return session.selectList("event.selectPage", page);
	}

	@Override
	public List<EventVO> selectCriteria(Criteria cri) throws Exception {
		return session.selectList("event.selectAll", null, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int countPage() throws Exception {
		return session.selectOne("event.selectCount");
	}

	@Override
	public List<EventVO> listSearch(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("event.listSearch", cri, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne("event.listSearchCount", cri);
	}

	@Override
	public void updateReplyCnt(int no, int amount) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("event_no", no);
		map.put("amount", amount);
		session.update("event.updateReplyCnt", map);
	}

	@Override
	public List<EventVO> testSelect() throws Exception {
		int offset=10;//skip
		int limit=10;//maxRowSize
		RowBounds bound = new RowBounds(offset, limit);
		
		return session.selectList("event.testSelect",null,bound);
	}

	@Override
	public void updateViewCnt(int no) throws Exception {
		session.update("event.updateViewCnt",no);
	}

	@Override
	public void addAttach(EventFileVO file) throws Exception {
		session.insert("event_file.addAttach", file);
	}

	@Override
	public int maxNo() throws Exception {
		return session.selectOne("event_file.maxNo");
	}

	@Override
	public EventFileVO getAttach(int no) throws Exception {
		return session.selectOne("event_file.getAttach", no);
	}

	@Override
	public void updateAttach(EventFileVO file) throws Exception {
		session.update("event_file.updateAttach",file);
	}

	@Override
	public void deleteAttach(int no) throws Exception {
		session.delete("event_file.deleteAttach", no);
	}

}
