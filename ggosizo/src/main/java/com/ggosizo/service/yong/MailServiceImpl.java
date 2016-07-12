package com.ggosizo.service.yong;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class MailServiceImpl implements MailService {

	@Autowired
	protected JavaMailSender mailSender;

	@Override
	public void sendMail(String subject, String content, String reciver) throws Exception {
		MimeMessage msg = mailSender.createMimeMessage();
		msg.setSubject(subject);
		msg.setText(content,"euc-kr");
		msg.setRecipient(RecipientType.TO, new InternetAddress(reciver));

		mailSender.send(msg);

	}

}