package com.tjs.web.pe.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tjs.admin.pe.controller.PECompanyCtrlModel;
import com.tjs.admin.pe.controller.PEManagerCtrlModel;
import com.tjs.admin.pe.controller.PEProductNetCtrlModel;
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
 * 私募产品控制器
 * 
 *@author duanyujun
 *@since 2015年5月2日
 *
 **/

@Controller
@RequestMapping(value = "/web/pe/")
public class PEIndexProductController {

	@Resource
	private PEProductService peProductService;
	
	@Resource
	private PEManagerService peManagerService;
	
	@Resource
	private PECompanyService peCompanyService;
	
	@Resource
	private PEProductNetService peProductNetService;
	
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	
	
	@RequestMapping("/peIndexProduct")
    public String index(PESearchCtrlVO peSearchCtrlVO, Model model) {
		//查询4个顶级私募
		List<PETopProduct> showData = new ArrayList<PETopProduct>();
    	showData = peProductService.getTop4AnyPEProductList();
    	model.addAttribute("top4Data", showData);
    	
    	//全部产品
    	peSearchCtrlVO.setPageSize(10);
    	
    	//设置总条数
    	int totalCount = peProductService.getAnyPEProductListCount(peSearchCtrlVO);
    	peSearchCtrlVO.setTotalCount(totalCount); 
    	
    	//判断请求页
        int totalPageNO = peSearchCtrlVO.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(peSearchCtrlVO.getPageNo()<1){//如果请求的页数小于1，设置成第一页
        	peSearchCtrlVO.setPageNo(1);
        } else if(peSearchCtrlVO.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	peSearchCtrlVO.setPageNo(totalPageNO);
        }else{
        	currentPageNo = peSearchCtrlVO.getPageNo();
        }
    	
        peSearchCtrlVO.setPageNo(currentPageNo);
    	
    	List<PETopProduct> lstAll = new ArrayList<PETopProduct>();
    	lstAll = peProductService.getAnyPEProductList(peSearchCtrlVO);
    	model.addAttribute("lstAll", lstAll);
    	
    	//基金经理
    	PEManagerCtrlModel peManagerCtrlModel = new PEManagerCtrlModel();
    	List<PEManager> lstManager = peManagerService.getPEManagerList(peManagerCtrlModel);
    	model.addAttribute("lstManager", lstManager);
    	
    	//基金公司
    	PECompanyCtrlModel peCompanyModel = new PECompanyCtrlModel();
    	List<PECompany> lstCompany = peCompanyService.getPECompanyList(peCompanyModel);
    	model.addAttribute("lstCompany", lstCompany);
    	model.addAttribute("simuSearchVO", peSearchCtrlVO);
    	
        return "web/pe/peProduct";
    }
	
	
	@RequestMapping("/peProductChart")
    @ResponseBody
    public String productChart(@RequestParam(value="productId") String productId) {
		PEProductNetCtrlModel peProductNetCtrlModel = new PEProductNetCtrlModel();
		peProductNetCtrlModel.setProductId(productId);
		peProductNetCtrlModel.setSortField("net_time");
		peProductNetCtrlModel.setSortType("asc");
		peProductNetCtrlModel.setPageNo(0);
		PEProduct peProduct = peProductService.getPEProductById(Long.valueOf(productId));

		List<PEChartVO> lstChartVO = new ArrayList<PEChartVO>();
		//净值
		List<PEProductNet> lstPeProductNet = peProductNetService.getPEProductNetList(peProductNetCtrlModel);
		PEChartVO peChartVO = new PEChartVO();
		peChartVO.setName(peProduct.getName());
		for(PEProductNet peProductNet : lstPeProductNet){
			//lstData.add(peProductNet.getTotalNet());
			Object[] dateValue = new Object[2];
			dateValue[0] =  calcTime(peProductNet.getNetTime());
			dateValue[1] = peProductNet.getTotalNet();
			peChartVO.getData().add(dateValue);
		}
		lstChartVO.add(peChartVO);
		
		String series = gson.toJson(lstChartVO);
		
		return series;
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
