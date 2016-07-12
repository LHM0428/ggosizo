package com.ggosizo.persistence.yong;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ggosizo.domain.yong.UserinfoDTO;
import com.ggosizo.domain.yong.UserinfoVO;

public interface UserinfoDAO {
	public void insertItem(UserinfoVO vo) throws Exception;

	public void deleteItem(UserinfoVO vo) throws Exception;
	
	public void updateItem(UserinfoVO vo) throws Exception;

	public List<UserinfoVO> selectAllItem() throws Exception;

	public UserinfoDTO selectItem(UserinfoDTO dto) throws Exception;

	public int selectCount() throws Exception;

	public int selectCheckId(String id) throws Exception;

	public int selectUserCheck(UserinfoVO vo) throws Exception;

	public List<UserinfoVO> selectPage(int start, int end) throws Exception;
	
	public String findId(UserinfoVO vo) throws Exception;

	public UserinfoVO selectUserIdEmailTel(UserinfoVO vo) throws Exception;
	
	public void UserLogintimeSet(UserinfoVO vo) throws Exception;
	
	
}

/*
public class UserInfoDAO  {
	SqlMapClient smc;

	public UserInfoDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
	}
 
	@Override
	public boolean deleteItem(GgosizoDTO DTO) {
		try {
			smc.queryForObject("userinfo.deleteItem", DTO);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean insertItem(GgosizoDTO DTO) {
		try {
			smc.queryForObject("userinfo.insertItem", DTO);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<GgosizoDTO> selectAllItem() {
		try {
			List<GgosizoDTO> list = smc.queryForList("userinfo.selectAllItem");
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public GgosizoDTO selectItem(GgosizoDTO DTO) {
		try {
			GgosizoDTO dto = (GgosizoDTO) smc.queryForObject("userinfo.selectItem", DTO);
			return dto;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updateItem(GgosizoDTO DTO) {
		try {
			smc.queryForObject("userinfo.updateItem", DTO);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	
	   
	@Override
	public int selectCount() {
		int cnt=0;
		   try {
			  cnt=(int) smc.queryForObject("userinfo.selectCount");
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }
		   return cnt;
	}
	
	public int selectCheckId(String id){
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("userinfo.selectCheckId",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int selectUserCheck(GgosizoDTO DTO){
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("userinfo.selectUserCheck",DTO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	public List<GgosizoDTO> selectPage(int start, int end){
		   List<GgosizoDTO> list = new ArrayList<>();
		   try {
			  Map<String, Integer> map = new HashMap<>();
			  	map.put("start", start);
			  	map.put("end", end);
			   list = smc.queryForList("userinfo.selectPage", map);
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }
		   return list;
	   }//selectPage
	
	
	 
	public String findId(GgosizoDTO DTO) {
		try {
			String id = (String) smc.queryForObject("userinfo.findId", DTO);
			return id;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	
}
*/