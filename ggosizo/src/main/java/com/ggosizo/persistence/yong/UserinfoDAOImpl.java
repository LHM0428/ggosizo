package com.ggosizo.persistence.yong;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.yong.UserinfoDTO;
import com.ggosizo.domain.yong.UserinfoVO;

@Repository
public class UserinfoDAOImpl implements UserinfoDAO{
	
	@Inject
	private SqlSessionTemplate sqlsession;
	
	@Override
	public void insertItem(UserinfoVO vo) throws Exception{
		sqlsession.selectOne("userinfo.insertItem",vo);
	}

	@Override
	public void deleteItem(UserinfoVO vo) throws Exception{
		sqlsession.selectOne("userinfo.deleteItem",vo);
	}
	@Override
	public void updateItem(UserinfoVO vo) throws Exception{
		sqlsession.selectOne("userinfo.updateItem",vo);
	}
	@Override
	public List<UserinfoVO> selectAllItem() throws Exception{
		List<UserinfoVO> list = sqlsession.selectList("userinfo.selectAllItem");
		
		return list;
	}

	@Override
	public UserinfoDTO selectItem(UserinfoDTO dto) throws Exception{
		return sqlsession.selectOne("userinfo.selectItem",dto);
	}

	

	@Override
	public int selectCount() throws Exception{
		return sqlsession.selectOne("userinfo.selectCount");
	}

	@Override
	public int selectCheckId(String id) throws Exception{
		return sqlsession.selectOne("userinfo.selectCheckId",id);
	}

	@Override
	public int selectUserCheck(UserinfoVO vo) throws Exception{
		return sqlsession.selectOne("userinfo.selectUserCheck",vo);
	}

	@Override
	public List<UserinfoVO> selectPage(int start, int end) throws Exception{
		Map<String,Object> map = new HashMap<>();
		
		map.put("start", start);
		map.put("end",end);
		return sqlsession.selectList("userinfo.selectPage",map);
	}

	@Override
	public String findId(UserinfoVO vo) throws Exception{
		return sqlsession.selectOne("userinfo.findId",vo);
	}

	@Override
	public UserinfoVO selectUserIdEmailTel(UserinfoVO vo) throws Exception {
		return sqlsession.selectOne("userinfo.selectUserIdEmailTel",vo);
	}

	@Override
	public void UserLogintimeSet(UserinfoVO vo) throws Exception {
		sqlsession.update("userinfo.UserLogintimeSet",vo);
	}

	
	
}
