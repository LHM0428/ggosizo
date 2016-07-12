package com.ggosizo.persistence.jm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.jm.Criteria;
import com.ggosizo.domain.jm.QnaReplyVO;





@Repository
public class QnaReplyDAOImpl implements QnaReplyDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public int insert(QnaReplyVO vo) throws Exception {//占쏙옙占� 占쌜쇽옙(insert)
        return session.insert("qna_reply.insert",vo);
	}

	@Override
	public void update(QnaReplyVO vo) throws Exception {//占쏙옙占� 占쏙옙占쏙옙
        session.update("qna_reply.update",vo);
	}
 
	@Override
	public int delete(int reply_no) throws Exception {//占쏙옙占� 占쏙옙占쏙옙
        
		return session.delete("qna_reply.delete",reply_no);
        
     
	}
	

	@Override
	public List<QnaReplyVO> list(int no) throws Exception {//占쏙옙占� 占쏙옙회		
		return session.selectList("qna_reply.list",no);
	}

	@Override
	public List<QnaReplyVO> listPage(int no,Criteria cri) throws Exception {//占쏙옙占� 占쏙옙占쏙옙占쏙옙占쏙옙회
		RowBounds bounds= new RowBounds(cri.getPageStart(), 
				                       cri.getPerPageNum());
		//1占쏙옙占쏙옙占쏙옙:(0,10)   2占쏙옙占쏙옙占쏙옙:(10,10)    3占쏙옙占쏙옙占쏙옙:(20,10)
		
		return session.selectList("qna_reply.list",no,bounds);
	}

	@Override
	public int count(int no) throws Exception {		
		return session.selectOne("qna_reply.count",no);
	}

	@Override
	public int getNo(int reply_no) throws Exception {
		return session.selectOne("qna_reply.getNo",reply_no);
	}

	
	}



