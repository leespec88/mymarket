package com.bit.mymarket.controller;

import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping( "/map" )
@Controller
public class MapController {
	
	@RequestMapping( "" )
	public String index() {
		System.out.println("aa");
		return "/map/mapinsert";
	}
	
	
	
	@RequestMapping( "/mapinsert/{lat}/{lng}/{no}" )
	@ResponseBody
	public HashMap<String, String> mapinsert(@PathVariable String lat, @PathVariable String lng) {
		System.out.println("mapinsert : " + lat + "lng : " + lng);
		System.out.println("mapinsert : " + lng + "lat : " + lat);
		HashMap<String, String> map = new HashMap<String, String>();
		/*if(lat == null || lng == null){
			return map;
		}*/
		/*map.put("lat", lat);
		map.put("lng", lng);*/
		map.put("lat", lat );
		map.put("lng", lng);
		System.out.println(map);
		//return map;
		return map;
	}
	
	@RequestMapping( "/mapinsertview" )
	public String mapinsertview(@RequestParam("lat") String lat, @RequestParam("lng") String lng, Model model) {
		//System.out.println("mapinsertview : " + lat + " : " + lng);
		//System.out.println(lat.equals(" "));
		//System.out.println(lng.equals(""));
		if(lng == "" || lat == ""){
			
			return "/map/mapinsert";
		}
		System.out.println("mapinsertview");
		System.out.println(lat + lng);
		
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		
		return "map/mapinsertview";
	}
	
	
	/*
@RequestMapping("/checkemail")
// {"result":"exist"}
// {"result":"not exist"}

[
  {"title":"자바 이해", "desc":"자바 기초 다지기", "author":"오동선"},
  {"title":"제이쿼리 이해", "desc":"제이쿼리 업그레이드", "author":"사동선"}
]

	@ResponseBody
	public HashMap checkEmail(@RequestParam("email") String email) {
		System.out.println("email : " + email);
		String reusltedemail = userService.getByEmail(email);
		System.out.println("reusltedemail : " + reusltedemail);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", (reusltedemail == null) ? "not exist" : "exist");
		System.out.println("map : " + map);
		return map;
	}
*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//파일 업로드
		// Logger 객체 얻어온다.
	private static final Log LOG = LogFactory.getLog( MapController.class );
	
	// 파일 저장 경로
	private static final String SAVE_PATH = "C:\\temp";
	  
	@RequestMapping( "/form" )
	public String form() {
		return "map/form";
	}
	
	@RequestMapping( "/upload" )
	public String upload( @RequestParam String email, 
			@RequestParam( "file1" ) MultipartFile file1, 
			@RequestParam( "file2" ) MultipartFile file2,
			@RequestParam( "file3" ) MultipartFile file3,
			Model model ) {
        
		// 단순 파라미터 값
		LOG.debug( " ######## email : " + email );

		// 첫 번째 파일 처리
		if( file1.isEmpty() == false ) {
			
	        String fileOriginalName = file1.getOriginalFilename();
	        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
	        String fileName = file1.getName();
	        Long size = file1.getSize();
	        
	        String saveFileName = genSaveFileName( extName );
	        String url = "/product-images/" + saveFileName;
	
	        LOG.debug( " ######## fileOriginalName : " + fileOriginalName );
	        LOG.debug( " ######## fileName : " + fileName );
	        LOG.debug( " ######## fileSize : " + size );
	        LOG.debug( " ######## fileExtensionName : " + extName );
	        LOG.debug( " ######## saveFileName : " + saveFileName );        
	
	        writeFile( file1, SAVE_PATH, saveFileName );
	        
	        model.addAttribute( "productImageUrl1", url );
		}
		
		// 두 번째 파일 처리
			if( file2.isEmpty() == false ) {
				
		        String fileOriginalName = file2.getOriginalFilename();
		        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
		        String fileName = file2.getName();
		        Long size = file2.getSize();
		        
		        String saveFileName = genSaveFileName( extName );
		        String url = "/product-images/" + saveFileName;
		
		        LOG.debug( " ######## fileOriginalName : " + fileOriginalName );
		        LOG.debug( " ######## fileName : " + fileName );
		        LOG.debug( " ######## fileSize : " + size );
		        LOG.debug( " ######## fileExtensionName : " + extName );
		        LOG.debug( " ######## saveFileName : " + saveFileName );        
		
		        writeFile( file2, SAVE_PATH, saveFileName );
		        
		        model.addAttribute( "productImageUrl2", url );
			}
			
			// 세 번째 파일 처리
			if( file3.isEmpty() == false ) {
				
		        String fileOriginalName = file3.getOriginalFilename();
		        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
		        String fileName = file3.getName();
		        Long size = file3.getSize();
		        
		        String saveFileName = genSaveFileName( extName );
		        String url = "/product-images/" + saveFileName;
		
		        LOG.debug( " ######## fileOriginalName : " + fileOriginalName );
		        LOG.debug( " ######## fileName : " + fileName );
		        LOG.debug( " ######## fileSize : " + size );
		        LOG.debug( " ######## fileExtensionName : " + extName );
		        LOG.debug( " ######## saveFileName : " + saveFileName );        
		
		        writeFile( file3, SAVE_PATH, saveFileName );
		        
		        model.addAttribute( "productImageUrl3", url );
			}
			
				
				
		
        return "map/result";
	}
	
	private void writeFile( MultipartFile file, String path, String fileName ) {
		FileOutputStream fos = null;
		try {
			byte fileData[] = file.getBytes();
			fos = new FileOutputStream( path + "\\" + fileName );
			fos.write(fileData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}
			}
		}
	}
	
	private String genSaveFileName( String extName ) {
		
        Calendar calendar = Calendar.getInstance();
		String fileName = "";
        
        fileName += calendar.get( Calendar.YEAR );
        fileName += calendar.get( Calendar.MONTH );
        fileName += calendar.get( Calendar.DATE );
        fileName += calendar.get( Calendar.HOUR );
        fileName += calendar.get( Calendar.MINUTE );
        fileName += calendar.get( Calendar.SECOND );
        fileName += calendar.get( Calendar.MILLISECOND );
        fileName += ( "." + extName );
        
        return fileName;
	}
//파일업로드 close
}
