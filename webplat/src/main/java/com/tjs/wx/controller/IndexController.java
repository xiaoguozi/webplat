package com.tjs.wx.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.service.IProductXtcpService;


/**
 * 控制器
 * 
 * @author hzg
 * @since 2015年7月15日 下午3:54:00
 **/
@Controller
@RequestMapping(value ="/wx")
public class IndexController {
	
    @Resource
    private IProductXtcpService productXtcpService;
    
	@RequestMapping("/index")
    public String index(Model model) {		
		List<ProductXtcp> lstXtcp =  productXtcpService.selectProductXtcpIndex();
		if(lstXtcp!=null&&lstXtcp.size()>0){
			model.addAttribute("xtcp", lstXtcp.get(0));
		}else{
			model.addAttribute("xtcp", new ProductXtcp());	
		}
        return "wx/index";
    }
}
