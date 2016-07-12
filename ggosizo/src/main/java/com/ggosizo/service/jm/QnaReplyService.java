package com.ggosizo.service.jm;

import java.util.List;

import com.ggosizo.domain.jm.Criteria;
import com.ggosizo.domain.jm.QnaReplyVO;


public interface QnaReplyService {

	public int insert(QnaReplyVO vo) throws Exception;

	public void update(QnaReplyVO vo) throws Exception;

	public void delete(int reply_no) throws Exception;

	public List<QnaReplyVO> list(int no) throws Exception;

	public List<QnaReplyVO> listPage(int no, Criteria cri) throws Exception;

	public int count(int no) throws Exception;
}
