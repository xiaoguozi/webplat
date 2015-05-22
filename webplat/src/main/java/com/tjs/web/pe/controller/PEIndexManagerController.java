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
	
}
