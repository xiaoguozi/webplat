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
import com.tjs.admin.pe.model.PEProductNet;
import com.tjs.admin.pe.service.PEProductNetService;
import com.tjs.admin.pe.service.PEProductService;

/**
 * 私募产品净值控制器
 * 
 *@author zhsoft
 *@since 2015年3月31日
 **/

@Controller
@RequestMapping(value = "/admin/pe/peProductNet")
public class PEProductNetController {

	@Resource
	private PEProductNetService peProductNetService;
	
	@RequestMapping("/index")
    public String index(PEProductNetCtrlModel peProductNetCtrlModel, Model model) {
		String productId = peProductNetCtrlModel.getProductId();
		model.addAttribute("productId", productId);
        return "admin/pe/peProductNet/index";
    }
	
	@RequestMapping("/insert")
    public String insert(PEProductNet peProductNet, PEProductNetCtrlModel peProductNetCtrlModel, Model model) {
		PEProduct peProduct = peProductNetService.getPEProductById(peProductNetCtrlModel);
		peProductNet.setProductId(peProduct.getId());
		peProductNet.setProductName(peProduct.getName());
    	model.addAttribute("peProductNet", peProductNet);
    	model.addAttribute("ctrlData", peProductNetCtrlModel);
        return "admin/pe/peProductNet/insert";
    }
	

    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(PEProductNet peProductNet, PEProductNetCtrlModel peProductNetCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	peProductNetService.insertPEProductNet(peProductNet, peProductNetCtrlModel);
    	result.put("code", "0");
    	result.put("bizData", peProductNet);
    	
        return result;
    }
	
	
	@RequestMapping("/listData")
    public String listData(PEProductNetCtrlModel peProductNetCtrlModel, Model model) {
    	List<PEProductNet> showData = new ArrayList<PEProductNet>();
    	showData = peProductNetService.getPEProductNetList(peProductNetCtrlModel);
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", peProductNetCtrlModel);
    	
        return "admin/pe/peProductNet/listData";
    }
	
	@RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(PEProductNetCtrlModel peProductNetCtrlModel) {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	Integer total = peProductNetService.selectListCount(peProductNetCtrlModel);
    	
    	result.put("total", total);
    	
        return result;
    }
	
	@RequestMapping("/update")
    public String update(PEProductNet paraPEProductNet, PEProductNetCtrlModel peProductNetCtrlModel, Model model) {
		PEProductNet peProductNet = peProductNetService.getPEProductNetById(paraPEProductNet.getId());
    	model.addAttribute("peProductNet", peProductNet);
    	model.addAttribute("ctrlData", peProductNetCtrlModel);
        return "admin/pe/peProductNet/update";
    }
	
	@RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(PEProductNet peProductNet, PEProductNetCtrlModel peProductNetCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	peProductNetService.updatePEProductNet(peProductNet, peProductNetCtrlModel);               
    	result.put("code", "0");
    	result.put("bizData", peProductNet);
    	
        return result;
    }

    @RequestMapping("/view")
    public String view(PEProductNet paraPEProductNet, PEProductNetCtrlModel peProductNetCtrlModel, Model model) {
    	PEProductNet peProductNet = peProductNetService.getPEProductNetById(paraPEProductNet.getId());
    	model.addAttribute("peProductNet", peProductNet);
    	model.addAttribute("ctrlData", peProductNetCtrlModel);
        return "admin/pe/peProductNet/view";
    }
   
}
