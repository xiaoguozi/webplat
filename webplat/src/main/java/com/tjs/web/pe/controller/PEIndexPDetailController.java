package com.tjs.web.pe.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.controller.PEProductIncomeCtrlModel;
import com.tjs.admin.pe.controller.PEProductNetCtrlModel;
import com.tjs.admin.pe.model.PECommonVO;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PEProductIncome;
import com.tjs.admin.pe.model.PEProductNet;
import com.tjs.admin.pe.model.PETopProduct;
import com.tjs.admin.pe.service.PECompanyService;
import com.tjs.admin.pe.service.PEManagerService;
import com.tjs.admin.pe.service.PEProductIncomeService;
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
	
	@Resource
	private PEProductIncomeService peProductIncomeService;
	
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
//		List<PETopProduct> lstProductRate = peProductService.getCompareYearRate(peSearchCtrlVO, 4);
		
		
		//乘以100万
//		for(PETopProduct product:lstProductRate){
//			product.setNowRate(product.getNowRate().multiply(new BigDecimal(1000000)));
//		}
		//净值
		List<PEProductNet> lstPeProductNet = PEProductNetService.getPEProductNetList(peProductNetCtrlModel);
		
		//基金经理信息
		PEManager peManager = peManagerService.getPEManagerById(peProduct.getManagerId());
		
		//基金公司
		PECompany peCompany = peCompanyService.getPECompanyById(peProduct.getPecompanyId());
		
		//旗下产品收益，先查出所有与产品
		PEProductCtrlModel productModel = new PEProductCtrlModel(); 
		productModel.setManagerId(String.valueOf(peProduct.getManagerId()));
		List<PEProduct> lstManageProducts = peProductService.getPEProductList(productModel);
//		for(int i=0; i<lstManageProducts.size(); i++){
//			lstManageProducts.get(i).setRunTime(Integer.valueOf(lstManageProducts.get(i).getRunTime())/30+"");
//		}
		
		//收益排名
		PEProductIncomeCtrlModel incomeCtrlModel = new PEProductIncomeCtrlModel();
		incomeCtrlModel.setProductId(peSearchCtrlVO.getPeProductId());
		incomeCtrlModel.setSortField("year");
		incomeCtrlModel.setSortType("desc");
		List<PEProductIncome> lstProductIncome = peProductIncomeService.getPEProductIncomeList(incomeCtrlModel);
		
		List<PETopProduct> lstProductRate = new ArrayList<PETopProduct>();
		int iCount = 0;
		//收益测算（从收益排名测算） lstProductRate
		for(PEProductIncome income : lstProductIncome){
			if("近一个月".equals(income.getYear()) || "近一月".equals(income.getYear())){
				continue;
			}
			iCount++;
			PETopProduct peNewProduct = new PETopProduct();
			peNewProduct.setNowRate(income.getDurationIncome().multiply(new BigDecimal(10000)));
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
		
		//认购起点
		peProduct.setSubscripStart(peProduct.getSubscripStart().divide(new BigDecimal(10000)));
		
		model.addAttribute("lstYear", lstCommonVO);
		model.addAttribute("peProduct", peProduct);
		model.addAttribute("peManager", peManager);
		model.addAttribute("peCompany", peCompany);
		model.addAttribute("lstProductRate", lstProductRate);
		model.addAttribute("lstPeProductNet", lstPeProductNet);
		model.addAttribute("currentYear", currentYear+"");
		model.addAttribute("lstManageProducts", lstManageProducts);
		model.addAttribute("lstProductIncome", lstProductIncome);
		model.addAttribute("rateMax", lstProductRate.get(0).getNowRate());
		model.addAttribute("rateMin", lstProductRate.get(1).getNowRate());
		
		
        return "web/pe/peProductDetail";
    }
	
//	private int calcYearOrgMonth(Date date){
//		Calendar calendarNow = Calendar.getInstance();
//		
//		Calendar calendarDate = Calendar.getInstance();
//		calendarDate.setTime(date);
//		
//		long betweenDays=(calendarNow.getTimeInMillis()-calendarDate.getTimeInMillis())/(1000*3600*24); 
//		
//		int allMonth = (int)betweenDays/30;
//		return allMonth;
//	}

}
