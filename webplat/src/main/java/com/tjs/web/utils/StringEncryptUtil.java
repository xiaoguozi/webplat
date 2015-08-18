package com.tjs.web.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/**
 * 生成随机密码、SHA-256加密之類
 * @author Administrator
 *
 */
public class StringEncryptUtil {
	
	/**
	 * 对字符串加密,加密算法使用MD5,SHA-1,SHA-256,默认使用SHA-256
	 * 
	 * @param strSrc
	 *            要加密的字符串
	 * @param encName
	 *            加密类型
	 * @return
	 */
	public static String encrypt(String strSrc, String encName) {
		MessageDigest md = null;
		String strDes = null;

		byte[] bt = strSrc.getBytes();
		try {
			if (encName == null || encName.equals("")) {
				encName = "SHA-256";
			}
			md = MessageDigest.getInstance(encName);
			md.update(bt);
			strDes = bytes2Hex(md.digest()); // to HexString
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
		return strDes;
	}

	public static String bytes2Hex(byte[] bts) {
		String des = "";
		String tmp = null;
		for (int i = 0; i < bts.length; i++) {
			tmp = (Integer.toHexString(bts[i] & 0xFF));
			if (tmp.length() == 1) {
				des += "0";
			}
			des += tmp;
		}
		return des;
	}

	public static String genRandomNum(int pwd_len){  
		  //35是因为数组是从0开始的，26个字母+10个数字  
		  final int  maxNum = 36;  
		  int i;  //生成的随机数  
		  int count = 0; //生成的密码的长度  
		  char[] str = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',  
		    'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',  
		    'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };  
		    
		  StringBuffer pwd = new StringBuffer("");  
		  Random r = new Random();  
		  while(count < pwd_len){  
		   //生成随机数，取绝对值，防止生成负数，  
		     
		   i = Math.abs(r.nextInt(maxNum));  //生成的数最大为36-1  
		     
		   if (i >= 0 && i < str.length) {  
		    pwd.append(str[i]);  
		    count ++;  
		   }  
		  }  
		    
		  return pwd.toString();  
		 }  
}
