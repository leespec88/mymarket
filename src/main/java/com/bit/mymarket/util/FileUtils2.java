package com.bit.mymarket.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



/**
 * @author "krogoth112"
 *
 */
@Component("fileUtils2")
public class FileUtils2 {
//   private static final String filePath = "C://MM//workspace//mymarket//webapp//images//"; // 파일이 저장될 위치
   			private static final String filePath = "//192.168.1.6//temp//"; // 파일이 저장될 위치
    
   public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
       MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
       Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
        
       MultipartFile multipartFile = null;
       String originalFileName = null;
       String originalFileExtension = null;
       String storedFileName = null;
       
        
       List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();//부분은 클라이언트에서 전송된 파일 정보를 담아서 반환을 해줄 List이다. 여태까지는 단 하나의 파일만 전송을 하였지만, 다중파일전송을 하도록 수정할 계획이기 때문에 미리 그에 맞도록 구성하였다.
       Map<String, Object> listMap = null; 
        
       Long itemNo =(Long)map.get("itemNo");
        
       File file = new File(filePath);
       if(file.exists() == false){ //해당 경로에 없으면 생성
           file.mkdirs();
       }
        
       while(iterator.hasNext()){
           multipartFile = multipartHttpServletRequest.getFile(iterator.next());
           if(multipartFile.isEmpty() == false){
        	   String url = "";
               originalFileName = multipartFile.getOriginalFilename();
               originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
               storedFileName = CommonUtils.getRandomString() + originalFileExtension;
               
               file = new File(filePath + storedFileName);
               url = "/product-images/" + storedFileName;
               multipartFile.transferTo(file);
              
               listMap = new HashMap<String,Object>();
               listMap.put("NO", itemNo);
               //listMap.put("ORIGINAL_FILE_NAME", originalFileName);
               //listMap.put("STORED_FILE_NAME", storedFileName);
               //listMap.put("FILE_SIZE", multipartFile.getSize());
               listMap.put("IMAGE", url);
               list.add(listMap);
           }
       }
       return list;
   }
}