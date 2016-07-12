package com.ggosizo.spring;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MysSQLConnectionTest {
private static final String DRIVER = "com.mysql.jdbc.Driver";
private static final String URL ="jdbc:mysql://127.0.0.1:3306/book_ex";
private static final String USER = "zerock";
private static final String PW = "javaemong";

@Test
public void testConnetction() throws Exception{
	Class.forName(DRIVER);
	
	try(Connection conn = DriverManager.getConnection(URL,USER,PW)){
			
			System.out.println(conn);
	}catch(Exception e){
		e.printStackTrace();
	}
			
}

}
