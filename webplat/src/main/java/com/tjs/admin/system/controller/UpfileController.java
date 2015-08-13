package com.tjs.admin.system.controller;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.tjs.admin.system.service.impl.UploadFileService;
import com.tjs.admin.system.utils.FileUtil;

/**
 * Created by Administrator on 2015/1/13.
 */
@Controller
@RequestMapping("/web/system/upfile")
public class UpfileController {
    
	@Resource
	private UploadFileService uploadFileService;
    /***
     * 文件上传
     * @param request
     * @return
     * @throws Exception 
     */
    @RequestMapping("uploadFile")
    @ResponseBody
    public Map<String,Object> uploadFile(HttpServletRequest request) throws Exception{
    	Map<String,Object>  map = new HashMap<String,Object>();
        //获取图片用途
        uploadExecute(request, map, "head");
          
        return map;
    }
    
    
    /***
     * 文件上传
     * @param request
     * @return
     * @throws Exception 
     */
    @RequestMapping("uploadRich")
    public void  uploadRich(HttpServletRequest request,HttpServletResponse response) throws Exception{
    	Map<String,Object>  map = new HashMap<String,Object>();    	
        //获取图片用途
        uploadExecute(request, map, "head");
        JSONObject obj = new JSONObject();
        obj.put("error", 0);
		obj.put("url",  request.getContextPath()+"/rest/web/system/upfile/viewImage?imageName="+map.get("url"));
		response.getOutputStream().println(obj.toJSONString());
    }

    /***
     * 查看文件
     * @param imageName
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("viewImage")
    public void viewImage(HttpServletRequest request,HttpServletResponse response){
    	String imageName = request.getParameter("imageName");
    	OutputStream os = null;
    	try {
    		if(StringUtils.isEmpty(imageName)){
    			imageName ="500";
    		}
    		os = response.getOutputStream();
    		Map<String,Object> fileInfo = uploadFileService.getFileInfo(imageName);
    		if(fileInfo!=null){
    			byte[] info = (byte[])fileInfo.get("fileInfo");
    			ByteArrayInputStream is = new ByteArrayInputStream(info);
    			IOUtils.copy(is, os);
    			
    			if(null != os){
        			os.flush();
        		}
    			
    			is.close();
    			os.close();
    		}
    		
        } catch (IOException e) {
        	
        } catch (Exception e){
        	
        }
    }
    
    
    /***
     * 查看文件
     * @param imageName
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("downFile")
    public void downFile(HttpServletRequest request,HttpServletResponse response){   	    
    	String imageName = request.getParameter("imageName");
    	OutputStream os = null;
    	try {
    		if(StringUtils.isEmpty(imageName)){
    			imageName ="500";
    		}
    		os = response.getOutputStream();
    	  Map<String,Object> fileInfo = uploadFileService.getFileInfo(imageName);
    	  response.setContentType("application/x-msdownload");  
    	  String fileName=new String(((String)fileInfo.get("oldName")).getBytes("GBK"),"ISO8859_1");
      	  response.setHeader("Content-Disposition","attachment;filename="  
      	                   + fileName);
    		if(fileInfo!=null){
    			byte[] info = (byte[])fileInfo.get("fileInfo");
    			ByteArrayInputStream is = new ByteArrayInputStream(info);
    			IOUtils.copy(is, os);
    			
    			if(null != os){
        			os.flush();
        		}
    			
    			is.close();
    			os.close();
    		}

        } catch (IOException e) {
        	
        } catch (Exception e){
        	
        }
    }


    /***
     * Uedit使用的数据
     * @param request
     * @return
     * @throws Exception 
     */
    @RequestMapping(value ="uploadInit")
    @ResponseBody
    public Map<String,Object> uploadInit(HttpServletRequest request) throws Exception {
		if ("upload".equals(request.getParameter("action"))) {
			return this.uploadFile(request);
		}
        Map<String,Object>  map = new HashMap<String,Object>();
        map.put("imageActionName","upload");
        map.put("imageUrlPrefix", "");
        map.put("imageMaxSize", 1024*1000);
        map.put("imageAllowFiles", new String[]{".png", ".jpg", ".jpeg", ".gif", ".bmp",".pdf",".doc",".docx",".rar",".zip"});
        return map;
    }
    
    /***
     * 执行文件 上传处理
     * @param request
     * @param map
     * @param fileType
     * @throws Exception 
     * @throws Throwable
     */
	public void uploadExecute(HttpServletRequest request,
			Map<String, Object> map,String fileType) throws Exception {
		//TODO 图片
		String fileTypes = "gif,png,jpg,jpeg,bmp,pdf,doc,docx,rar,zip";
		//TODO 图片保存路径
		String path = FileUtil.getSystemPath();
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String fileNames = FileUtil.updateFile(multipartRequest, path, fileTypes);
		String[] names  = fileNames.split(",");
		
		File tempFile = new File(path + names[0]);
		FileInputStream fis = new FileInputStream(tempFile);
		byte[] fileInfo = IOUtils.toByteArray(fis);
		
		
		map.put("name", names[0]);
		map.put("id", names[0]);
		map.put("originalName", names[1]);
		String fileId = names[0];
		map.put("url", fileId);
		map.put("state", "SUCCESS");
		try{
			//保存上传信息
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("fileId", fileId);
			param.put("oldName", names[1]);
			param.put("fileInfo", fileInfo);
			param.put("createTime", new Date());
			param.put("createBy", new Date());
			uploadFileService.insert(param);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			// 关闭流及删除临时文件 ba 
			if(null!=fis){
				FileUtil.closeQuietly(fis);
			}
			
	        FileUtil.deleteQuietly(tempFile);
		}
	}
    
}
