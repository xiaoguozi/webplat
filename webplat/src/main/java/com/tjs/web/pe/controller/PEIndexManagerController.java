package com.tjs.web.pe.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tjs.admin.pe.controller.PEManagerCtrlModel;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEManagerProduct;
import com.tjs.admin.pe.service.PEManagerService;
import com.tjs.admin.pe.util.StatusEnum;

/**
 * 私募经理控制器
 * 
 *@author duanyujun
 *@since 2015年5月2日
 *
 **/

@Controller
@RequestMapping(value = "/web/pe/")
public class PEIndexManagerController {

	@Resource
	private PEManagerService peManagerService ;
	
	
	@RequestMapping("/peIndexManager")
    public String peIndexManager(PEManagerCtrlModel peManagerSearchCtrlModel, Model model) {
      /**查询明星私募经理*/
		PEManagerCtrlModel peManagerCtrlModel = new PEManagerCtrlModel();
		PEManager peManager = new PEManager();
		peManager.setStatus(StatusEnum.ON_LINE.getStatus());
		peManager.setRecommendLocation("2");
		peManagerCtrlModel.setPeManager(peManager);
		peManagerCtrlModel.setPageNo(1);
		peManagerCtrlModel.setPageSize(3);
	    List<PEManagerProduct> lstTopPeManager=peManagerService.selectStarPEManagerList(peManagerCtrlModel);	   
	    model.addAttribute("lstTopPeManager", lstTopPeManager);
	    
	  //** 查询列表*/  
	   peManagerSearchCtrlModel.setPageSize(15);
	   peManager.setRecommendLocation(null);
	   peManagerSearchCtrlModel.setPeManager(peManager);
	   int totalcount=peManagerService.selectStarPEManagerCount(peManagerSearchCtrlModel);	   
	   peManagerSearchCtrlModel.setTotalCount(totalcount);
		 int totalPageNO = peManagerSearchCtrlModel.getTotalPageSize();//总页数
	     if(peManagerSearchCtrlModel.getPageNo()<1){//如果请求的页数小于1，设置成第一页
	    	 peManagerSearchCtrlModel.setPageNo(1);
	     } else if(peManagerSearchCtrlModel.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
	    	 peManagerSearchCtrlModel.setPageNo(totalPageNO);
	     }
	     
	   List<PEManagerProduct> lstPeManager=  peManagerService.selectStarPEManagerList(peManagerSearchCtrlModel);	   
	   model.addAttribute("lstPeManager", lstPeManager);
	   
	   model.addAttribute("SearchCtrlModel", peManagerSearchCtrlModel);
	   
        return "web/pe/peManager";
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
