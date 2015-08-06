package com.tjs.admin.system.utils;

import java.util.*;
import java.io.*;

import org.apache.commons.codec.Charsets;
import org.apache.commons.io.IOUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tjs.admin.utils.DateTimeUtils;


public class FileUtil {
	
	private static String systemPath = null;
	
	
	public static String getSystemPath(){
		if(systemPath ==null){
			String path = FileUtil.class.getResource("/").getPath();
			
			String p = path.substring(0,
					path.indexOf("/WEB-INF/classes"))
					+ File.separator +"temp"+ File.separator ;
			if (p.contains("%20")) {
				p = p.replaceAll("%20", " ");
			}
			systemPath = p;
		}
		return systemPath;

	}
	/***
	 * 将fileName的文件内容变为list String
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException 
	 */
	public static List<String> readFileToLines(String fileName) throws IOException {
		List<String> lines = new LinkedList<String>();
		String line = "";
	
		BufferedReader in = new BufferedReader(new FileReader(fileName));
		while ((line = in.readLine()) != null) {
			lines.add(line);
		}
		closeQuietly(in);
		
		return lines;
	}

	/**
	 * write data 
	 * @param data
	 * @param output
	 * @throws IOException
	 */
    public static void write(byte[] data, Writer output) throws IOException {
        if (data != null) {
        	output.write(new String(data, Charsets.UTF_8));
        }
    }
    
    
    /**
     * copy file
     * @param oldPath
     * @param newPath
     * @throws IOException
     */
    public static void copyFile(String oldPath,String newPath) throws IOException {
    	//读入原文件 
    	InputStream in = new FileInputStream(oldPath); 
        FileOutputStream out = new FileOutputStream(newPath); 
        IOUtils.copy(in, out);
        IOUtils.closeQuietly(in);
        IOUtils.closeQuietly(out);
    }

	/***
	 * delete
	 * 
	 * @param file
	 */
	public static void deleteQuietly(File file) {
		if(file.exists()){
			file.delete();
		}
		
	}
	/***
	 * close
	 * 
	 * @param closeable
	 */
	public static void closeQuietly(Closeable closeable) {
		try {
			if (closeable != null) {
				closeable.close();
			}
		} catch (IOException ioe) {
			// ignore
		}
	}
	/**
	 * make file Director
	 * 
	 * @param path
	 */
	public static void fileDirMake(String path) {
		//
		File fileDir = new File(path);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
	}
	/***
	 * file upload deal.
	 * 
	 * @param request
	 * @return
	 * @throws Exception 
	 * @throws WiFiException
	 */
	public static String updateFile(MultipartHttpServletRequest request,
			String path,String fileTypes) throws Exception {
		Map<String, MultipartFile> fileMaps = request.getFileMap();
		fileDirMake(path);
		String saveName ="";
		String originaFileName ="";
		try {
			boolean isEmpty = true;
			for (String fileName:fileMaps.keySet()) {
				MultipartFile file = fileMaps.get(fileName);
				if (file.getSize() != 0) {
					isEmpty = false;
					originaFileName = file.getOriginalFilename();
					String fileType="";
					if(originaFileName.lastIndexOf(".")>0){
						fileType = originaFileName.substring(originaFileName
								.lastIndexOf("."));
					}
					if (!fileTypes.toLowerCase().contains(fileType.substring(1).toLowerCase())) {
						throw new Exception("文件类型不支持，只支持：" + fileTypes);
					}
					String realName = DateTimeUtils.formatDate(new Date(),
							"yyyyMMddHHmmss");
					File newFile = new File(path + realName + fileType);
					int i=0;
					while (newFile.exists()) {
						realName = realName+"."+i;
						newFile = new File(path + realName + fileType);
						if(i>=10){
							break;
						}
					}
					saveName = realName + fileType;
					file.transferTo(new File(path + saveName));
					break;
				}
			}
			if(isEmpty){
				throw new Exception("文件内容是空的");
			}
		} catch (java.lang.OutOfMemoryError e1) {
			throw new Exception("文件过大");
		} catch (Exception e) {
			throw e;
		} 
		return saveName + "," + originaFileName;
	}
}
