package com.bit.mymarket.controller;

import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.mymarket.CommandMap;
import com.bit.mymarket.service.ItemsService;
import com.bit.mymarket.vo.ItemPicVo;
import com.bit.mymarket.vo.ItemsVo;

@RequestMapping( "/items" )
@Controller
public class ItemsController {
	
	@Autowired
	private ItemsService itemsService;
	
	@RequestMapping( "itemsinsert" )
	public String index() {
		System.out.println("aa");
		return "/items/itemsinsert";
	}
	
	
	@RequestMapping( "itemsleft" )
	public String mapleft() {
		return "/items/itemsleft";
	}
	@RequestMapping( "itemsright" )
	public String mapright() {
		return "/items/itemsright";
	}
	
	 
	
	@RequestMapping( "/itemsinsert/{lat}/{lng}/{no}" )
	@ResponseBody
	public HashMap<String, String> itemsinsert(@PathVariable String lat, @PathVariable String lng) {
		System.out.println("itemsinsert : " + lat + "lng : " + lng);
		System.out.println("itemsinsert : " + lng + "lat : " + lat);
		HashMap<String, String> items = new HashMap<String, String>();

		items.put("lat", lat );
		items.put("lng", lng);
		System.out.println(items);
		return items;
	}
	
	@RequestMapping( "/itemsinsertview" )
	public String itemsinsertview(@RequestParam("lat") String lat, @RequestParam("lng") String lng, @RequestParam("address") String address, Model model) {
		if(lng == "" || lat == ""){
			return "/items/itemsinsert";
		}
		System.out.println(lat + lng);
		String latlng = lat + "," + lng;
		model.addAttribute("latlng", latlng);
		model.addAttribute("address", address);
		
		return "items/itemsinsertview";
	}
	
	@RequestMapping("/itemsinsertok")
	public String itemsinsertok(){
		return "redirect:/itemsinsertok";
	}

	
//파일 업로드
		// Logger 객체 얻어온다.
	private static final Log LOG = LogFactory.getLog( ItemsController.class );
	
	// 파일 저장 경로
	private static final String SAVE_PATH = "C:\\temp";
	  
	@RequestMapping( "/form" )
	public String form() {
		return "items/form";
	}
	
