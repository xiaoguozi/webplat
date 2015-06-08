package com.tjs.admin.peizi.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.StringUtils;
/**
 * 系统产品//http://127.0.0.1:8080/webplat/product/xt/list?method=getXtList
 * 
 * @author 何志刚
 * @since 2015年3月21日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/admin/peizi/peizi")
public class PeiziController {
	 
	 @Resource
	 private UserService userService;
	 
	 @Resource
	 private UserInfoService UserInfoService;
	 
	 
	 @Resource
	 private IPeizi iPeizi;
	 
	 
	 
	 @RequestMapping("/index")
     public String ruleIndex() {
        return "admin/peizi/peiziIndex";
     }
	 
	 
	 @RequestMapping("/listDataCount")
     @ResponseBody
     public Map<String, Integer> listDataCount(PeiziCtrlModel peiziCtrlModel, Model model) throws UnsupportedEncodingException {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	if(StringUtils.isNotBlank(peiziCtrlModel.getKeyWord())){
    		String paramsTrans = new String(peiziCtrlModel.getKeyWord().getBytes("ISO-8859-1"),"UTF-8");
    		peiziCtrlModel.setKeyWord(paramsTrans);
    	}
    	int totalCount = iPeizi.countPeizi(peiziCtrlModel);
    	
    	result.put("total", totalCount);
    	
        return result;
    }

	    
	   @RequestMapping("/listData")
	   public String listData(PeiziCtrlModel peiziCtrlModel, Model model) throws UnsupportedEncodingException {
	    	List<Peizi> showData = new ArrayList<Peizi>();
	    	
	    	if(StringUtils.isNotBlank(peiziCtrlModel.getKeyWord())){
	    		String paramsTrans = new String(peiziCtrlModel.getKeyWord().getBytes("ISO-8859-1"),"UTF-8");
	    		peiziCtrlModel.setKeyWord(paramsTrans);
	    	}
	    	
	    	showData = iPeizi.selectPeizi(peiziCtrlModel);
	    	model.addAttribute("showData", showData);
			model.addAttribute("ctrlData", peiziCtrlModel);
	    	
	        return "admin/peizi/peiziListData";
	    }
	   
	   
	    
	    @RequestMapping("/insert")
	    public String insert(Peizi peizi, PeiziCtrlModel PeiziCtrlModel, Model model) {	    	
	    	model.addAttribute(peizi);
	    	model.addAttribute("ctrlData", PeiziCtrlModel);
	        return "admin/peizi/insertPeizi";
	    }
	    
	    
	    @RequestMapping("/insertData")
	    @ResponseBody
	    public Map<String, Object> insertData(Peizi peizi, PeiziCtrlModel PeiziCtrlModel, Model model) {
	    	Map<String, Object> result = new HashMap<String, Object>();	    	
	    	iPeizi.insertPeizi(peizi);					
	    	result.put("code", "0");
	    	result.put("bizData", peizi);
	    	
	        return result;
	    }
	    
	    
	    @RequestMapping("/update")
	    public String update(@RequestParam(value="id",required=false) Long dataId, PeiziCtrlModel PeiziCtrlModel, Model model) {
	    	Peizi peizi =  iPeizi.findByPeiziId(dataId);
	    	model.addAttribute(peizi);
	    	model.addAttribute("ctrlData", PeiziCtrlModel);
	        return "admin/peizi/updatePeizi";
	    }
	  

	    @RequestMapping("/updateData")
	    @ResponseBody
	    public Map<String, Object> updateData(Peizi peizi,  PeiziCtrlModel PeiziCtrlModel, Model model) {	    	
	    	Map<String, Object> result = new HashMap<String, Object>();
	    	int id = iPeizi.updatePeizi(peizi);
	    	result.put("code", "0");
	    	result.put("bizData", peizi);	    	
	        return result;
	    }
}
