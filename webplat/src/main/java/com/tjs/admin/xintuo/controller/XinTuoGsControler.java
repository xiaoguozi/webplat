package com.tjs.admin.xintuo.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.admin.xintuo.service.IProductXtgsService;
/**
 * 系统产品//http://127.0.0.1:8080/webplat/product/xt/list?method=getXtList
 * 
 * @author 何志刚
 * @since 2015年3月21日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/admin/xintuogs")
public class XinTuoGsControler {
	
	 @Resource
	 private IProductXtgsService iProductXtService;

    
      
    /**
     * 系统公司List
     * @return
     */
    @RequestMapping(value = "/xtgsList")
    public String xtgsList(Model model) {
    	 List<ProductXtgs> lstProductGs = iProductXtService.selectProductXtgs();
         model.addAttribute("lstProductGs", lstProductGs);
        return "admin/xintuo/xtgsList";
    }
    
    
    
    /**
     * 信托公司详细信息初始化
     * @return
     */
    @RequestMapping(value = "/initXtgs")
    public String initXtgs(Model model ,@RequestParam(value="xtgsId",required=false) Long xtgsId) {  
    	
    	System.err.println(">>>>>123");
    	ProductXtgs productXtgs =  new ProductXtgs();
    	if(xtgsId!=null){
    		productXtgs = iProductXtService.findByProductXtgsId(xtgsId);
    	}    	
    	model.addAttribute("productXtgs", productXtgs);
    	
        return "admin/xintuo/xtgsDetail";
    }


    
    
    /**
     * 系统公司保存
     * @return
     */
    @RequestMapping(value = "/updateXtgs")
    public String updateXtgs(ProductXtgs model) {
    	System.err.println(">>>>>>xxx=="+model.getXtgsId());
    	if(null==model.getXtgsId()||new Long(0).equals(model.getXtgsId())){
    		  iProductXtService.insert(model);
    	}else{
    		 iProductXtService.updateProductXtgs(model);
    	}
      	      	
        return "admin/xintuo/xtgsDetail";
    }
    
    
    
}
