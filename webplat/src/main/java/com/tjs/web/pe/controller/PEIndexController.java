package com.tjs.web.pe.controller;

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

import com.tjs.admin.order.model.Order;
import com.tjs.admin.order.service.IOrderService;
import com.tjs.admin.pe.model.PECommonVO;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PETopProduct;
import com.tjs.admin.pe.service.PEProductService;
import com.tjs.admin.system.controller.BannerCtrlModel;
import com.tjs.admin.system.model.SysHome;
import com.tjs.admin.system.service.ISysHome;

/**
 * 私募首页控制器
 * 
 *@author duanyujun
 *@since 2015年5月2日
 *
 **/

@Controller
@RequestMapping(value = "/web/pe/")
public class PEIndexController {

	@Resource
	private PEProductService peProductService;
	
	@Resource
	private IOrderService iOrderService;
	
	@Resource
	private ISysHome sysHomeService;
	
	
	@RequestMapping("/peIndex")
    public String index(PESearchCtrlVO peSearchCtrlVO, Model model) {
		
		BannerCtrlModel params =new BannerCtrlModel();
		params.getSysHome().setEnable(1);
		params.setPageSize(3);
		params.getSysHome().setLocationBanner("30");
		
	    List<SysHome> lstSysHome = sysHomeService.selectBanner(params);
	    model.addAttribute("lstSysHome", lstSysHome);
		
		
		
		//查询4个顶级私募
		List<PETopProduct> showData = new ArrayList<PETopProduct>();
    	showData = peProductService.getTop4PEProductList();
    	
    	int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    	if(peSearchCtrlVO.getCurrentYear()==0){
    		peSearchCtrlVO.setCurrentYear(currentYear);
    	}
    	
    	//查询私募收益排行
    	List<PETopProduct> top10Data = new ArrayList<PETopProduct>();
    	top10Data = peProductService.getTop10PEProductList(peSearchCtrlVO);
    	
    	List<PECommonVO> lstCommon = new ArrayList<PECommonVO>();
    	lstCommon = peProductService.getYearAll(); 
    	
    	model.addAttribute("top4Data", showData);
    	model.addAttribute("top10Data", top10Data);
    	model.addAttribute("lstCommon", lstCommon);
    	model.addAttribute("currentYear", currentYear);
    	model.addAttribute("simuSearchVO", peSearchCtrlVO);
    	
        return "web/pe/peIndex";
    }
	
	/**
    * 
    * @return
    */
    @RequestMapping("/peOrderProduct")
    @ResponseBody
    public Map<String, String> orderProduct(@RequestParam(value="productId",required=false) Long productId,@RequestParam(value="productType") String productType,@RequestParam(value="alert_name") String userName,@RequestParam(value="alert_tel") String  userTel) {
    	Order order = new Order();
    	order.setCreateDate(new Date());
    	//未处理
    	order.setOperateStatus("10");
    	order.setProductType(productType);
    	order.setProductId(productId);
    	if(productId!=null){
    		PEProduct peProduct = peProductService.getPEProductById(productId);
    		order.setProductName(peProduct.getSimpleName());
    	}   	
    	order.setTelphone(userTel);;
    	order.setUserName(userName);    	
//	    	Subject subject = SecurityUtils.getSubject();
//		     if(subject!=null){
//		    	 User user= iUserService.selectByUsername( (String)subject.getPrincipal());
//		    	 order.setUserID(user!=null?user.getId():null);
//		     }
    	    			 
    	iOrderService.insertOrder(order);
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("result", "true");
    	return result;
    }
	
//	@RequestMapping("/insert")
//    public String insert(PEProduct peProduct, PEIndexCtrlModel peProductCtrlModel, Model model) {
//    	model.addAttribute("peProduct", peProduct);
//    	model.addAttribute("ctrlData", peProductCtrlModel);
//        return "admin/pe/peProduct/main";
//    }
//	
//
//    @RequestMapping("/insertData")
//    @ResponseBody
//    public Map<String, Object> insertData(PEProduct peProduct, PEIndexCtrlModel peProductCtrlModel, Model model) {
//    	Map<String, Object> result = new HashMap<String, Object>();
//    	int id = peProductService.insertPEProduct(peProduct, peProductCtrlModel);
//    	result.put("code", "0");
//    	result.put("bizData", peProduct);
//    	
//        return result;
//    }
//	
//	
//	@RequestMapping("/listData")
//    public String listData(PEIndexCtrlModel peProductCtrlModel, Model model) {
//    	List<PEProduct> showData = new ArrayList<PEProduct>();
//    	showData = peProductService.getPEProductList(peProductCtrlModel);
//    	
//    	model.addAttribute("showData", showData);
//		model.addAttribute("ctrlData", peProductCtrlModel);
//    	
//        return "admin/pe/peProduct/listData";
//    }
//	
//	@RequestMapping("/listDataCount")
//    @ResponseBody
//    public Map<String, Integer> listDataCount(PEIndexCtrlModel peProductCtrlModel) {
//    	Map<String, Integer> result = new HashMap<String, Integer>();
//    	
//    	Integer total = peProductService.selectListCount(peProductCtrlModel);
//    	
//    	result.put("total", total);
//    	
//        return result;
//    }
//	
//	@RequestMapping("/update")
//    public String update(PEProduct paraPEProduct, PEIndexCtrlModel peProductCtrlModel, Model model) {
//		PEProduct peProduct = peProductService.getPEProductById(paraPEProduct.getId());
//    	model.addAttribute("peProduct", peProduct);
//    	model.addAttribute("ctrlData", peProductCtrlModel);
//        return "admin/pe/peProduct/update";
//    }
//	
//	@RequestMapping("/updateData")
//    @ResponseBody
//    public Map<String, Object> updateData(PEProduct peProduct, PEIndexCtrlModel peProductCtrlModel, Model model) {
//    	Map<String, Object> result = new HashMap<String, Object>();
//    	int id = peProductService.updatePEProduct(peProduct, peProductCtrlModel);               
//    	result.put("code", "0");
//    	result.put("bizData", peProduct);
//    	
//        return result;
//    }
//
//    @RequestMapping("/view")
//    public String view(PEProduct paraPEProduct, PEIndexCtrlModel peProductCtrlModel, Model model) {
//    	PEProduct peProduct = peProductService.getPEProductById(paraPEProduct.getId());
//    	model.addAttribute("peProduct", peProduct);
//    	model.addAttribute("ctrlData", peProductCtrlModel);
//        return "admin/pe/peProduct/view";
//    }
//    
//    @RequestMapping("/getOnLinePECompanyList")
//    @ResponseBody
//    public  Map<String, Object> getOnLinePECompanyList() {
//    	Map<String, Object> result = new HashMap<String, Object>();
//    	result = peProductService.getOnLinePECompanyList(); 
//        return result;
//    }
}
