package com.cmpe281.multitenant.Utility;

import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.mongodb.util.Base64Codec;

public class Utility {
	
	//Method to encrypt the given plain text
	public static String getEncryptedValue(String plainText){
		String hashedValue = "";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			md.update(plainText.getBytes("UTF-16"));
			byte rawByte[] = md.digest();
			hashedValue= (new Base64Codec()).encode(rawByte);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hashedValue;
	}
	
	public static String convertDateToMMDDYYYYFormat(Date date){
		 SimpleDateFormat dateformatMMDDYYYY = new SimpleDateFormat("MM/dd/yyyy");
		 String dateStr = dateformatMMDDYYYY.format(date);
		 return dateStr;
	}
	
	public static Date convertMMDDYYYYFormatToDate(String str) {
		
		 SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy"); 
		  Date convertedDate = null;
		try {
			convertedDate = dateFormat.parse(str);
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return convertedDate; 
		    
	}
}
