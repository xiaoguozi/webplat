package com.tjs.wx.center.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.service.PEProductService;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.StringUtils;
import com.tjs.admin.xintuo.controller.XinTuoSeachCtrlVO;
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.service.IProductXtcpService;
import com.tjs.web.controller.UserCenterCtrlModel;

/**
 * 微信中心控制器
 * 
 * @author hzg
 * @since 2015年7月15日 下午3:54:00
 **/
@Controller
@RequestMapping(value ="/wx/center")
public class CenterController {
	
	 @Resource
	 private UserService userService;
	 
	 @Resource
	 private UserInfoService UserInfoService;
	 
	 @Resource
	 private IProductXtcpService iProductXtService;
	 
	 @Resource
	 private PEProductService peProductService;
	 
	 
	@RequestMapping("/index")
    public String index(Model model) {		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		
		if(StringUtils.isNotBlank(username)){
			User user = userService.selectByUsername(username);
			UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());			
			model.addAttribute("username", (StringUtils.isBlank(userInfo.getName())?username:userInfo.getName()));		
		}else{
			return "redirect:/rest/web/mlogin";
		}
				
        return "wx/center/index";
    }
	
	
	@RequestMapping("/personInfo")
    public String personInfo(Model model) {		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		
		if(StringUtils.isNotBlank(username)){
			User user = userService.selectByUsername(username);
			UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());			
			model.addAttribute("username", (StringUtils.isBlank(userInfo.getName())?username:userInfo.getName()));
			if(userInfo.getIsValidate()==1){
				userInfo.setCertId(userInfo.getCertId().substring(0,3)+"***********"
			    +userInfo.getCertId().substring(userInfo.getCertId().length()-4));
			}
			model.addAttribute("userInfo",userInfo);
			model.addAttribute("user",user);
		}else{
			return "redirect:/rest/web/mlogin";
		}
				
        return "wx/center/personInfo";
    }	
	
	@RequestMapping("/xtOrder")
    public String xtOrder(Model model) {		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		
		if(StringUtils.isNotBlank(username)){
			User user = userService.selectByUsername(username);
			XinTuoSeachCtrlVO xinTuoSeachCtrlVO = new XinTuoSeachCtrlVO();
			xinTuoSeachCtrlVO.setUserId(user.getId());
			xinTuoSeachCtrlVO.setTelPhone(username);
			xinTuoSeachCtrlVO.setPageSize(12);
	    	int totalcount = iProductXtService.countOrderXtcp(xinTuoSeachCtrlVO);
	    	xinTuoSeachCtrlVO.setTotalCount(totalcount); 
	    	
	    	//判断请求页
	        int totalPageNO = xinTuoSeachCtrlVO.getTotalPageSize();//总页数
	        int currentPageNo = 1;//当前页
	        if(xinTuoSeachCtrlVO.getPageNo()<1||totalPageNO==0){//如果请求的页数小于1，设置成第一页
	        	currentPageNo =1;
	        } else if(xinTuoSeachCtrlVO.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
	        	currentPageNo =totalPageNO;
	        }else{
	        	currentPageNo = xinTuoSeachCtrlVO.getPageNo();
	        }
	        
	    	xinTuoSeachCtrlVO.setPageNo(currentPageNo);			
			List<ProductXtcp> lstProduct = iProductXtService.selectOrderXtcp(xinTuoSeachCtrlVO);
			model.addAttribute("lstProduct",lstProduct);
		}else{
			return "redirect:/rest/web/mlogin";
		}
								
        return "wx/center/xtOrder";
    }
	
	
	@RequestMapping("/listMore")
    public Map<String, Object> listMore(XinTuoSeachCtrlVO xinTuoSeachCtrlVO)  {
		Map<String, Object> result = new HashMap<String, Object>();
		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();		
		if(StringUtils.isNotBlank(username)){
			User user = userService.selectByUsername(username);
			xinTuoSeachCtrlVO.setUserId(user.getId());
			xinTuoSeachCtrlVO.setPageSize(8);
	    	int totalcount = iProductXtService.countOrderXtcp(xinTuoSeachCtrlVO);
	    	xinTuoSeachCtrlVO.setTotalCount(totalcount); 
	    	
	    	//判断请求页
	        int totalPageNO = xinTuoSeachCtrlVO.getTotalPageSize();//总页数
	        int currentPageNo = 1;//当前页
	        if(xinTuoSeachCtrlVO.getPageNo()<1||totalPageNO==0){//如果请求的页数小于1，设置成第一页
	        	currentPageNo =1;
	        } else if(xinTuoSeachCtrlVO.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
	        	currentPageNo =totalPageNO;
	        }else{
	        	currentPageNo = xinTuoSeachCtrlVO.getPageNo();
	        }
	        
	    	xinTuoSeachCtrlVO.setPageNo(currentPageNo);			
			List<ProductXtcp> lstProduct = iProductXtService.selectOrderXtcp(xinTuoSeachCtrlVO);
			result.put("xinTuoSeachCtrlVO", xinTuoSeachCtrlVO);
	    	result.put("bizData", lstProduct);
	    	result.put("listMore",false);
		}else{
			result.put("listMore",true);
		}								
        return result;
    }
	
	@RequestMapping("/saveUserInfo")
    public String wxSaveUserInfo(UserCenterCtrlModel userCenterCtrlModel, Model model) {
    	model.addAttribute("isLog", "true");
    	//查询手机号
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
		
		if(userInfo.getIsValidate()!=1){
			userInfo.setName(userCenterCtrlModel.getUserInfo().getName());
			userInfo.setCertId(userCenterCtrlModel.getUserInfo().getCertId());
		}
		
		userInfo.setQqNo(userCenterCtrlModel.getUserInfo().getQqNo());
		userInfo.setEmail(userCenterCtrlModel.getUserInfo().getEmail());
		UserInfoService.updateUserInfo(userInfo);
    	
		model.addAttribute("phone", username);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("changeSucess", true);
		
        return "wx/center/personInfo";
    }
	
	@RequestMapping("/simuOrder")
    public String simuOrder(Model model) {		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		
		if(StringUtils.isNotBlank(username)){
			User user = userService.selectByUsername(username);
			
			PEProductCtrlModel peProductCtrlModel = new PEProductCtrlModel();
			peProductCtrlModel.setUserId(user.getId());
			peProductCtrlModel.setTelPhone(username);
			peProductCtrlModel.setPageSize(12);
	    	int totalcount = peProductService.countOrderSimucp(peProductCtrlModel);
	    	peProductCtrlModel.setTotalCount(totalcount); 
	    	
	    	//判断请求页
	        int totalPageNO = peProductCtrlModel.getTotalPageSize();//总页数
	        int currentPageNo = 1;//当前页
	        if(peProductCtrlModel.getPageNo()<1||totalPageNO==0){//如果请求的页数小于1，设置成第一页
	        	currentPageNo =1;
	        } else if(peProductCtrlModel.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
	        	currentPageNo =totalPageNO;
	        }else{
	        	currentPageNo = peProductCtrlModel.getPageNo();
	        }
	        
	        peProductCtrlModel.setPageNo(currentPageNo);			
			List<PEProduct> lstProduct = peProductService.selectOrderSimucp(peProductCtrlModel);
			model.addAttribute("lstProduct",lstProduct);
		}else{
			return "redirect:/rest/web/mlogin";
		}
								
        return "wx/center/simuOrder";
    }
	
	@RequestMapping("/about")
    public String about(Model model) {		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		
		if(StringUtils.isBlank(username)){			
			return "redirect:/rest/web/mlogin";
		}
				
        return "wx/center/about";
    }	
}
