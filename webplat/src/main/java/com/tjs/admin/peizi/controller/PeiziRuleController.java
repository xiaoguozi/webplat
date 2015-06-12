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

import com.tjs.admin.peizi.constants.PeiziTypeEnum;
import com.tjs.admin.peizi.model.PeiziRule;
import com.tjs.admin.peizi.service.IPeiziRule;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.StringUtils;
import com.tjs.admin.xintuo.controller.XinTuoCpCtrlModel;
/**
 * 系统产品//http://127.0.0.1:8080/webplat/product/xt/list?method=getXtList
 * 
 * @author 何志刚
 * @since 2015年3月21日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/admin/peizi/peizirule")
public class PeiziRuleController {
	 
	 @Resource
	 private UserService userService;
	 
	 @Resource
	 private UserInfoService UserInfoService;
	 
	 
	 @Resource
	 private IPeiziRule iPeiziRule;
	 
	 
	 
	 @RequestMapping("/ruleIndex")
     public String ruleIndex() {
        return "admin/peizi/ruleIndex";
     }
	 
	 
	 @RequestMapping("/listDataCount")
     @ResponseBody
     public Map<String, Integer> listDataCount(PeiziRuleCtrlModel peiziCtrlModel, Model model) throws UnsupportedEncodingException {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	if(StringUtils.isNotBlank(peiziCtrlModel.getKeyWord())){
    		String paramsTrans = new String(peiziCtrlModel.getKeyWord().getBytes("ISO-8859-1"),"UTF-8");
    	}
    	int totalCount = iPeiziRule.countPeiziRule(peiziCtrlModel);
    	
    	result.put("total", totalCount);
    	
        return result;
    }

	    
	   @RequestMapping("/listData")
	   public String listData(PeiziRuleCtrlModel peiziCtrlModel, Model model) throws UnsupportedEncodingException {
	    	List<PeiziRule> showData = new ArrayList<PeiziRule>();
	    	
	    	if(StringUtils.isNotBlank(peiziCtrlModel.getKeyWord())){
	    		String paramsTrans = new String(peiziCtrlModel.getKeyWord().getBytes("ISO-8859-1"),"UTF-8");
	    	}
	    	
	    	showData = iPeiziRule.selectPeiziRule(peiziCtrlModel);
	    	model.addAttribute("showData", showData);
			model.addAttribute("ctrlData", peiziCtrlModel);
	    	
	        return "admin/peizi/ruleListData";
	    }
	   
	   
	    
	    @RequestMapping("/insert")
	    public String insert(PeiziRule peiziRule, PeiziRuleCtrlModel PeiziCtrlModel, Model model) {	    	
	    	model.addAttribute(peiziRule);
	    	if(PeiziTypeEnum.DXPEIZI.getKey().equals(peiziRule.getRuleType())){
	    		peiziRule.setRuleGlsyType("30");
	    	}else if(PeiziTypeEnum.YYPEIZI.getKey().equals(peiziRule.getRuleType())){
	    		peiziRule.setRuleGlsyType("20");
	    	}else{
	    		peiziRule.setRuleGlsyType("10");
	    	}
	    	model.addAttribute("ctrlData", PeiziCtrlModel);
	        return "admin/peizi/insertRule";
	    }
	    
	    
	    @RequestMapping("/insertData")
	    @ResponseBody
	    public Map<String, Object> insertData(PeiziRule peiziRule, PeiziRuleCtrlModel PeiziCtrlModel, Model model) {
	    	Map<String, Object> result = new HashMap<String, Object>();	    	
	    	iPeiziRule.insertPeiziRule(peiziRule);					
	    	result.put("code", "0");
	    	result.put("bizData", peiziRule);
	    	
	        return result;
	    }
	    
	    
	    @RequestMapping("/update")
	    public String update(@RequestParam(value="id",required=false) Long ruleId, PeiziRuleCtrlModel PeiziCtrlModel, Model model) {
	    	PeiziRule peiziRule =  iPeiziRule.findByPeiziRuleId(ruleId);
	    	model.addAttribute(peiziRule);
	    	model.addAttribute("ctrlData", PeiziCtrlModel);
	        return "admin/peizi/updateRule";
	    }
	  

	    @RequestMapping("/updateData")
	    @ResponseBody
	    public Map<String, Object> updateData(PeiziRule peiziRule,  PeiziRuleCtrlModel PeiziCtrlModel, Model model) {	    	
	    	Map<String, Object> result = new HashMap<String, Object>();
	    	int id = iPeiziRule.updatePeiziRule(peiziRule);
	    	result.put("code", "0");
	    	result.put("bizData", peiziRule);	    	
	        return result;
	    }
	    
	    @RequestMapping("/deleteData")
	    public  Map<String, Object> deleteData(@RequestParam(value="ids",required=false) Long[] ruleIds, PeiziRuleCtrlModel PeiziCtrlModel, Model model) {
	    	Map<String, Object> result = new HashMap<String, Object>();
	    	iPeiziRule.deleteBatchPeiziRule(ruleIds);
	    	result.put("code", "0");
	    	model.addAttribute("ctrlData", PeiziCtrlModel);
	        return result;
	    }
}
