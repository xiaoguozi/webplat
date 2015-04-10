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

import com.tjs.admin.pe.model.PEProductIncome;
import com.tjs.admin.pe.service.PEProductIncomeService;

/**
 * 私募产品收益排名控制器
 * 
 *@author zhsoft
 *@since 2015年3月31日
 **/

@Controller
@RequestMapping(value = "/admin/pe/peProductIncome")
public class PEProductIncomeController {

	@Resource
	private PEProductIncomeService peProductIncomeService;
	
	
	@RequestMapping("/index")
    public String index() {
        return "admin/pe/peProductIncome/index";
    }
	
	@RequestMapping("/insert")
    public String insert(PEProductIncome peProductIncome, PEProductIncomeCtrlModel peProductIncomeCtrlModel, Model model) {
    	model.addAttribute("peProductIncome", peProductIncome);
    	model.addAttribute("ctrlData", peProductIncomeCtrlModel);
        return "admin/pe/peProductIncome/insert";
    }
	

    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(PEProductIncome peProductIncome, PEProductIncomeCtrlModel peProductIncomeCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	peProductIncomeService.insertPEProductIncome(peProductIncome);
    	result.put("code", "0");
    	result.put("bizData", peProductIncome);
    	
        return result;
    }
	
	
	@RequestMapping("/listData")
    public String listData(PEProductIncomeCtrlModel peProductIncomeCtrlModel, Model model) {
    	List<PEProductIncome> showData = new ArrayList<PEProductIncome>();
    	showData = peProductIncomeService.getPEProductIncomeList();
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", peProductIncomeCtrlModel);
    	
        return "admin/pe/peProductIncome/listData";
    }
	
	@RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount() {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	Integer total = peProductIncomeService.selectListCount();
    	
    	result.put("total", total);
    	
        return result;
    }
	
	@RequestMapping("/update")
    public String update(PEProductIncome paraPEProductIncome, PEProductIncomeCtrlModel peProductIncomeCtrlModel, Model model) {
		PEProductIncome peProductIncome = peProductIncomeService.getPEProductIncomeById(paraPEProductIncome.getId());
    	model.addAttribute("peProductIncome", peProductIncome);
    	model.addAttribute("ctrlData", peProductIncomeCtrlModel);
        return "admin/pe/peProductIncome/update";
    }
	
	@RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(PEProductIncome peProductIncome, PEProductIncomeCtrlModel peProductIncomeCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	peProductIncomeService.updatePEProductIncome(peProductIncome);               
    	result.put("code", "0");
    	result.put("bizData", peProductIncome);
    	
        return result;
    }

    @RequestMapping("/view")
    public String view(PEProductIncome paraPEProductIncome, PEProductIncomeCtrlModel peProductIncomeCtrlModel, Model model) {
    	PEProductIncome peProductIncome = peProductIncomeService.getPEProductIncomeById(paraPEProductIncome.getId());
    	model.addAttribute("peProductIncome", peProductIncome);
    	model.addAttribute("ctrlData", peProductIncomeCtrlModel);
        return "admin/pe/peProductIncome/view";
    }
   
}
