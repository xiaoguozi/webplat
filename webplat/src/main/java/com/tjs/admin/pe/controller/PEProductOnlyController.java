package com.tjs.admin.pe.controller;

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
import com.tjs.admin.pe.service.PEProductService;
import com.tjs.admin.xintuo.model.Lable;
import com.tjs.admin.xintuo.model.ProductXtgs;

/**
 * 私募产品控制器
 * 
 *@author zhsoft
 *@since 2015年5月21日
 **/

@Controller
@RequestMapping(value = "/admin/pe/productOnly")
public class PEProductOnlyController {

	@Resource
	private PEProductService peProductService;
	
	
	@RequestMapping("/index")
    public String index(PEProductCtrlModel peProductCtrlModel, Model model) {
		String managerId = peProductCtrlModel.getManagerId();
		model.addAttribute("managerId", managerId);
        return "admin/pe/productOnly/index";
    }
	
/*	@RequestMapping("/insert")
    public String insert(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
    	model.addAttribute("peProduct", peProduct);
    	model.addAttribute("ctrlData", peProductCtrlModel);
        return "admin/pe/productOnly/main";
    }
	

    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = peProductService.insertPEProduct(peProduct, peProductCtrlModel);
    	result.put("code", "0");
    	result.put("bizData", peProduct);
    	
        return result;
    }*/
	
	
	@RequestMapping("/listData")
    public String listData(PEProductCtrlModel peProductCtrlModel, Model model) {
    	List<PEProduct> showData = new ArrayList<PEProduct>();
    	showData = peProductService.getPEProductList(peProductCtrlModel);
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", peProductCtrlModel);
    	
        return "admin/pe/productOnly/listData";
    }
	
	@RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(PEProductCtrlModel peProductCtrlModel) {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	Integer total = peProductService.selectListCount(peProductCtrlModel);
    	
    	result.put("total", total);
    	
        return result;
    }
	
/*	@RequestMapping("/update")
    public String update(PEProduct paraPEProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
		PEProduct peProduct = peProductService.getPEProductById(paraPEProduct.getId());
    	model.addAttribute("peProduct", peProduct);
    	model.addAttribute("ctrlData", peProductCtrlModel);
        return "admin/pe/productOnly/update";
    }
	*/
	@RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
		long productId = Long.valueOf(peProductCtrlModel.getIds()).longValue();
		PEProduct product = peProductService.getPEProductById(productId);
		
    	Map<String, Object> result = new HashMap<String, Object>();
    	peProductService.updatePEProductShow(product);     
    	result.put("code", "0");
    	result.put("bizData", peProduct);
    	
        return result;
    }

    @RequestMapping("/view")
    public String view(PEProduct paraPEProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
    	PEProduct peProduct = peProductService.getPEProductById(paraPEProduct.getId());
    	model.addAttribute("peProduct", peProduct);
    	model.addAttribute("ctrlData", peProductCtrlModel);
        return "admin/pe/productOnly/view";
    }
    
    @RequestMapping("/getOnLinePECompanyList")
    @ResponseBody
    public  Map<String, Object> getOnLinePECompanyList() {
    	Map<String, Object> result = new HashMap<String, Object>();
    	result = peProductService.getOnLinePECompanyList(); 
        return result;
    }
    
    @RequestMapping("getOnLinePEManagerList")
    @ResponseBody
    public  Map<String, Object> getOnLinePEManagerList(@RequestParam(value="companyId",required=false) Long companyId, @RequestParam(value="keyword",required=false) String keyword) {
    	
    	Map<String, Object> result = new HashMap<String, Object>();    	
    	List<PEManager> lstPeManager =  peProductService.selectOnLinePEManager(companyId,keyword);     	
    	 result.put("total", lstPeManager!=null?lstPeManager.size():0);
    	 List<Lable> lstLable = new ArrayList<Lable>();
    	 for(PEManager peManager:lstPeManager){
     		Lable lable = new Lable();
     		lable.setId(peManager.getId().toString());
     		lable.setTitle(peManager.getCompanyName()+":"+peManager.getName());
     		lstLable.add(lable);
     	} 
     	  result.put("data", lstLable);   	
         return result;
    }
}
