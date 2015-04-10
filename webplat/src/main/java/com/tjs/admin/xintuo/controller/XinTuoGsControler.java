package com.tjs.admin.xintuo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.admin.xintuo.service.IProductXtgsService;
/**
 * 系统产品//http://127.0.0.1:8080/webplat/product/xt/list?method=getXtList
 * 
 * @author 何志刚
 * @since 2015年3月21日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/admin/xintuo/xintuogs")
public class XinTuoGsControler {
	
	 @Resource
	 private IProductXtgsService iProductXtService;

       
    @RequestMapping("/xtgsIndex")
    public String xtgsIndex() {
        return "admin/xintuo/xtgsIndex";
    }
    
    @RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(@RequestParam(required=false)XinTuoGsCtrlModel xintuoGsCtrlModel, Model model) {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	Integer total = iProductXtService.countProductXtgs(xintuoGsCtrlModel);
    	
    	result.put("total", total);
    	
        return result;
    }

    
    @RequestMapping("/listData")
    public String listData(XinTuoGsCtrlModel xintuoGsCtrlModel, Model model) {
    	List<ProductXtgs> showData = new ArrayList<ProductXtgs>();
    	showData = iProductXtService.selectProductXtgs(xintuoGsCtrlModel);
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", xintuoGsCtrlModel);
    	
        return "admin/xintuo/gsListData";
    }
    
    @RequestMapping("/insert")
    public String insert(ProductXtgs productXtgs, XinTuoGsCtrlModel xintuoGsCtrlModel, Model model) {
    	
    	model.addAttribute(productXtgs);
    	model.addAttribute("ctrlData", xintuoGsCtrlModel);
        return "admin/xintuo/insertGs";
    }
  

    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(ProductXtgs productXtgs, XinTuoGsCtrlModel xintuoGsCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = iProductXtService.insertProductXtgs(productXtgs);
    	result.put("code", "0");
    	result.put("bizData", productXtgs);
    	
        return result;
    }


    @RequestMapping("/update")
    public String update(@RequestParam(value="id",required=false) Long xtgsId, XinTuoGsCtrlModel xintuoGsCtrlModel, Model model) {
    	ProductXtgs productXtgs = iProductXtService.findByProductXtgsId(xtgsId);
    	System.err.println(">>>>>>"+productXtgs.getXgtsStatus());
    	model.addAttribute(productXtgs);
    	model.addAttribute("ctrlData", xintuoGsCtrlModel);
        return "admin/xintuo/updateGs";
    }
  

    @RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(ProductXtgs productXtgs, XinTuoGsCtrlModel xintuoGsCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	iProductXtService.updateProductXtgs(productXtgs);
    	result.put("code", "0");
    	result.put("bizData", productXtgs);
        return result;
    }


    @RequestMapping("/view")
    public String view(@RequestParam(value="id",required=false) Long xtgsId, XinTuoGsCtrlModel xintuoGsCtrlModel, Model model) {
    	ProductXtgs productXtgs = iProductXtService.findByProductXtgsId(xtgsId);
    	model.addAttribute(productXtgs);
    	model.addAttribute("ctrlData", xintuoGsCtrlModel);
        return "admin/xintuo/viewGs";
    }
    
    @RequestMapping("/deleteData")
    public  Map<String, Object> deleteData(@RequestParam(value="ids",required=false) Long[] xtgsIds, XinTuoGsCtrlModel xintuoGsCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	iProductXtService.deleteBatchProductXtgs(xtgsIds);;
    	result.put("code", "0");
    	model.addAttribute("ctrlData", xintuoGsCtrlModel);
        return result;
    }
    
    
    
}
