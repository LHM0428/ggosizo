package com.ggosizo.service.ss;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.Reply;
import com.ggosizo.domain.ss.UserCourseReplyVO;
import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.persistence.ss.UserCourseDAO;
import com.ggosizo.persistence.ss.UserCourseReplyDAO;

@Service
public class UserCourseReplyServiceImpl implements UserCourseReplyService {
	@Inject
	UserCourseReplyDAO dao;
	@Inject
	UserCourseDAO UserCourseDAO;
	
	@Override
	public List<Reply> list(int no) throws Exception {
		return dao.list(no);
	}

	@Override
	public int addReply(Reply vo) throws Exception {
		dao.create(vo);
		UserCourseDAO.updateReplyCnt(vo.getNo(), 1);
		return UserCourseDAO.selectDateCourse(vo.getNo()).getCourse_replycnt();
	}

	@Override
	public void update(UserCourseReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public int delete(int reply_no) throws Exception {
		int no = dao.getNo(reply_no);
		dao.delete(reply_no);
		UserCourseDAO.updateReplyCnt(no, -1);
		return UserCourseDAO.selectDateCourse(no).getCourse_replycnt();
	}

	@Override
	public List<Reply> listReplyPage(int no, Criteria cri) throws Exception {
		return dao.listPage(no, cri);
	}

	@Override
	public int count(int no) throws Exception {
		return dao.count(no);
	}

}
