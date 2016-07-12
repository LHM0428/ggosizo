package com.ggosizo.persistence.yj;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.NoticeFileVO;
import com.ggosizo.domain.yj.NoticeVO;
import com.ggosizo.domain.yj.SearchCriteria;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	
	@Inject
	private SqlSession session;

	@Override
	public void insert(NoticeVO vo) throws Exception {
		session.insert("noticeVO.insert", vo);
	}

	@Override
	public void delete(int no) throws Exception {
		session.delete("noticeVO.delete", no);
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		session.update("noticeVO.update", vo);
	}

	@Override
	public NoticeVO select(int no) throws Exception {
		return session.selectOne("noticeVO.select", no);
	}

	@Override
	public List<NoticeVO> selectAll() throws Exception {
		return session.selectList("noticeVO.selectAll");
	}

	@Override
	public List<NoticeVO> selectPage(int page) throws Exception {
		if(page < 1) page=1;
		
		page= (page-1) * 10; 
		
		return session.selectList("noticeVO.selectPage", page);
	}

	@Override
	public List<NoticeVO> selectCriteria(Criteria cri) throws Exception {
		return session.selectList("noticeVO.selectAll", null, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));	
	}

	@Override
	public int countPage() throws Exception {
		return session.selectOne("noticeVO.selectCount");
	}

	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("noticeVO.listSearch", cri, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne("noticeVO.listSearchCount", cri);
	}

	@Override
	public void updateReplyCnt(int no, int amount) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("notice_no", no);
		map.put("amount", amount);
		session.update("noticeVO.updateReplyCnt", map);
		
	}

	@Override
	public List<NoticeVO> testSelect() throws Exception {
		int offset=10;//skip
		int limit=10;//maxRowSize
		RowBounds bound = new RowBounds(offset, limit);
		
		return session.selectList("noticeVO.testSelect",null,bound);
	}

	@Override
	public void updateViewCnt(int no) throws Exception {
		session.update("noticeVO.updateViewCnt",no);
	}

	@Override
	public void addAttach(NoticeFileVO file) throws Exception {
		session.insert("notice_file.addAttach", file);
		
	}

	@Override
	public int maxNo() throws Exception {
		return session.selectOne("notice_file.maxNo");
	}

	@Override
	public NoticeFileVO getAttach(int no) throws Exception {
		return session.selectOne("notice_file.getAttach", no);
	}

	@Override
	public void updateAttach(NoticeFileVO file) throws Exception {
		session.update("notice_file.updateAttach",file);
	}

	@Override
	public void deleteAttach(int no) throws Exception {
		session.delete("notice_file.deleteAttach", no);
	}	   
	
}
