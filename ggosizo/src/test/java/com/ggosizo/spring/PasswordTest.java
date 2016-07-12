package com.ggosizo.spring;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class PasswordTest {
	private static String message = "myggosizo";

	public void test() throws Exception {
		KeyGenerator kgen = KeyGenerator.getInstance("AES");
		kgen.init(128);

		SecretKey skey = kgen.generateKey();

		SecretKeySpec skeySpec = new SecretKeySpec(skey.getEncoded(), "AES");
		Cipher cipher = Cipher.getInstance("AES");

		cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
		byte[] encrypted = cipher.doFinal(message.getBytes());

		cipher.init(Cipher.DECRYPT_MODE, skeySpec);
		byte[] original = cipher.doFinal(encrypted);
		String originalString = new String(original);
		System.err.println("Original String : " + originalString + " " + String.valueOf(original));
	}

	@Test
	public void test2() throws Exception {

		Key secureKey = new SecretKeySpec("ggosizo_user_key".getBytes(), "AES");
		
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, secureKey);
		byte[] encryptedData = cipher.doFinal("123123".getBytes());
		System.err.println(encryptedData.toString());
		
		cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, secureKey);
		byte[] plainText = cipher.doFinal(encryptedData.toString().getBytes());
		System.err.println(new String(plainText));
	}
	
	
}
