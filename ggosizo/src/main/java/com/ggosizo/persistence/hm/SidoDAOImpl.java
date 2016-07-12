package com.ggosizo.persistence.hm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SidoDAOImpl implements SidoDAO{
	 
	@Inject
	private SqlSession session;
	
	public List<String> selectSido(){
		return session.selectList("sido.selectSido");
		
	}
	public List<String> selectGugun(String sido){
		return session.selectList("sido.selectGugun", sido);
	}
	public List<String> selectDong(String gugun){
		return session.selectList("sido.selectDong", gugun);
	}
}
