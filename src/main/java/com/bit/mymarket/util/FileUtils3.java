package com.bit.mymarket.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.mymarket.vo.UserVo;

@Component("fileUtils3")
public class FileUtils3 {
	private static final String filePath = "//192.168.1.6//temp//"; // 파일이 저장될 위치
	
	   public Map<String,Object> parseInsertFileInfo(UserVo userVo, HttpServletRequest request) throws Exception{
		   Enumeration<String> aa = request.getParameterNames();
		   MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
	       Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	       List<MultipartFile> multipartFile = null;
	       String originalFileName = null;
	       String originalFileExtension = null;
	       String storedFileName = null;
	       
	        
	       Map<String, Object> listMap = null; 
	        
	       File file = new File(filePath);
	       if(file.exists() == false){ //해당 경로에 없으면 생성
	           file.mkdirs();
	       }

	       while(iterator.hasNext()){
	    	   System.out.println("얄라꿍!");
	           multipartFile = multipartHttpServletRequest.getFiles(iterator.next()); //getFiles 이놈이 멀티로 받을수 있게 해줌.  기존 : getFile 
	           
	           if(multipartFile.isEmpty() == false){
	        	   for(int i=0; i<multipartFile.size(); i++){
	        	   
	        	   String url = "";
	        	   
	               originalFileName = multipartFile.get(i).getOriginalFilename();
	               System.out.println("originalFileName" + originalFileName.equals(""));
	               if(originalFileName == ""){
	            	   originalFileName= userVo.getImageURL();
	            	   listMap = new HashMap<String,Object>();
	            	   listMap.put("imageURL",originalFileName);
	            	   return listMap;
	               }
	               originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	               System.out.println("얄라리얄라");
	               storedFileName = CommonUtils.getRandomString() + originalFileExtension;
	               file = new File(filePath + storedFileName);
	               url = "/product-images/" + storedFileName;
	               multipartFile.get(i).transferTo(file);
	               listMap = new HashMap<String,Object>();
	               listMap.put("imageURL", url);
	           
	        	   }
	          
	           }
	           
	       }
	       
	       System.out.println("Rmx"); // false
	       
	       return listMap;
	   }
}
