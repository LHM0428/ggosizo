package com.ggosizo.persistence.hm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.hm.CafeReplyVO;
import com.ggosizo.domain.yj.Criteria;

@Repository
public class CafeReplyDAOImpl implements CafeReplyDAO {
	
	@Inject
	SqlSession session;
	
	@Override
	public List<CafeReplyVO> list(int no) throws Exception {
		return session.selectList("cafeReply.list", no);
	}

	@Override
	public void create(CafeReplyVO vo) throws Exception {
		session.insert("cafeReply.create", vo);
	}

	@Override
	public void update(CafeReplyVO vo) throws Exception {
		session.update("cafeReply.update", vo);
	}

	@Override
	public void delete(int reply_no) throws Exception {
		session.update("cafeReply.delete", reply_no);
	}

	@Override
	public List<CafeReplyVO> listPage(int no, Criteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("cafeReply.list", no, bound);
	}

	@Override
	public int count(int no) throws Exception {
		return session.selectOne("cafeReply.count", no);
	}

	@Override
	public int getNo(int reply_no) throws Exception {
		return session.selectOne("cafeReply.getNo", reply_no);
	}

}
