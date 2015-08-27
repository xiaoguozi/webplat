package com.tjs.web.kybx.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.constants.BannerLocationEnum;
import com.tjs.admin.constants.ProductStatus;
import com.tjs.admin.constants.TjwEnum;
import com.tjs.admin.kybx.constants.KybxClassEnum;
import com.tjs.admin.kybx.controller.KybxCtrlModel;
import com.tjs.admin.kybx.model.Kybx;
import com.tjs.admin.kybx.service.IKybxService;
import com.tjs.admin.model.User;
import com.tjs.admin.order.model.Order;
import com.tjs.admin.order.service.IOrderService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.system.controller.BannerCtrlModel;
import com.tjs.admin.system.model.SysHome;
import com.tjs.admin.system.service.ISysHome;
import com.tjs.admin.utils.StringUtils;

/**
 * 私募首页控制器
 * 
 *@author duanyujun
 *@since 2015年5月2日
 *
 **/

@Controller
@RequestMapping(value = "/web/Kybx/")
public class KybxController {
	@Resource
	private ISysHome sysHomeService;
	 
	@Resource
	private IKybxService kybxService;
	 
	@Resource
    private UserService iUserService;
	
	 
	@Resource
	private IOrderService iOrderService;
	
	
	@RequestMapping("/kybxIndex")
    public String kybxIndex(Model model) {
		
		BannerCtrlModel params =new BannerCtrlModel();
		params.getSysHome().setEnable(1);
		params.setPageSize(3);
		params.getSysHome().setLocationBanner(BannerLocationEnum.KybxIndex.getKey());		
	    List<SysHome> lstSysHome = sysHomeService.selectBanner(params);
	    model.addAttribute("lstSysHome", lstSysHome);
	    
	    KybxCtrlModel kybxCtrlModel = new KybxCtrlModel();
	    kybxCtrlModel.setPageSize(5);
	    kybxCtrlModel.setPageNo(1);
	    kybxCtrlModel.getKybx().setKybxStatus(ProductStatus.online.getKey());
	    kybxCtrlModel.getKybx().setKybxTjw(TjwEnum.BKSY.getKey());
	    kybxCtrlModel.setSortField("kybx_Tjno");
		kybxCtrlModel.setSortType("asc");
	    List<Kybx> lstKybx = kybxService.selectKybx(kybxCtrlModel);
	    model.addAttribute("lstKybx", lstKybx); 
	    model.addAttribute("Indexclass","simu_on");
	    model.addAttribute("flag","index");
        return "web/kybx/kybxIndex";
    }
	
	
	@RequestMapping("/kybxSX")
    public String kybxSX(Model model) {    
	    KybxCtrlModel kybxCtrlModel = new KybxCtrlModel();
	    kybxCtrlModel.setPageSize(8);
	    kybxCtrlModel.setPageNo(1);
	    kybxCtrlModel.getKybx().setKybxStatus(ProductStatus.online.getKey());
	    kybxCtrlModel.getKybx().setKybxClass(KybxClassEnum.CXSX.getKey());
	    kybxCtrlModel.setSortField("kybx_Tjno");
		kybxCtrlModel.setSortType("asc");
	    List<Kybx> lstKybx = kybxService.selectKybx(kybxCtrlModel);
	    model.addAttribute("lstKybx", lstKybx);
	    model.addAttribute("bxSXclass","simu_on");
	    model.addAttribute("flag","bxsx");
        return "web/kybx/kybxClass";
    }
	
	
	@RequestMapping("/kybxYlbx")
    public String kybxYlbx(Model model) {    
	    KybxCtrlModel kybxCtrlModel = new KybxCtrlModel();
	    kybxCtrlModel.setPageSize(8);
	    kybxCtrlModel.setPageNo(1);
	    kybxCtrlModel.getKybx().setKybxStatus(ProductStatus.online.getKey());
	    kybxCtrlModel.getKybx().setKybxClass(KybxClassEnum.YLBX.getKey());
	    kybxCtrlModel.setSortField("kybx_Tjno");
		kybxCtrlModel.setSortType("asc");
	    List<Kybx> lstKybx = kybxService.selectKybx(kybxCtrlModel);
	    model.addAttribute("lstKybx", lstKybx);
	    model.addAttribute("Ylbxclass","simu_on");
	    model.addAttribute("flag","ylbx");
        return "web/kybx/kybxClass";
    }
	
	
	@RequestMapping("/kybxBzbx")
    public String kybxBzbx(Model model) {    
	    KybxCtrlModel kybxCtrlModel = new KybxCtrlModel();
	    kybxCtrlModel.setPageSize(8);
	    kybxCtrlModel.setPageNo(1);
	    kybxCtrlModel.getKybx().setKybxStatus(ProductStatus.online.getKey());
	    kybxCtrlModel.getKybx().setKybxClass(KybxClassEnum.BFGZ.getKey());
	    kybxCtrlModel.setSortField("kybx_Tjno");
		kybxCtrlModel.setSortType("asc");
	    List<Kybx> lstKybx = kybxService.selectKybx(kybxCtrlModel);
	    model.addAttribute("lstKybx", lstKybx);  
	    model.addAttribute("Bzbxclass","simu_on");
	    model.addAttribute("flag","bzbx");
        return "web/kybx/kybxClass";
    }
	
	
	@RequestMapping("/kybxDetail")
    public String kybxDetail(Model model,@RequestParam(value="id",required=false) Long kybxId,@RequestParam(value="flag",required=false)String flag) {	    
	    Kybx kybx = kybxService.findBykybxId(kybxId);	    
	    model.addAttribute("kybx", kybx);
	    String url="rest/web/Kybx/";
	    String urlName="";
	    if("bzbx".equalsIgnoreCase(flag)){
	    	url=url+"kybxBzbx";
	    	urlName="保费隔资";
	    	model.addAttribute("Bzbxclass","simu_on");
	    }else if("ylbx".equalsIgnoreCase(flag)){	    	
	    	url=url+"kybxYlbx";
	    	urlName="医疗";
	    	model.addAttribute("Ylbxclass","simu_on");
	    }else if("bxsx".equalsIgnoreCase(flag)){
	    	url=url+"kybxSX";
	    	urlName="寿险";
	    	model.addAttribute("bxSXclass","simu_on");
	    }else{
	    	url=url+"kybxIndex";
	    	urlName="保险首页";
	    	model.addAttribute("Indexclass","simu_on");
	    }
	    model.addAttribute("url",url);
	    model.addAttribute("urlName",urlName);
	    
        return "web/kybx/kybxDetail";
    }
	
	
	 /**
	    * 
	    * @return
	    */
	    @RequestMapping("/orderKybx")
	    @ResponseBody
	    public Map<String, String> orderProduct(@RequestParam(value="productId",required=false) Long productId,@RequestParam(value="productType") String productType,@RequestParam(value="alert_name") String userName,@RequestParam(value="alert_tel") String  userTel) {
	    	Order order = new Order();
	    	order.setCreateDate(new Date());
	    	//未处理
	    	order.setOperateStatus("10");
	    	order.setProductType(productType);
	    	order.setProductId(productId);
	    	if(productId!=null){
	    		Kybx kybx = kybxService.findBykybxId(productId);
	    		order.setProductName(kybx.getKybxName());
	    	}   	
	    	order.setTelphone(userTel);;
	    	order.setUserName(userName); 
	    	
	    	Subject subject = SecurityUtils.getSubject();
			String username = (String)subject.getPrincipal();
			if(StringUtils.isNotBlank(username)){
				User user = iUserService.selectByUsername(username);
				order.setUserID(user.getId());
			}
	    	    			 
	    	iOrderService.insertOrder(order);
	    	Map<String, String> result = new HashMap<String, String>();
	    	result.put("result", "true");
	    	return result;
	    }

}
