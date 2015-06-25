package com.tjs.web.pe.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tjs.admin.pe.controller.PEManagerCtrlModel;
import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.controller.PEProductIncomeCtrlModel;
import com.tjs.admin.pe.controller.PEProductNetCtrlModel;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEManagerProduct;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PEProductIncome;
import com.tjs.admin.pe.model.PEProductNet;
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
	
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	
	
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
	    
	   
	    
	    if(peManagerProduct.getProductId()!=null){
	    	//获取产品信息
	    	PEProduct peProduct =peProductService.getPEProductById(peManagerProduct.getProductId());
	    	model.addAttribute("peProduct", peProduct);
	    	
	    	//获取收益表
		    PEProductIncomeCtrlModel peProductIncomeCtrlModel = new PEProductIncomeCtrlModel();
		    peProductIncomeCtrlModel.setProductId(peManagerProduct.getProductId().toString());
		    List<PEProductIncome> lstPEProductIncome = peProductIncomeService.getPEProductIncomeList(peProductIncomeCtrlModel);
		    model.addAttribute("lstPEProductIncome", lstPEProductIncome);
		    
		    
		    //获取净值标
		    PEProductNetCtrlModel peProductNetCtrlModel = new PEProductNetCtrlModel();
		    peProductNetCtrlModel.setProductId(peManagerProduct.getProductId().toString());
		    peProductNetCtrlModel.setSortField("net_time");
			peProductNetCtrlModel.setSortType("asc");
			peProductNetCtrlModel.setPageNo(0);
		    List<PEProductNet> lstPEProductNet = peProductNetService.getPEProductNetList(peProductNetCtrlModel);
		    
		    
		    List<PEChartVO> lstChartVO = new ArrayList<PEChartVO>();
		    PEChartVO peChartVO = new PEChartVO();
			peChartVO.setName(peProduct.getName());
			for(PEProductNet peProductNet : lstPEProductNet){
				//lstData.add(peProductNet.getTotalNet());
				Object[] dateValue = new Object[2];
				dateValue[0] =  calcTime(peProductNet.getNetTime());
				dateValue[1] = peProductNet.getTotalNet();
				peChartVO.getData().add(dateValue);
			}
			lstChartVO.add(peChartVO);
			
			//查询沪深300指数
			peProductNetCtrlModel.setProductId(String.valueOf(300000+peManagerProduct.getProductId()));
			List<PEProductNet> lstPeHs300 = peProductNetService.getPEProductNetList(peProductNetCtrlModel);
			PEChartVO peHs300ChartVO = new PEChartVO();
			peHs300ChartVO.setName("沪深300");
			for(PEProductNet peProductNet : lstPeHs300){
				//lstData.add(peProductNet.getTotalNet());
				Object[] dateValue = new Object[2];
				dateValue[0] =  calcTime(peProductNet.getNetTime());
				dateValue[1] = peProductNet.getTotalNet();
				peHs300ChartVO.getData().add(dateValue);
			}
			lstChartVO.add(peHs300ChartVO);
			
			//再逆序排一下净值明细
			List<PEProductNet> lstPeProductNetAsc = new ArrayList<PEProductNet>();
			for(int i=lstPEProductNet.size()-1; i>=0; i--){
				lstPeProductNetAsc.add(lstPEProductNet.get(i));
			}
			model.addAttribute("lstPEProductNet", lstPeProductNetAsc);
			
			String series = gson.toJson(lstChartVO);
			model.addAttribute("valueSeries", series);
	    }	    	   	    
	    //旗下产品收益 
	    PEProductCtrlModel peProductCtrlModel = new PEProductCtrlModel();
	    peProductCtrlModel.setManagerId(managerId.toString());
	    List<PEProduct> lstPEProduct = peProductService.getPEProductList(peProductCtrlModel);
	    model.addAttribute("lstPEProduct", lstPEProduct);
        return "web/pe/peManagerDetail";
    }
	
	private Long calcTime(Date dateSource){
		if(dateSource==null){
			return 0L;
		}
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(dateSource);
		
		int zoneOffset = cal.get(Calendar.ZONE_OFFSET);
		int dstOffset = cal.get(Calendar.DST_OFFSET);
		
		cal.add(Calendar.MILLISECOND, -(zoneOffset + dstOffset));
		
		return cal.getTimeInMillis();
		
	}
	
}
