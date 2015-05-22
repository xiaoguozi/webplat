package com.tjs.web.pe.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String index(@RequestParam(value="managerId",required=false) Long managerId, Model model) {
//		//查询4个顶级私募
//		List<PETopProduct> showData = new ArrayList<PETopProduct>();
//    	showData = peProductService.getTop4AnyPEProductList();
//    	model.addAttribute("top4Data", showData);
//    	
//    	//全部产品
//    	peProductCtrlModel.setPageSize(10);
//    	List<PETopProduct> lstAll = new ArrayList<PETopProduct>();
//    	lstAll = peProductService.getAnyPEProductList(peProductCtrlModel);
//    	model.addAttribute("lstAll", lstAll);
    	
        return "web/pe/peManagerDetail";
    }
	
}
