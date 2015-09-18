package com.bit.mymarket.component;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
 

public class test {
	
	public static void main(String[] args){
		String test = "#아무개#아이구? 이 캐릭터는 누구냐?";
		
		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
	    Matcher m = p.matcher(test);
	    String extractHashTag=null;
	    while(m.find()){
	    	extractHashTag= sepcialCharacter_replace(m.group());
	    	if(extractHashTag!=null){
	    		System.out.println("최종 추출 해시태그 :: "+ extractHashTag);
	    		
	    	}
	    }
	}
	public static String sepcialCharacter_replace(String str) {
	    str = StringUtils.replaceChars(str, "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~`） ","");
	 
	    if(str.length() < 1) {
	    return null;
	    }
	 
	    return str;
	}
}
