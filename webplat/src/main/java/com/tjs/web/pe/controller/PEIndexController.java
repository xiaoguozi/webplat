package com.tjs.web.pe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PETopProduct;
import com.tjs.admin.pe.service.PEProductService;

/**
 * 私募首页控制器
 * 
 *@author duanyujun
 *@since 2015年5月2日
 *
 **/

@Controller
@RequestMapping(value = "/web/pe/")
public class PEIndexController {

	@Resource
	private PEProductService peProductService;
	
	
	@RequestMapping("/peIndex")
    public String index(PEProductCtrlModel peProductCtrlModel, Model model) {
		//查询4个顶级私募
		List<PETopProduct> showData = new ArrayList<PETopProduct>();
    	showData = peProductService.getTop4PEProductList();
    	
    	//查询私募收益排行
    	List<PETopProduct> top10Data = new ArrayList<PETopProduct>();
    	top10Data = peProductService.getTop10PEProductList();
    	
    	model.addAttribute("top4Data", showData);
    	model.addAttribute("top10Data", top10Data);
    	
        return "web/pe/peIndex";
    }
	
//	@RequestMapping("/insert")
//    public String insert(PEProduct peProduct, PEIndexCtrlModel peProductCtrlModel, Model model) {
//    	model.addAttribute("peProduct", peProduct);
//    	model.addAttribute("ctrlData", peProductCtrlModel);
//        return "admin/pe/peProduct/main";
//    }
//	
//
//    @RequestMapping("/insertData")
//    @ResponseBody
//    public Map<String, Object> insertData(PEProduct peProduct, PEIndexCtrlModel peProductCtrlModel, Model model) {
//    	Map<String, Object> result = new HashMap<String, Object>();
//    	int id = peProductService.insertPEProduct(peProduct, peProductCtrlModel);
//    	result.put("code", "0");
//    	result.put("bizData", peProduct);
//    	
//        return result;
//    }
//	
//	
//	@RequestMapping("/listData")
//    public String listData(PEIndexCtrlModel peProductCtrlModel, Model model) {
//    	List<PEProduct> showData = new ArrayList<PEProduct>();
//    	showData = peProductService.getPEProductList(peProductCtrlModel);
//    	
//    	model.addAttribute("showData", showData);
//		model.addAttribute("ctrlData", peProductCtrlModel);
//    	
//        return "admin/pe/peProduct/listData";
//    }
//	
//	@RequestMapping("/listDataCount")
//    @ResponseBody
//    public Map<String, Integer> listDataCount(PEIndexCtrlModel peProductCtrlModel) {
//    	Map<String, Integer> result = new HashMap<String, Integer>();
//    	
//    	Integer total = peProductService.selectListCount(peProductCtrlModel);
//    	
//    	result.put("total", total);
//    	
//        return result;
//    }
//	
//	@RequestMapping("/update")
//    public String update(PEProduct paraPEProduct, PEIndexCtrlModel peProductCtrlModel, Model model) {
//		PEProduct peProduct = peProductService.getPEProductById(paraPEProduct.getId());
//    	model.addAttribute("peProduct", peProduct);
//    	model.addAttribute("ctrlData", peProductCtrlModel);
//        return "admin/pe/peProduct/update";
//    }
//	
//	@RequestMapping("/updateData")
//    @ResponseBody
//    public Map<String, Object> updateData(PEProduct peProduct, PEIndexCtrlModel peProductCtrlModel, Model model) {
//    	Map<String, Object> result = new HashMap<String, Object>();
//    	int id = peProductService.updatePEProduct(peProduct, peProductCtrlModel);               
//    	result.put("code", "0");
//    	result.put("bizData", peProduct);
//    	
//        return result;
//    }
//
//    @RequestMapping("/view")
//    public String view(PEProduct paraPEProduct, PEIndexCtrlModel peProductCtrlModel, Model model) {
//    	PEProduct peProduct = peProductService.getPEProductById(paraPEProduct.getId());
//    	model.addAttribute("peProduct", peProduct);
//    	model.addAttribute("ctrlData", peProductCtrlModel);
//        return "admin/pe/peProduct/view";
//    }
//    
//    @RequestMapping("/getOnLinePECompanyList")
//    @ResponseBody
//    public  Map<String, Object> getOnLinePECompanyList() {
//    	Map<String, Object> result = new HashMap<String, Object>();
//    	result = peProductService.getOnLinePECompanyList(); 
//        return result;
//    }
}
