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

import com.tjs.admin.xintuo.model.Lable;
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.admin.xintuo.service.IProductXtcpService;
import com.tjs.admin.xintuo.service.IProductXtgsService;
/**
 * 系统产品//http://127.0.0.1:8080/webplat/product/xt/list?method=getXtList
 * 
 * @author 何志刚
 * @since 2015年3月21日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/admin/xintuo/xintuocp")
public class XinTuoCpControler {
	
	 @Resource
	 private IProductXtcpService iProductXtService;
	 
	 @Resource
	 private IProductXtgsService iProductXtgsService;

    
    @RequestMapping("/xtcpIndex")
    public String xtgsIndex() {
        return "admin/xintuo/xtcpIndex";
    }
    
    @RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(XinTuoCpCtrlModel xintuoCpCtrlModel, Model model) {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	Integer total = iProductXtService.countProductXtcp(xintuoCpCtrlModel);
    	
    	result.put("total", total);
    	
        return result;
    }

    
    @RequestMapping("/listData")
    public String listData(XinTuoCpCtrlModel xintuoCpCtrlModel, Model model) {
    	List<ProductXtcp> showData = new ArrayList<ProductXtcp>();
    	showData = iProductXtService.selectProductXtcp(xintuoCpCtrlModel);
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", xintuoCpCtrlModel);
    	
        return "admin/xintuo/cpListData";
    }
    
    @RequestMapping("/insert")
    public String insert(ProductXtcp productXtcp, XinTuoGsCtrlModel xintuoCpCtrlModel, Model model) {
    	
    	model.addAttribute(productXtcp);
    	model.addAttribute("ctrlData", xintuoCpCtrlModel);
        return "admin/xintuo/insertCp";
    }
  

    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(ProductXtcp productXtcp, XinTuoCpCtrlModel xintuoCpCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = iProductXtService.insertProductXtcp(productXtcp);
    	result.put("code", "0");
    	result.put("bizData", productXtcp);
    	
        return result;
    }


    @RequestMapping("/update")
    public String update(@RequestParam(value="id",required=false) Long xtcpId, XinTuoCpCtrlModel xintuoCpCtrlModel, Model model) {
    	ProductXtcp productXtcp = iProductXtService.findByProductXtcpId(xtcpId);
    	model.addAttribute(productXtcp);
    	model.addAttribute("ctrlData", xintuoCpCtrlModel);
        return "admin/xintuo/updateCp";
    }
  

    @RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(ProductXtcp productXtgs, XinTuoGsCtrlModel xintuoGsCtrlModel, Model model) {
    	
    	System.err.println(">>>>>>>>>>>"+productXtgs.getXtcpXtlx());
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = iProductXtService.updateProductXtcp(productXtgs);
    	result.put("code", "0");
    	result.put("bizData", productXtgs);
    	
        return result;
    }


    @RequestMapping("/view")
    public String view(@RequestParam(value="id",required=false) Long xtcpId, XinTuoGsCtrlModel xintuoGsCtrlModel, Model model) {
    	ProductXtcp productXtgs = iProductXtService.findByProductXtcpId(xtcpId);
    	model.addAttribute(productXtgs);
    	model.addAttribute("ctrlData", xintuoGsCtrlModel);
        return "admin/xintuo/viewCp";
    }
    
    @RequestMapping("/deleteData")
    public  Map<String, Object> deleteData(@RequestParam(value="ids",required=false) Long[] xtcpIds, XinTuoCpCtrlModel xintuoCpCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	iProductXtService.deleteBatchProductXtcp(xtcpIds);;
    	result.put("code", "0");
    	model.addAttribute("ctrlData", xintuoCpCtrlModel);
        return result;
    }
    
    
    @RequestMapping("/queryGsData")
    @ResponseBody
    public  Map<String, Object> queryGsData() {
    	Map<String, Object> result = new HashMap<String, Object>();
    	XinTuoGsCtrlModel xintuoGsCtrlModel = new XinTuoGsCtrlModel();
    	xintuoGsCtrlModel.setPageNo(0);
    	ProductXtgs productXtgs = new ProductXtgs();
    	productXtgs.setXgtsStatus("20");
    	xintuoGsCtrlModel.setProductXtgs(productXtgs);
    	int icount = iProductXtgsService.countProductXtgs(xintuoGsCtrlModel);
    	List<ProductXtgs> lstGs = iProductXtgsService.selectProductXtgs(xintuoGsCtrlModel);
    	List<Lable> lstLable = new ArrayList<Lable>();
    	for(ProductXtgs productXtgs1:lstGs){
    		Lable lable = new Lable();
    		lable.setId(productXtgs1.getXtgsId().toString());
    		lable.setTitle(productXtgs1.getXgtsSplname());
    		lstLable.add(lable);
    	}   	
    	result.put("total", icount);
    	result.put("data", lstLable);   	
        return result;
    }
    
    
    
}
