package com.ggosizo.persistence.hm;

import java.util.List;

public interface SidoDAO {
  
	public List<String> selectSido();
	public List<String> selectGugun(String sido);
	public List<String> selectDong(String dong);
	
}
