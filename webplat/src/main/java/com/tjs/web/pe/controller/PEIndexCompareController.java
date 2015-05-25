package com.tjs.web.pe.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.pe.model.PECommonVO;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PETopProduct;
import com.tjs.admin.pe.service.PEManagerService;
import com.tjs.admin.pe.service.PEProductService;

/**
 * 私募排行控制器
 * 
 *@author duanyujun
 *@since 2015年5月2日
 *
 **/

@Controller
@RequestMapping(value = "/web/pe/")
public class PEIndexCompareController {

	@Resource
	private PEProductService peProductService;
	
	@Resource
	private PEManagerService PEManagerService;
	
	
	@RequestMapping("/peIndexCompare")
    public String index(PESearchCtrlVO peSearchCtrlVO, Model model) {
		List<PECommonVO> lstCommonVO = new ArrayList<PECommonVO>();
		//年份
    	int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    	for(int i=0; i<3; i++){
    		PECommonVO c1 = new PECommonVO();
        	c1.setNetYear(String.valueOf(currentYear - i));
        	lstCommonVO.add(c1);
    	}
		
		List<List<PETopProduct>> lstYearAll = new ArrayList<List<PETopProduct>>();
    	String productIdArray = peSearchCtrlVO.getProductIdArray();
    	String[] ids = productIdArray.split(",");
    	for(String id : ids){
    		peSearchCtrlVO.setPeProductId(id);
    		List<PETopProduct> lstRateVO = peProductService.getCompareYearRate(peSearchCtrlVO, 3);
    		lstYearAll.add(lstRateVO);
    	}
    	
    	model.addAttribute("maxYearList", lstCommonVO);
    	model.addAttribute("lstYearAll", lstYearAll);
    	model.addAttribute("currentYear", Calendar.getInstance().get(Calendar.YEAR)+"");
    	
        return "web/pe/peCompare";
    }
	
	
	
}
