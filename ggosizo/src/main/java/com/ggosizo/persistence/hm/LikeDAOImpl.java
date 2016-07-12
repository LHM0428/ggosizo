package com.ggosizo.persistence.hm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.hm.UserLikeCourseVO;

@Repository
public class LikeDAOImpl implements LikeDAO {
	
	@Inject
	SqlSession session;

	@Override
	public void insertLikeTable(UserLikeCourseVO vo) {
		System.out.println(vo);	
	    session.insert("like.insertLike",vo);
	}

	@Override
	public void deleteLikeTable(UserLikeCourseVO vo) {
		session.delete("like.deleteLike", vo);		
	}

	@Override
	public boolean checkLike(UserLikeCourseVO vo) {
		boolean check=false;
		if((int)session.selectOne("like.checkLike", vo)>0){
			check=true;
		}
		return check;
	}

	@Override
	public List<UserLikeCourseVO> userLikeList(String u_id) {
		return session.selectList("like.userLikeList", u_id);
	}

}
