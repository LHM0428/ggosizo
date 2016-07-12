package com.ggosizo.spring;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ggosizo.persistence.yong.ManageAdvDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class SmapleMapperTest {
	
	@Inject
	private ManageAdvDAO dao;
	
	@Test
	public void Test() throws Exception{
		
		System.out.println(dao.getTime()); 
	}

}
