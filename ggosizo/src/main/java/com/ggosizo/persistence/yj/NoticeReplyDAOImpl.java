package com.ggosizo.persistence.yj;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.NoticeReplyVO;


@Repository
public class NoticeReplyDAOImpl implements NoticeReplyDAO {

	@Inject
	private SqlSession session;

	@Override
	public List<NoticeReplyVO> list(int no) throws Exception {
		return session.selectList("notice_reply.list", no);
		}

	@Override
	public void create(NoticeReplyVO vo) throws Exception {
		session.insert("notice_reply.create", vo);
	}

	@Override
	public void update(NoticeReplyVO vo) throws Exception {
		session.update("notice_reply.update", vo);
	}

	@Override
	public void delete(int reply_no) throws Exception {
		session.update("notice_reply.delete", reply_no);
	}

	@Override
	public List<NoticeReplyVO> listPage(int no, Criteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("notice_reply.list", no, bound);
	}

	@Override
	public int count(int no) throws Exception {
		return session.selectOne("notice_reply.count", no);
	}

	@Override
	public int getNo(int reply_no) throws Exception {
		return session.selectOne("notice_reply.getNo", reply_no);
	}
	
	

}