	@RequestMapping( "/upload" )
	public String upload( @RequestParam String email, 
			/*@RequestParam( "file1" ) MultipartFile file1, 
			@RequestParam( "file2" ) MultipartFile file2,
			@RequestParam( "file3" ) MultipartFile file3,*/
			@RequestParam( "file1" ) MultipartFile file1,
			@RequestParam( "file2" ) MultipartFile file2,
			@RequestParam( "file3" ) MultipartFile file3,
			@RequestParam( "file4" ) MultipartFile file4,
			@RequestParam( "file5" ) MultipartFile file5,
			@RequestParam( "file6" ) MultipartFile file6,
			@RequestParam( "file7" ) MultipartFile file7,
			@RequestParam( "file8" ) MultipartFile file8,
			CommandMap commandMap,
			HttpServletRequest request,
			Model model, ItemsVo itemsVo,
			ItemPicVo itemPicVo ) throws Exception {
		System.out.println(commandMap.getMap());
		System.out.println("file1 : " + file1);
		System.out.println("file2 : " + file2);
		System.out.println("file3 : " + file3);
		System.out.println("file4 : " + file4);
		System.out.println("file5 : " + file5);
		System.out.println("file6 : " + file6);
		System.out.println("file7 : " + file7);
		System.out.println("file8 : " + file8);
		//itemPicVo.setItemNo(itemNo);
		System.out.println();
		
		System.out.println(model);
        model.addAttribute("ItemPicVo", itemPicVo);
        itemsService.insert(itemsVo);        //max(no)를 위해서 인서트 먼저 들어가자!!
        
		// 단순 파라미터 값
		LOG.debug( " ######## email : " + email );

		
		
/*		// 파일 처리 연속으로! 줄여보자!! 8개
		for(int i=1; i<=8; i++){
			MultipartFile file = (MultipartFile)("file"+i);
			System.out.println(file);
				if( file.isEmpty() == false ) {
					
			        String fileOriginalName = (file+i).getOriginalFilename();
			        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
			        String fileName = file.getName();
			        Long size = file.getSize();
			        
			        String saveFileName = genSaveFileName( extName );
			        String url = "/product-images/" + saveFileName;
			
			        LOG.debug( " ######## fileOriginalName : " + fileOriginalName );
			        LOG.debug( " ######## fileName : " + fileName );
			        LOG.debug( " ######## fileSize : " + size );
			        LOG.debug( " ######## fileExtensionName : " + extName );
			        LOG.debug( " ######## saveFileName : " + saveFileName );        
			        
			        //itemsVo.setSaveFile1(url); // 파일명 mapVo에 set해줌
			        writeFile( file, SAVE_PATH, saveFileName );
			      //commandMap.put("file2", url); // commandMap에 file1이라는 이름으로 url을 저장함
			        itemPicVo.setUrl(url);
			        System.out.println("파일처리 : " + itemPicVo);
			        itemsService.insertPic(itemPicVo);
			        model.addAttribute( "productImageUrl"+i, url );
				}

		}*/
		
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
	        
	        //itemsVo.setSaveFile1(url); // 파일명 mapVo에 set해줌
	        writeFile( file1, SAVE_PATH, saveFileName );
	      //commandMap.put("file2", url); // commandMap에 file1이라는 이름으로 url을 저장함
	        itemPicVo.setUrl(url);
	        System.out.println("파일처리 : " + itemPicVo);
	        itemsService.insertPic(itemPicVo);
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
		
		       // itemsVo.setSaveFile2(url); // 파일명 mapVo에 set해줌
		        writeFile( file2, SAVE_PATH, saveFileName );
		        //commandMap.put("file2", url); // commandMap에 file1이라는 이름으로 url을 저장함
		        itemPicVo.setUrl(url);
		        itemsService.insertPic(itemPicVo);
//		        itemsService.insertPic(itemPicVo.getUrl());
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
		
		        //itemsVo.setSaveFile3(url); // 파일명 mapVo에 set해줌
		        writeFile( file3, SAVE_PATH, saveFileName );
		        //commandMap.put("file3", url); // commandMap에 file1이라는 이름으로 url을 저장함
		        itemPicVo.setUrl(url);
		        itemsService.insertPic(itemPicVo);
		        model.addAttribute( "productImageUrl3", url );
			}
			// 네 번째 파일 처리
			if( file4.isEmpty() == false ) {
				
		        String fileOriginalName = file4.getOriginalFilename();
		        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
		        String fileName = file4.getName();
		        Long size = file4.getSize();
		        
		        String saveFileName = genSaveFileName( extName );
		        String url = "/product-images/" + saveFileName;
		
		        LOG.debug( " ######## fileOriginalName : " + fileOriginalName );
		        LOG.debug( " ######## fileName : " + fileName );
		        LOG.debug( " ######## fileSize : " + size );
		        LOG.debug( " ######## fileExtensionName : " + extName );
		        LOG.debug( " ######## saveFileName : " + saveFileName );        
		        
		        //itemsVo.setSaveFile1(url); // 파일명 mapVo에 set해줌
		        writeFile( file4, SAVE_PATH, saveFileName );
		      //commandMap.put("file2", url); // commandMap에 file1이라는 이름으로 url을 저장함
		        itemPicVo.setUrl(url);
		        System.out.println("파일처리 : " + itemPicVo);
		        itemsService.insertPic(itemPicVo);
		        model.addAttribute( "productImageUrl4", url );
			}
			
			// 다섯 번째 파일 처리
				if( file5.isEmpty() == false ) {
					
			        String fileOriginalName = file5.getOriginalFilename();
			        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
			        String fileName = file5.getName();
			        Long size = file5.getSize();
			        
			        String saveFileName = genSaveFileName( extName );
			        String url = "/product-images/" + saveFileName;
			
			        LOG.debug( " ######## fileOriginalName : " + fileOriginalName );
			        LOG.debug( " ######## fileName : " + fileName );
			        LOG.debug( " ######## fileSize : " + size );
			        LOG.debug( " ######## fileExtensionName : " + extName );
			        LOG.debug( " ######## saveFileName : " + saveFileName );        
			
			       // itemsVo.setSaveFile2(url); // 파일명 mapVo에 set해줌
			        writeFile( file5, SAVE_PATH, saveFileName );
			        //commandMap.put("file2", url); // commandMap에 file1이라는 이름으로 url을 저장함
			        itemPicVo.setUrl(url);
			        itemsService.insertPic(itemPicVo);
//			        itemsService.insertPic(itemPicVo.getUrl());
			        model.addAttribute( "productImageUrl5", url );
				}
				
