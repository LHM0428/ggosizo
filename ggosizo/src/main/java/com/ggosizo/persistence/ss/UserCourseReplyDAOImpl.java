package com.ggosizo.persistence.ss;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.Reply;
import com.ggosizo.domain.yj.Criteria;

@Repository
public class UserCourseReplyDAOImpl implements UserCourseReplyDAO {
	
	@Inject
	SqlSession session;
	
	@Override
	public List<Reply> list(int no) throws Exception {
		return session.selectList("userCourseReply.list", no);
	}

	@Override
	public void create(Reply vo) throws Exception {
		session.insert("userCourseReply.create", vo);
	}

	@Override
	public void update(Reply vo) throws Exception {
		session.update("userCourseReply.update", vo);
	}

	@Override
	public void delete(int reply_no) throws Exception {
		session.update("userCourseReply.delete", reply_no);
	}

	@Override
	public List<Reply> listPage(int no, Criteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("userCourseReply.list", no, bound);
	}

	@Override
	public int count(int no) throws Exception {
		return session.selectOne("userCourseReply.count", no);
	}

	@Override
	public int getNo(int reply_no) throws Exception {
		return session.selectOne("userCourseReply.getNo", reply_no);
	}

}
