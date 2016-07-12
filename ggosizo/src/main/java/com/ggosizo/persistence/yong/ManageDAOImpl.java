package com.ggosizo.persistence.yong;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.yong.ManageVO;
import com.ggosizo.domain.yong.UserinfoVO;
@Repository
public class ManageDAOImpl implements ManageDAO {
	@Inject
	private SqlSession sqlsession;

	@Override
	public int manageCheck(ManageVO vo) throws Exception{
		
		return sqlsession.selectOne("manage.manageCheck",vo);
	}

	@Override
	public void deleteItem(UserinfoVO vo) throws Exception {
		sqlsession.delete("manage.deleteItem",vo);
		
	}
	
	
}
