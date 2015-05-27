package com.tjs.admin.pe.controller;

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

import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.service.PEManagerProductService;
import com.tjs.admin.pe.service.PEManagerService;
import com.tjs.admin.utils.StringUtils;

/**
 * 私募经理控制器
 * 
 *@author zhsoft
 *@since 2015年4月21日
 **/

@Controller
@RequestMapping(value = "/admin/pe/peManager")
public class PEManagerController {

	@Resource
	private PEManagerService peManagerService;
	
	@Resource
	private PEManagerProductService peManagerProductService;
	
	@RequestMapping("/index")
    public String index() {
        return "admin/pe/peManager/index";
    }
	
	@RequestMapping("/insert")
    public String insert(PEManager peManager, PEManagerCtrlModel peManagerCtrlModel, Model model) {
    	model.addAttribute("peManager", peManager);
    	model.addAttribute("ctrlData", peManagerCtrlModel);
        return "admin/pe/peManager/insert";
    }
	

    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(PEManager peManager, PEManagerCtrlModel peManagerCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	if(peManager.getId()==null||peManager.getId().equals(0)){
    		peManagerService.insertPEManager(peManager, peManagerCtrlModel);
    	}else{
    		peManagerService.updatePEManager(peManager, peManagerCtrlModel);   
    	}   	
    	result.put("code", "0");
    	result.put("bizData", peManager);
//    	List<PEProduct> peProducts = peManagerService.getOnLinePEProductList(peManager);
//    	result.put("peProducts", peProducts);
//    	peManagerProductService.insert(peManager, peProducts);
        return result;
    }
	
	
	@RequestMapping("/listData")
    public String listData(PEManagerCtrlModel peManagerCtrlModel, Model model) throws UnsupportedEncodingException {
		if(StringUtils.isNotBlank(peManagerCtrlModel.getKeyWord())){
    		String paramsTrans = new String(peManagerCtrlModel.getKeyWord().getBytes("ISO-8859-1"),"UTF-8");
    		peManagerCtrlModel.setKeyWord(java.net.URLDecoder.decode(paramsTrans , "UTF-8"));
    	}
		
    	List<PEManager> showData = new ArrayList<PEManager>();
    	showData = peManagerService.getPEManagerList(peManagerCtrlModel);
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", peManagerCtrlModel);
    	
        return "admin/pe/peManager/listData";
    }
	
	@RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(PEManagerCtrlModel peManagerCtrlModel) throws UnsupportedEncodingException {
		if(StringUtils.isNotBlank(peManagerCtrlModel.getKeyWord())){
    		String paramsTrans = new String(peManagerCtrlModel.getKeyWord().getBytes("ISO-8859-1"),"UTF-8");
    		peManagerCtrlModel.setKeyWord(java.net.URLDecoder.decode(paramsTrans , "UTF-8"));
    	}
		
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	Integer total = peManagerService.selectListCount(peManagerCtrlModel);
    	
    	result.put("total", total);
    	
        return result;
    }
	
	@RequestMapping("/update")
    public String update(PEManager paraPEManager, PEManagerCtrlModel peManagerCtrlModel, Model model) {
		PEManager peManager = peManagerService.getPEManagerById(paraPEManager.getId());
    	model.addAttribute("peManager", peManager);
    	model.addAttribute("ctrlData", peManagerCtrlModel);
        return "admin/pe/peManager/update";
    }
	
	@RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(PEManager peManager, PEManagerCtrlModel peManagerCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	peManagerService.updatePEManager(peManager, peManagerCtrlModel);               
    	result.put("code", "0");
    	result.put("bizData", peManager);
    	
        return result;
    }

    @RequestMapping("/view")
    public String view(PEManager paraPEManager, PEManagerCtrlModel peManagerCtrlModel, Model model) {
    	PEManager peManager = peManagerService.getPEManagerById(paraPEManager.getId());
    	model.addAttribute("peManager", peManager);
    	model.addAttribute("ctrlData", peManagerCtrlModel);
        return "admin/pe/peManager/view";
    }
    
    @RequestMapping("/getOnLinePECompanyList")
    @ResponseBody
    public  Map<String, Object> getOnLinePECompanyList(@RequestParam(value="keyword",required=false) String keyword) throws UnsupportedEncodingException {
    	if(StringUtils.isNotBlank(keyword)){
    		String paramsTrans = new String(keyword.getBytes("ISO-8859-1"),"UTF-8");
    		keyword =java.net.URLDecoder.decode(paramsTrans , "UTF-8");
    	}
    	
    	Map<String, Object> result = new HashMap<String, Object>();
    	result = peManagerService.getOnLinePECompanyList(keyword); 
        return result;
    }
    
    @RequestMapping("/getOnLinePEProductList")
    @ResponseBody
    List<PEProduct> getOnLinePEProductList(PEManager peManager) {
    	return peManagerService.getOnLinePEProductList(peManager);
    }
   
}
