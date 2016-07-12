package com.ggosizo.service.yong;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.yong.UserinfoDTO;
import com.ggosizo.domain.yong.UserinfoVO;
import com.ggosizo.persistence.yong.UserinfoDAO;

@Service
public class UserinfoServiceImpl implements UserinfoService{
	@Inject
	private UserinfoDAO udao; 
	@Override
	public void insertItem(UserinfoVO vo) throws Exception {
		udao.insertItem(vo);
	}

	@Override
	public void deleteItem(UserinfoVO vo) throws Exception {
		udao.deleteItem(vo);
	}

	@Override
	public void updateItem(UserinfoVO vo) throws Exception {
		udao.updateItem(vo);
	}

	@Override
	public List<UserinfoVO> selectAllItem() throws Exception {
		return udao.selectAllItem();
	}

	@Override
	public UserinfoDTO selectItem(UserinfoDTO dto) throws Exception {
		return udao.selectItem(dto);
	}

	@Override
	public int selectCount() throws Exception {
		return udao.selectCount();
	}

	@Override
	public int selectCheckId(String id) throws Exception {
		return udao.selectCheckId(id);
	}

	@Override
	public int selectUserCheck(UserinfoVO vo) throws Exception {
		return udao.selectUserCheck(vo);
	}

	@Override
	public List<UserinfoVO> selectPage(int start, int end) throws Exception {
		return udao.selectPage(start, end);
	}

	@Override
	public String findId(UserinfoVO vo) throws Exception {
		return udao.findId(vo);
	}

	@Override
	public UserinfoVO selectUserIdEmailTel(UserinfoVO vo) throws Exception {
		return udao.selectUserIdEmailTel(vo);
	}

	@Override
	public void UserLogintimeSet(UserinfoVO vo) throws Exception {
		udao.UserLogintimeSet(vo);
	}

	

}
