package com.ggosizo.persistence.yj;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.FestivalReplyVO;

@Repository
public class FestivalReplyDAOImpl implements FestivalReplyDAO{
	@Inject
	SqlSession session;
	
	@Override
	public List<FestivalReplyVO> list(int no) throws Exception {
		return session.selectList("festivalReply.list", no);
	}

	@Override
	public void create(FestivalReplyVO vo) throws Exception {
		session.insert("festivalReply.create", vo);
	}

	@Override
	public void update(FestivalReplyVO vo) throws Exception {
		System.out.println("update vo"+vo);
		session.update("festivalReply.update", vo);
	}

	@Override
	public void delete(int reply_no) throws Exception {
		session.update("festivalReply.delete", reply_no);
	}

	@Override
	public List<FestivalReplyVO> listPage(int no, Criteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("festivalReply.list", no, bound);
	}

	@Override
	public int count(int no) throws Exception {
		return session.selectOne("festivalReply.count", no);
	}

	@Override
	public int getNo(int reply_no) throws Exception {
		return session.selectOne("festivalReply.getNo", reply_no);
	}

}
