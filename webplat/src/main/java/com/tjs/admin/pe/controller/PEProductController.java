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
 * 私募产品控制器
 * 
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
	
	@RequestMapping("/insert")
    public String insert(PEProduct peProduct, PEProductCtrlModel peCompanyCtrlModel, Model model) {
    	model.addAttribute("peProduct", peProduct);
    	model.addAttribute("ctrlData", peCompanyCtrlModel);
        return "admin/pe/peProduct/insert";
    }
	

    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = peProductService.insertPEProduct(peProduct, peProductCtrlModel);
    	result.put("code", "0");
    	result.put("bizData", peProduct);
    	
        return result;
    }
	
	
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
	
	@RequestMapping("/update")
    public String update(PEProduct paraPEProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
		PEProduct peProduct = peProductService.getPEProductById(paraPEProduct.getId());
    	model.addAttribute("peProduct", peProduct);
    	model.addAttribute("ctrlData", peProductCtrlModel);
        return "admin/pe/peProduct/update";
    }
	
	@RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = peProductService.updatePEProduct(peProduct, peProductCtrlModel);               
    	result.put("code", "0");
    	result.put("bizData", peProduct);
    	
        return result;
    }

    @RequestMapping("/view")
    public String view(PEProduct paraPEProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
    	PEProduct peProduct = peProductService.getPEProductById(paraPEProduct.getId());
    	model.addAttribute("peProduct", peProduct);
    	model.addAttribute("ctrlData", peProductCtrlModel);
        return "admin/pe/peProduct/view";
    }
}
