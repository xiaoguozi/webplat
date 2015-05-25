package com.tjs.web.pe.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.pe.controller.PEProductNetCtrlModel;
import com.tjs.admin.pe.model.PECommonVO;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PEProductNet;
import com.tjs.admin.pe.model.PETopProduct;
import com.tjs.admin.pe.service.PECompanyService;
import com.tjs.admin.pe.service.PEManagerService;
import com.tjs.admin.pe.service.PEProductNetService;
import com.tjs.admin.pe.service.PEProductService;

/**
 * 私募经理控制器
 * 
 *@author duanyujun
 *@since 2015年5月2日
 *
 **/

@Controller
@RequestMapping(value = "/web/pe/")
public class PEIndexPDetailController {

	@Resource
	private PEProductService peProductService;
	
	@Resource
	private PEProductNetService PEProductNetService;
	
	@Resource
	private PEManagerService peManagerService;
	
	@Resource
	private PECompanyService peCompanyService;
	
	
	@RequestMapping("/peIndexProductDetail")
    public String index(PESearchCtrlVO peSearchCtrlVO, Model model) {
		List<PECommonVO> lstCommonVO = new ArrayList<PECommonVO>();
		//年份
    	int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    	for(int i=0; i<4; i++){
    		PECommonVO c1 = new PECommonVO();
        	c1.setNetYear(String.valueOf(currentYear - i));
        	lstCommonVO.add(c1);
    	}
		
		PEProductNetCtrlModel peProductNetCtrlModel = new PEProductNetCtrlModel();
		peProductNetCtrlModel.setProductId(peSearchCtrlVO.getPeProductId());
		PEProduct peProduct = peProductService.getPEProductById(Long.valueOf(peSearchCtrlVO.getPeProductId()));
		//收益测算
		List<PETopProduct> lstProductRate = peProductService.getCompareYearRate(peSearchCtrlVO, 4);
		//乘以100万
		for(PETopProduct product:lstProductRate){
			product.setNowRate(product.getNowRate().multiply(new BigDecimal(1000000)));
		}
		//净值
		List<PEProductNet> lstPeProductNet = PEProductNetService.getPEProductNetList(peProductNetCtrlModel);
		
		//基金经理信息
		PEManager peManager = peManagerService.getPEManagerById(peProduct.getManagerId());
		
		//基金公司
		PECompany peCompany = peCompanyService.getPECompanyById(peProduct.getPecompanyId());
		
		model.addAttribute("lstYear", lstCommonVO);
		model.addAttribute("peProduct", peProduct);
		model.addAttribute("peManager", peManager);
		model.addAttribute("peCompany", peCompany);
		model.addAttribute("lstProductRate", lstProductRate);
		model.addAttribute("lstPeProductNet", lstPeProductNet);
		model.addAttribute("currentYear", currentYear+"");
		
        return "web/pe/peProductDetail";
    }

}
