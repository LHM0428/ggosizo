package com.ggosizo.persistence.jm;

import java.util.List;

import com.ggosizo.domain.jm.Criteria;
import com.ggosizo.domain.jm.QnaReplyVO;



public interface QnaReplyDAO {

	public int insert(QnaReplyVO vo) throws Exception;

	public void update(QnaReplyVO vo) throws Exception;

	public int delete(int reply_no) throws Exception;

	public List<QnaReplyVO> list(int no) throws Exception;// 占쏙옙체占쏙옙회

	public List<QnaReplyVO> listPage(int no, Criteria cri) throws Exception;// 占쏙옙占쏙옙占쏙옙占쏙옙회

	public int count(int no) throws Exception;// 占쏙옙占� 占쏙옙 占쏙옙회
	public int getNo(int reply_no) throws Exception;// 占쏙옙占쏙옙占� 占쏙옙치占쏙옙 占쌜뱄옙호

}
