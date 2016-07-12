package com.ggosizo.spring;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ggosizo.service.yong.MailServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MailTest {

	@Autowired
    private MailServiceImpl emailSender;
	@Test
	public void sendMail() throws Exception{

		String title = "title";
		String content = "content";

		emailSender.sendMail(title, content, "hwesd1596@naver.com");
	}
}
