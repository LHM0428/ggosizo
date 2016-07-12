package com.ggosizo.security.yong;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.codehaus.plexus.util.Base64;


public class PasswordEncoder {

	private Cipher cipher;
	private byte[] encryptedData;
	private byte[] plainText;
	private Key secureKey;
	private String mypw;

	public PasswordEncoder(String id) {
		this.mypw = id.substring(0,6);
		this.mypw = this.mypw.concat("ggosizo_us");
		secureKey = new SecretKeySpec(mypw.getBytes(), "AES");
	}

	public String enctyped(String pw) throws Exception {
		
		cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, secureKey);
		encryptedData = cipher.doFinal(pw.getBytes());
		String enStr = new String(Base64.encodeBase64(encryptedData));
		return enStr;
	}

	public String decrypted(String encrypted) throws Exception {
		cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, secureKey);
		plainText = cipher.doFinal(Base64.decodeBase64(encrypted.getBytes()));
		System.err.println(new String(plainText));
		return new String(plainText);
	}

		 
}
