package com.ggosizo.service.yong;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.yong.ManageVO;
import com.ggosizo.domain.yong.UserinfoVO;
import com.ggosizo.persistence.yong.ManageDAO;

@Service
public class ManageServiceImpl implements ManageService{
	
	@Inject
	private ManageDAO mdao;

	@Override
	public int manageCheck(ManageVO vo) throws Exception {
		return mdao.manageCheck(vo);
	}

	@Override
	public void deleteItem(UserinfoVO vo) throws Exception {
		mdao.deleteItem(vo);
	}
	
	

}
