package com.tjs.web.pe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.pe.controller.PECompanyCtrlModel;
import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PETopProduct;
import com.tjs.admin.pe.service.PECompanyService;
import com.tjs.admin.pe.service.PEManagerService;
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
	
	
	@RequestMapping("/peIndexProduct")
    public String index(PESearchCtrlVO peSearchCtrlVO, Model model) {
		//查询4个顶级私募
		List<PETopProduct> showData = new ArrayList<PETopProduct>();
    	showData = peProductService.getTop4AnyPEProductList();
    	model.addAttribute("top4Data", showData);
    	
    	//全部产品
    	peSearchCtrlVO.setPageSize(3);
    	
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
    	List<PEManager> lstManager = peManagerService.getPEManagerList();
    	model.addAttribute("lstManager", lstManager);
    	
    	//基金公司
    	PECompanyCtrlModel peCompanyModel = new PECompanyCtrlModel();
    	List<PECompany> lstCompany = peCompanyService.getPECompanyList(peCompanyModel);
    	model.addAttribute("lstCompany", lstCompany);
    	model.addAttribute("simuSearchVO", peSearchCtrlVO);
    	
        return "web/pe/peProduct";
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
