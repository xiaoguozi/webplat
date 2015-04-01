package com.tjs.admin.pe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.controller.UserCtrlModel;
import com.tjs.admin.model.User;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PECompanyCtrlModel;
import com.tjs.admin.pe.service.PECompanyService;

/**
 *@author zhsoft
 *@since 2015年3月31日
 **/

@Controller
@RequestMapping(value = "/admin/pe/peCompany")
public class PECompanyController {

	@Resource
	private PECompanyService peCompanyService;
	
	@RequestMapping("/index")
    public String index() {
        return "admin/pe/peCompanyIndex";
    }
	
	@RequestMapping("/insert")
    public String insert(PECompany peCompany, PECompanyCtrlModel peCompanyCtrlModel, Model model) {
    	model.addAttribute("peCompany", peCompany);
    	model.addAttribute("ctrlData", peCompanyCtrlModel);
        return "admin/pe/peCompanyInsert";
    }
	
	@RequestMapping("/insertData")        
    @ResponseBody
    public Map<String, Object> insertData(PECompany peCompany, PECompanyCtrlModel peCompanyCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = peCompanyService.insertPECompany(peCompany);
    	result.put("code", "0");
    	result.put("bizData", peCompany);
    	
        return result;
    }
	
	
	@RequestMapping("/listData")
    public String listData(PECompanyCtrlModel peCompanyCtrlModel, Model model) {
    	List<PECompany> showData = new ArrayList<PECompany>();
    	showData = peCompanyService.getPECompanyList();
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", peCompanyCtrlModel);
    	
        return "admin/pe/peCompanyListData";
    }
	
	@RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount() {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	Integer total = peCompanyService.selectListCount();
    	
    	result.put("total", total);
    	
        return result;
    }
}
