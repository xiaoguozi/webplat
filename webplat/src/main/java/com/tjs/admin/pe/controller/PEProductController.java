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

import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.service.PEProductService;

/**
 *@author zhsoft
 *@since 2015年3月31日
 **/

@Controller
@RequestMapping(value = "/admin/pe/peProduct")
public class PEProductController {

	@Resource
	private PEProductService peProductService;
	
	@RequestMapping("/index")
    public String index() {
        return "admin/pe/peProduct/index";
    }
	
/*	@RequestMapping("/insert")
    public String insert(PECompany peCompany, PEProductCtrlModel peCompanyCtrlModel, Model model) {
    	model.addAttribute("peCompany", peCompany);
    	model.addAttribute("ctrlData", peCompanyCtrlModel);
        return "admin/pe/peProduct/insert";
    }
	
    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(PECompany peCompany, PEProductCtrlModel peCompanyCtrlModel, Model model) {
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
    }*/
	
	
	@RequestMapping("/listData")
    public String listData(PEProductCtrlModel peProductCtrlModel, Model model) {
    	List<PEProduct> showData = new ArrayList<PEProduct>();
    	showData = peProductService.getPEProductList();
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", peProductCtrlModel);
    	
        return "admin/pe/peProduct/listData";
    }
	
	@RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount() {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	Integer total = peProductService.selectListCount();
    	
    	result.put("total", total);
    	
        return result;
    }
	
	/*@RequestMapping("/update")
    public String update(PECompany paraPECompany, PEProductCtrlModel peCompanyCtrlModel, Model model) {
		PECompany peCompany = peCompanyService.getPECompanyById(paraPECompany.getId());
    	model.addAttribute("peCompany", peCompany);
    	model.addAttribute("ctrlData", peCompanyCtrlModel);
        return "admin/pe/peProduct/update";
    }
	
	@RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(PECompany peProduct, PEProductCtrlModel peCompanyCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = peCompanyService.updatePECompany(peProduct);
    	result.put("code", "0");
    	result.put("bizData", peProduct);
    	
        return result;
    }


    @RequestMapping("/view")
    public String view(PECompany paraPECompany, PEProductCtrlModel peCompanyCtrlModel, Model model) {
    	PECompany peCompany = peCompanyService.getPECompanyById(paraPECompany.getId());
    	model.addAttribute("peCompany", peCompany);
    	model.addAttribute("ctrlData", peCompanyCtrlModel);
        return "admin/pe/peProduct/view";
    }*/
}
