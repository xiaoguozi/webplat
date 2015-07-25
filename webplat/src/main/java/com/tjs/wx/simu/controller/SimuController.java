package com.tjs.wx.simu.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tjs.admin.order.model.Order;
import com.tjs.admin.order.service.IOrderService;
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
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.web.pe.controller.PEChartVO;
import com.tjs.web.pe.controller.PESearchCtrlVO;
import com.tjs.wx.xintuo.controller.XintuoCtrlModel;

@Controller
@RequestMapping(value ="/wx/simu")
public class SimuController {
	
    
	@Resource
	private PEProductService peProductService;
	
	@Resource
	private PEProductNetService peProductNetService;
	
	@Resource
	private PEManagerService peManagerService;
	
	@Resource
	private PECompanyService peCompanyService;
	
	@Resource
	private IOrderService iOrderService;
	
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

	@RequestMapping("/list")
    public String list(Model model,PESearchCtrlVO peSearchCtrlVO) {			
		//设置总条数
		peSearchCtrlVO.setPageSize(5);
		int totalCount = peProductService.getRatePEProductListCount(peSearchCtrlVO);
		peSearchCtrlVO.setTotalCount(totalCount); 
    	
    	//判断请求页
        int totalPageNO = peSearchCtrlVO.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(peSearchCtrlVO.getPageNo()<1||totalPageNO==0){//如果请求的页数小于1，设置成第一页
        	currentPageNo =1;
        } else if(peSearchCtrlVO.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	currentPageNo =totalPageNO;
        }else{
        	currentPageNo = peSearchCtrlVO.getPageNo();
        }
        
        peSearchCtrlVO.setPageNo(currentPageNo);
        List<PETopProduct> lstProductVO = peProductService.getRatePEProductList(peSearchCtrlVO);
        for(PETopProduct product : lstProductVO){
        	product.setSubscripStart(product.getSubscripStart().divide(new BigDecimal(10000)));
        }
    	//分页结束
    	model.addAttribute("lstProductVO", lstProductVO);
    	model.addAttribute("peSearchCtrlVO", peSearchCtrlVO);
    	
        return "wx/simu/simuList";
    }
	
	
	@RequestMapping("/listMore")
	@ResponseBody
    public Map<String, Object> listMore(PESearchCtrlVO peSearchCtrlVO) {
		Map<String, Object> result = new HashMap<String, Object>();		
		peSearchCtrlVO.setPageSize(5);
		int totalCount = peProductService.getRatePEProductListCount(peSearchCtrlVO);
		peSearchCtrlVO.setTotalCount(totalCount); 
    	
    	//判断请求页
        int totalPageNO = peSearchCtrlVO.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(peSearchCtrlVO.getPageNo()<1||totalPageNO==0){//如果请求的页数小于1，设置成第一页
        	currentPageNo =1;
        } else if(peSearchCtrlVO.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	currentPageNo =totalPageNO;
        }else{
        	currentPageNo = peSearchCtrlVO.getPageNo();
        }
        
        peSearchCtrlVO.setPageNo(currentPageNo);
        List<PETopProduct> lstProductVO = peProductService.getRatePEProductList(peSearchCtrlVO);
        
    	if(lstProductVO==null){
    		lstProductVO = new ArrayList<PETopProduct>();
    	}else {
    		for(PETopProduct product : lstProductVO){
            	product.setSubscripStart(product.getSubscripStart().divide(new BigDecimal(10000)));
            }
		}
    	result.put("peSearchCtrlVO", peSearchCtrlVO);
    	result.put("bizData", lstProductVO);
        return result;
    }
	
	@RequestMapping("/simuInfo")
    public String xintuoInfo() {				
        return "wx/simu/simuInfo";
    }
	
	@RequestMapping("/detail")
    public String detail(PESearchCtrlVO peSearchCtrlVO, Model model) {	
		PEProduct peProduct = peProductService.getPEProductById(Long.valueOf(peSearchCtrlVO.getPeProductId()));
		peProduct.setSubscripStart(peProduct.getSubscripStart().divide(new BigDecimal(10000)));
		
		List<PEChartVO> lstChartVO = new ArrayList<PEChartVO>();
		
		PEProductNetCtrlModel peProductNetCtrlModel = new PEProductNetCtrlModel();
		peProductNetCtrlModel.setProductId(peSearchCtrlVO.getPeProductId());
		peProductNetCtrlModel.setSortField("net_time");
		peProductNetCtrlModel.setSortType("asc");
		peProductNetCtrlModel.setPageNo(0);
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
		
		//基金经理信息
		PEManager peManager = peManagerService.getPEManagerById(peProduct.getManagerId());
		
		//基金公司
		PECompany peCompany = peCompanyService.getPECompanyById(peProduct.getPecompanyId());
		
    	model.addAttribute("valueSeries", series);
		model.addAttribute("simucp", peProduct);
		model.addAttribute("peManager", peManager);
		model.addAttribute("peCompany", peCompany);
		
        return "wx/simu/simuDetail";
    }
	
	@RequestMapping("/reservePage")
    public String reservePage(XintuoCtrlModel xintuoCtrlModel, Model model) {
		Long productId = xintuoCtrlModel.getProductId();
		PEProduct peProduct = peProductService.getPEProductById(productId);
		
		model.addAttribute("simuName", peProduct.getSimpleName());
		model.addAttribute("productId", productId);
        return "wx/simu/reserve";
    }
	
	/**
     * 
     * @return
     */
     @RequestMapping("/orderProduct")
     public String orderProduct(@RequestParam(value="productId",required=false) Long productId,
    		 @RequestParam(value="userName") String userName,
    		 @RequestParam(value="userPhone") String  userPhone,
    		 @RequestParam(value="dataRemark") String dataRemark) {
     	Order order = new Order();
     	order.setCreateDate(new Date());
     	//未处理
     	order.setOperateStatus("10");
     	order.setProductType("20");
     	order.setProductId(productId);
     	order.setRemark(dataRemark);
     	if(productId!=null){
     		PEProduct peProduct = peProductService.getPEProductById(productId);
     		order.setProductName(peProduct.getSimpleName());
     	}   	
     	order.setTelphone(userPhone);;
     	order.setUserName(userName);    	
     	
     	iOrderService.insertOrder(order);
     	
     	return "wx/xintuo/success";
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
