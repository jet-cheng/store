package com.store.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Tools {

	// MD5加密
	public static String MD5Encrypt(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte[] b = md.digest();

			int i;
			StringBuilder buf = new StringBuilder("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			return buf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}

	// 进行两次MD5加密
	public static String doubleMD5Encrypt(String str) {
		return MD5Encrypt(MD5Encrypt(str));
	}
	
	public static void main(String[] args) {
		System.out.println(doubleMD5Encrypt("admin"));
	}
	
}
