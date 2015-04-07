package com.tjs.admin.pe.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.controller.UserCtrlModel;
import com.tjs.admin.model.User;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.service.PECompanyService;
import com.tjs.core.util.StringExtUtils;

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
        return "admin/pe/peCompany/index";
    }
	
	@RequestMapping("/insert")
    public String insert(PECompany peCompany, PECompanyCtrlModel peCompanyCtrlModel, Model model) {
    	model.addAttribute("peCompany", peCompany);
    	model.addAttribute("ctrlData", peCompanyCtrlModel);
        return "admin/pe/peCompany/insert";
    }
	
    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(PECompany peCompany, PECompanyCtrlModel peCompanyCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String setupTimeStr = peCompanyCtrlModel.getSetupTimeStr();
    	if(StringExtUtils.isNotBlank(setupTimeStr)){
    		try {
    			Date setupTime = sdf.parse(setupTimeStr);
    			peCompany.setSetupTime(setupTime);
    		} catch (ParseException e) {
    			//e.printStackTrace();
    		}
    	}
    	
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
    	
        return "admin/pe/peCompany/listData";
    }
	
	@RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount() {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	Integer total = peCompanyService.selectListCount();
    	
    	result.put("total", total);
    	
        return result;
    }
	
	@RequestMapping("/update")
    public String update(PECompany paraPECompany, PECompanyCtrlModel peCompanyCtrlModel, Model model) {
		PECompany peCompany = peCompanyService.getPECompanyById(paraPECompany.getId());
    	model.addAttribute(peCompany);
    	model.addAttribute("ctrlData", peCompanyCtrlModel);
        return "admin/pe/peCompany/update";
    }
	
	@RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(PECompany peCompany, PECompanyCtrlModel peCompanyCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = peCompanyService.updatePECompany(peCompany);
    	result.put("code", "0");
    	result.put("bizData", peCompany);
    	
        return result;
    }


    @RequestMapping("/view")
    public String view(PECompany paraPECompany, PECompanyCtrlModel peCompanyCtrlModel, Model model) {
    	PECompany peCompany = peCompanyService.getPECompanyById(paraPECompany.getId());
    	model.addAttribute(peCompany);
    	model.addAttribute("ctrlData", peCompanyCtrlModel);
        return "admin/pe/peCompany/view";
    }
}
