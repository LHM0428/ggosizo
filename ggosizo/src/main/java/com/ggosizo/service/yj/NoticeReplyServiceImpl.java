package com.ggosizo.service.yj;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.NoticeReplyVO;
import com.ggosizo.persistence.yj.NoticeDAO;
import com.ggosizo.persistence.yj.NoticeReplyDAO;


@Service
public class NoticeReplyServiceImpl implements NoticeReplyService {
	@Inject
	NoticeReplyDAO dao;
	@Inject
	NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeReplyVO> list(int no) throws Exception {
		return dao.list(no);
	}

	@Override
	public int addReply(NoticeReplyVO vo) throws Exception {
		dao.create(vo);
		noticeDAO.updateReplyCnt(vo.getNo(), 1);
		return noticeDAO.select(vo.getNo()).getNotice_replycnt();
	}

	@Override
	public void update(NoticeReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public int delete(int reply_no) throws Exception {
		int no = dao.getNo(reply_no);
		dao.delete(reply_no);
		noticeDAO.updateReplyCnt(no, -1);
		return noticeDAO.select(no).getNotice_replycnt();
	}

	@Override
	public List<NoticeReplyVO> listReplyPage(int no, Criteria cri) throws Exception {
		return dao.listPage(no, cri);}

	@Override
	public int count(int no) throws Exception {
		return dao.count(no);
	}

}