				// 여섯 번째 파일 처리
				if( file6.isEmpty() == false ) {
					
			        String fileOriginalName = file6.getOriginalFilename();
			        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
			        String fileName = file6.getName();
			        Long size = file6.getSize();
			        
			        String saveFileName = genSaveFileName( extName );
			        String url = "/product-images/" + saveFileName;
			
			        LOG.debug( " ######## fileOriginalName : " + fileOriginalName );
			        LOG.debug( " ######## fileName : " + fileName );
			        LOG.debug( " ######## fileSize : " + size );
			        LOG.debug( " ######## fileExtensionName : " + extName );
			        LOG.debug( " ######## saveFileName : " + saveFileName );        
			
			        //itemsVo.setSaveFile3(url); // 파일명 mapVo에 set해줌
			        writeFile( file6, SAVE_PATH, saveFileName );
			        //commandMap.put("file3", url); // commandMap에 file1이라는 이름으로 url을 저장함
			        itemPicVo.setUrl(url);
			        itemsService.insertPic(itemPicVo);
			        model.addAttribute( "productImageUrl6", url );
				}
				// 일곱 번째 파일 처리
				if( file7.isEmpty() == false ) {
					
			        String fileOriginalName = file7.getOriginalFilename();
			        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
			        String fileName = file7.getName();
			        Long size = file7.getSize();
			        
			        String saveFileName = genSaveFileName( extName );
			        String url = "/product-images/" + saveFileName;
			
			        LOG.debug( " ######## fileOriginalName : " + fileOriginalName );
			        LOG.debug( " ######## fileName : " + fileName );
			        LOG.debug( " ######## fileSize : " + size );
			        LOG.debug( " ######## fileExtensionName : " + extName );
			        LOG.debug( " ######## saveFileName : " + saveFileName );        
			        
			        //itemsVo.setSaveFile1(url); // 파일명 mapVo에 set해줌
			        writeFile( file7, SAVE_PATH, saveFileName );
			      //commandMap.put("file2", url); // commandMap에 file1이라는 이름으로 url을 저장함
			        itemPicVo.setUrl(url);
			        System.out.println("파일처리 : " + itemPicVo);
			        itemsService.insertPic(itemPicVo);
			        model.addAttribute( "productImageUrl7", url );
				}
				
				// 여덟 번째 파일 처리
					if( file8.isEmpty() == false ) {
						
				        String fileOriginalName = file8.getOriginalFilename();
				        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
				        String fileName = file8.getName();
				        Long size = file8.getSize();
				        
				        String saveFileName = genSaveFileName( extName );
				        String url = "/product-images/" + saveFileName;
				
				        LOG.debug( " ######## fileOriginalName : " + fileOriginalName );
				        LOG.debug( " ######## fileName : " + fileName );
				        LOG.debug( " ######## fileSize : " + size );
				        LOG.debug( " ######## fileExtensionName : " + extName );
				        LOG.debug( " ######## saveFileName : " + saveFileName );        
				
				       // itemsVo.setSaveFile2(url); // 파일명 mapVo에 set해줌
				        writeFile( file8, SAVE_PATH, saveFileName );
				        //commandMap.put("file2", url); // commandMap에 file1이라는 이름으로 url을 저장함
				        itemPicVo.setUrl(url);
				        itemsService.insertPic(itemPicVo);
//				        itemsService.insertPic(itemPicVo.getUrl());
				        model.addAttribute( "productImageUrl8", url );
					}
					
					
			
			//인서트 들어가자!!!!!!
//			System.out.println("filename : " + file1.getName() + "," +  file2.getOriginalFilename() + "," + file3.getContentType());
//			System.out.println("itemPicVo : " + itemPicVo);
//			System.out.println(commandMap.getMap());
//			System.out.println(commandMap.get("file1"));
//			
//			System.out.println("마지막 itemsVo" + itemsVo);
//			itemsService.insertPic(commandMap.getMap(), request);
				
		
        return "items/itemsinsertok";
	}
	
	private void writeFile( MultipartFile file, String path, String fileName ) {
		System.out.println(path);
		System.out.println(fileName);
		System.out.println(path + "\\" + fileName);
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
