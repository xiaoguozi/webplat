package com.tjs.web.xintuo.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.xintuo.controller.XinTuoCpCtrlModel;
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.service.IProductXtcpService;
/**
 * 系统产品//http://127.0.0.1:8080/webplat/product/xt/list?method=getXtList
 * 
 * @author 何志刚
 * @since 2015年3月21日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/web/xintuo/trust")
public class TrustController {
	@Resource
	private IProductXtcpService iProductXtService;
	
    @RequestMapping("/trustIndex")
    public String trustIndex(Model model) {
    	XinTuoCpCtrlModel ctrlModel = new XinTuoCpCtrlModel();
    	ctrlModel.setFormat(true);
        //查询前面四个
    	List<ProductXtcp> lstTopVos = iProductXtService.selectProductXtcpTrustTopIndex(ctrlModel);
        //下面按类型查询 ,小型
    	ProductXtcp productXtcp =ctrlModel.getProductXtcp(); 
    	productXtcp.setXtcpXtlx("10");
    	List<ProductXtcp> lstTopfootSmalls =iProductXtService.selectProductXtcpTrustFootIndex(ctrlModel);
    	
    	 //下面按类型查询 ,小型
    	productXtcp.setXtcpXtlx("20");
    	List<ProductXtcp> lstTopfootOnes =iProductXtService.selectProductXtcpTrustFootIndex(ctrlModel);
    	
    	 //下面按类型查询 ,一年
    	productXtcp.setXtcpXtlx("30");
    	List<ProductXtcp> lstTopfootHighs =iProductXtService.selectProductXtcpTrustFootIndex(ctrlModel);
    	
    	
    	 //下面按类型查询 
    	productXtcp.setXtcpXtlx("40");
    	List<ProductXtcp> lstTopfootOthers =iProductXtService.selectProductXtcpTrustFootIndex(ctrlModel);
    	
    	System.err.println(">>>>>>>>>>>"+lstTopVos.size());
    	
    	model.addAttribute("lstTopVos", lstTopVos);
    	model.addAttribute("lstTopfootSmalls", lstTopfootSmalls);
    	model.addAttribute("lstTopfootOnes", lstTopfootOnes);
    	model.addAttribute("lstTopfootHighs", lstTopfootHighs);
    	model.addAttribute("lstTopfootOthers", lstTopfootOthers);  	  	
        return "web/xintuo/trustIndex";
    }
    
  
}
