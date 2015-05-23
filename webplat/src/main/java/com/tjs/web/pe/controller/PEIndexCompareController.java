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
		
		//年份
    	int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    	List<PECommonVO> lstCommonVO = new ArrayList<PECommonVO>();
    	PECommonVO c1 = new PECommonVO();
    	c1.setNetYear(String.valueOf(currentYear));
    	lstCommonVO.add(c1);
    	
    	PECommonVO c2 = new PECommonVO();
    	c2.setNetYear(String.valueOf(currentYear-1));
    	lstCommonVO.add(c2);
    	
    	PECommonVO c3 = new PECommonVO();
    	c3.setNetYear(String.valueOf(currentYear-2));
    	lstCommonVO.add(c3);
		
    	
		List<List<PETopProduct>> lstYearAll = new ArrayList<List<PETopProduct>>();
    	String productIdArray = peSearchCtrlVO.getProductIdArray();
    	String[] ids = productIdArray.split(",");
    	for(String id : ids){
    		PETopProduct tempProduct = new PETopProduct();
    		peSearchCtrlVO.setPeProductId(id);
    		List<PETopProduct> lstRateVO = peProductService.getCompareYearRate(peSearchCtrlVO);
    		Map<String, PETopProduct> map = new HashMap<String, PETopProduct>();
    		for(PETopProduct peVO : lstRateVO){
    			map.put(peVO.getNetYear(), peVO);
    		}
    		
    		//循环年份
    		for(PECommonVO peCommonVO : lstCommonVO){
    			if(map.get(peCommonVO.getNetYear())==null){
    				PEProduct peProduct = null;
    				if(lstRateVO.size()==0){
        				peProduct = peProductService.getPEProductById(Long.valueOf(id));
        				tempProduct.setId(Long.valueOf(id));
        				tempProduct.setName(peProduct.getName());
        				tempProduct.setManagerId(String.valueOf(peProduct.getManagerId()));
        				tempProduct.setManagerName(peProduct.getManagerName());
        				PEManager peManager = PEManagerService.getPEManagerById(peProduct.getManagerId());
        				tempProduct.setManageFund(peManager.getManageFund());
        			}else{
        				tempProduct.setId(lstRateVO.get(0).getId());
        				tempProduct.setName(lstRateVO.get(0).getName());
        				tempProduct.setManagerId(lstRateVO.get(0).getManagerId());
        				tempProduct.setManagerName(lstRateVO.get(0).getManagerName());
        				PEManager peManager = PEManagerService.getPEManagerById(Long.valueOf(lstRateVO.get(0).getManagerId()));
        				tempProduct.setManageFund(peManager.getManageFund());
        			}
    				lstRateVO.add(tempProduct);
    			}
    		}
    		
    		lstYearAll.add(lstRateVO);
    	}
    	
    	model.addAttribute("maxYearList", lstCommonVO);
    	model.addAttribute("lstYearAll", lstYearAll);
    	model.addAttribute("currentYear", Calendar.getInstance().get(Calendar.YEAR)+"");
    	
        return "web/pe/peCompare";
    }
	
	
	
}
