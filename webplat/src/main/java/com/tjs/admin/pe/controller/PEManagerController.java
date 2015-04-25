package com.tjs.admin.pe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.service.PEManagerService;

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
    	peManagerService.insertPEManager(peManager, peManagerCtrlModel);
    	result.put("code", "0");
    	result.put("bizData", peManager);
    	
        return result;
    }
	
	
	@RequestMapping("/listData")
    public String listData(PEManagerCtrlModel peManagerCtrlModel, Model model) {
    	List<PEManager> showData = new ArrayList<PEManager>();
    	showData = peManagerService.getPEManagerList();
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", peManagerCtrlModel);
    	
        return "admin/pe/peManager/listData";
    }
	
	@RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount() {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	Integer total = peManagerService.selectListCount();
    	
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
   
}
