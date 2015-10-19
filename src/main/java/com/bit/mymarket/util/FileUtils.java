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

/**
 * @author "krogoth112"
 *
 */
@Component("fileUtils")
public class FileUtils {
	// private static final String filePath =
	private static final String filePath = "//192.168.1.6//temp//"; // 파일이 저장될 위치
																	

	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request)
			throws Exception {

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		List<MultipartFile> multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		File file = new File(filePath);
		if (file.exists() == false) { // 해당 경로에 없으면 생성
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFiles(iterator
					.next()); // getFiles 이놈이 멀티로 받을수 있게 해줌. 기존 : getFile
			if (multipartFile.isEmpty() == false) {
				for (int i = 0; i < multipartFile.size(); i++) {
					String url = "";
					originalFileName = multipartFile.get(i)
							.getOriginalFilename();
					originalFileExtension = originalFileName
							.substring(originalFileName.lastIndexOf("."));
					storedFileName = CommonUtils.getRandomString()
							+ originalFileExtension;

					file = new File(filePath + storedFileName);
					url = "/product-images/" + storedFileName;
					multipartFile.get(i).transferTo(file);

					listMap = new HashMap<String, Object>();
					listMap.put("BOARD_NO", map.get("no"));
					listMap.put("IMAGE", url);
					list.add(listMap);
				}
			}
		}
		return list;
	}
}