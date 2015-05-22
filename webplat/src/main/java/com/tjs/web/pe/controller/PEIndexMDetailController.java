package com.tjs.web.pe.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tjs.admin.pe.controller.PEManagerCtrlModel;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEManagerProduct;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.service.PECompanyService;
import com.tjs.admin.pe.service.PEManagerService;
import com.tjs.admin.pe.service.PEProductIncomeService;
import com.tjs.admin.pe.service.PEProductNetService;
import com.tjs.admin.pe.service.PEProductService;

/**
 * 私募经理明细控制器
 * 
 *@author duanyujun
 *@since 2015年5月2日
 *
 **/

@Controller
@RequestMapping(value = "/web/pe/")
public class PEIndexMDetailController {

	@Resource
	private PEManagerService peManagerService ;
	
	@Resource
	private PECompanyService peCompanyService ;
	
	@Resource
	private PEProductService peProductService ;
	
	@Resource
	private PEProductNetService peProductNetService ;
	
	@Resource
	private PEProductIncomeService peProductIncomeService ;
	
	
	
	
	@RequestMapping("/peIndexMDetail")
    public String peIndexMDetail(@RequestParam(value="managerId",required=false) Long managerId, Model model) {
        //获取经理信息
		PEManagerCtrlModel peManagerCtrlModel = new PEManagerCtrlModel();
		PEManager peManager = new PEManager();
		peManager.setId(managerId);
		peManagerCtrlModel.setPeManager(peManager);
		List<PEManagerProduct> lstPeManager = peManagerService.selectStarPEManagerList(peManagerCtrlModel);
		PEManagerProduct peManagerProduct = null;
		if(null!=lstPeManager&&lstPeManager.size()>0){
			peManagerProduct = lstPeManager.get(0);
		}else{
			 return "web/pe/peManagerDetail";
		}
		
		model.addAttribute("peManagerProduct", peManagerProduct);
	   //获取公司信息
	    PECompany peCompany = peCompanyService.getPECompanyById(peManagerProduct.getCompanyId());
	    model.addAttribute("peCompany", peCompany);
	    
       //获取产品信息
	    if(peManagerProduct.getProductId()!=null){	    	
	    	PEProduct peProduct =peProductService.getPEProductById(peManagerProduct.getProductId());
	    	model.addAttribute("peProduct", peProduct);
	    }
    	
        return "web/pe/peManagerDetail";
    }
	
}
