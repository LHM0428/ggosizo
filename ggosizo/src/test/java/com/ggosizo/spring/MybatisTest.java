package com.ggosizo.spring;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MybatisTest {
	@Inject
	private SqlSessionFactory ssf;
	
	@Test
	public void testFactory(){
		System.out.println("my sessionFactory Test : " + ssf);
	}
	
	@Test
	public void testSession(){
		try(SqlSession sqls = ssf.openSession()){
			System.out.println("my sqlSession Test : " + sqls);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
