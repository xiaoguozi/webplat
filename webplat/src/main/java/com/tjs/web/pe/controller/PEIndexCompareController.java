package com.tjs.web.pe.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.pe.controller.PEProductIncomeCtrlModel;
import com.tjs.admin.pe.model.PECommonVO;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PEProductIncome;
import com.tjs.admin.pe.model.PETopProduct;
import com.tjs.admin.pe.service.PEManagerService;
import com.tjs.admin.pe.service.PEProductIncomeService;
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
	
	@Resource
	private PEProductIncomeService peProductIncomeService;
	
	
	@RequestMapping("/peIndexCompare")
    public String index(PESearchCtrlVO peSearchCtrlVO, Model model) {
		List<PECommonVO> lstCommonVO = new ArrayList<PECommonVO>();
		//年份
    	int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    	for(int i=0; i<4; i++){
    		PECommonVO c1 = new PECommonVO();
        	c1.setNetYear(String.valueOf(currentYear - i));
        	lstCommonVO.add(c1);
    	}
		
		List<List<PETopProduct>> lstYearAll = new ArrayList<List<PETopProduct>>();
//    	String productIdArray = peSearchCtrlVO.getProductIdArray();
//    	String[] ids = productIdArray.split(",");
//    	for(String id : ids){
//    		peSearchCtrlVO.setPeProductId(id);
//    		List<PETopProduct> lstRateVO = peProductService.getCompareYearRate(peSearchCtrlVO, 3);
//    		lstYearAll.add(lstRateVO);
//    	}
    	
    	
    	String productIdArray = peSearchCtrlVO.getProductIdArray();
    	String[] ids = productIdArray.split(",");
    	for(String id : ids){
    		//查询收益排名
        	PEProductIncomeCtrlModel incomeCtrlModel = new PEProductIncomeCtrlModel();
    		incomeCtrlModel.setProductId(id);
    		incomeCtrlModel.setSortField("year");
    		incomeCtrlModel.setSortType("desc");
    		List<PEProductIncome> lstProductIncome = peProductIncomeService.getPEProductIncomeList(incomeCtrlModel);
    		PEProduct peProduct = peProductService.getPEProductById(Long.valueOf(id));
    		PEManager peManager = PEManagerService.getPEManagerById(peProduct.getManagerId());
    		
    		List<PETopProduct> lstProductRate = new ArrayList<PETopProduct>();
    		int iCount = 0;
    		//收益测算（从收益排名测算） lstProductRate
    		for(PEProductIncome income : lstProductIncome){
    			if("近一个月".equals(income.getYear()) || "近一月".equals(income.getYear())){
    				continue;
    			}
    			iCount++;
    			PETopProduct peNewProduct = new PETopProduct();
    			peNewProduct.setNowRate(income.getDurationIncome());
    			lstProductRate.add(peNewProduct);
    			if(iCount==4){
    				break;
    			}
    		}
    		
    		if(iCount<4){
    			for(int i=0; i<4-iCount; i++){
    				PETopProduct peEmptyProduct = new PETopProduct();
    				peEmptyProduct.setNowRate(new BigDecimal(0));
    				lstProductRate.add(peEmptyProduct);
    			}
    		}
    		
    		PETopProduct peNewProduct = new PETopProduct();
			peNewProduct.setNowRate(peProduct.getYearRate());
			lstProductRate.get(0).setName(peProduct.getName());
			lstProductRate.get(0).setId(Long.valueOf(id));
			lstProductRate.get(0).setAccumulatedIncome(peProduct.getAccumulatedIncome());
			lstProductRate.get(0).setRunTime(peProduct.getRunTime());
			lstProductRate.get(0).setManagerId(String.valueOf(peProduct.getManagerId()));
			lstProductRate.get(0).setManagerName(peProduct.getManagerName());
			lstProductRate.get(0).setManageFund(peManager.getManageFund());
			lstProductRate.get(0).setCompanyName(peManager.getCompanyName());
			lstProductRate.get(0).setFundType(peProduct.getFundType());
			lstProductRate.get(0).setSubscripStart(peProduct.getSubscripStart().divide(new BigDecimal(10000)));
			lstProductRate.get(0).setSubscripFee(peProduct.getSubscripFee());
			lstProductRate.get(0).setOpenTime(peProduct.getOpenTime());
			
			lstProductRate.get(0).setProfitRate(new BigDecimal(peManager.getProfitProduct()).divide(
					new BigDecimal(peManager.getManageFund()), 2, RoundingMode.FLOOR).multiply(new BigDecimal(100)));
    		lstProductRate.add(1, peNewProduct);
    		lstYearAll.add(lstProductRate);
    	}
    	
    	
    	
    	model.addAttribute("maxYearList", lstCommonVO);
    	model.addAttribute("lstYearAll", lstYearAll);
    	model.addAttribute("currentYear", Calendar.getInstance().get(Calendar.YEAR)+"");
    	
        return "web/pe/peCompare";
    }
	
	
	
}
