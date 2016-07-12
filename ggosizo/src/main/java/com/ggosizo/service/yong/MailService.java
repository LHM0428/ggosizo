package com.ggosizo.service.yong;

import java.io.Serializable;

public interface MailService extends Serializable {
    void sendMail(String subject, String content, String reciver) throws Exception;
}
