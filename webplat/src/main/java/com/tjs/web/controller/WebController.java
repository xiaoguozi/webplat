package com.tjs.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.model.User;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.service.PEProductService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.system.controller.BannerCtrlModel;
import com.tjs.admin.system.model.SysHome;
import com.tjs.admin.system.service.ISysHome;
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.service.IProductXtcpService;

/**
 * 公共视图控制器
 * 
 * @author starzou
 * @since 2014年4月15日 下午4:16:34
 **/
@Controller
@RequestMapping("/web")
public class WebController {

    @Resource
    private UserService userService;
    @Resource
    private IProductXtcpService productXtcpService;
    @Resource
    private PEProductService pEProductService;
       
    @Resource
    private ISysHome sysHomeService;
    
	/**
	 * 首页－默认
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/welcome")
	public String welcome(HttpServletRequest request, HttpSession session, Model model) {
		boolean isLogin = false;

		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		// 已登陆则 跳到首页
		if (subject.isAuthenticated()) {
			isLogin = true;
			//User userInfo = (User)session.getAttribute("userInfo");
			model.addAttribute("username",username);
			if(null == request.getSession().getAttribute("userInfo")){
        		final User authUserInfo = userService.selectByUsername(username);
                request.getSession().setAttribute("userInfo", authUserInfo);
        	}
		}

		//
		BannerCtrlModel params =new BannerCtrlModel();
		params.getSysHome().setEnable(1);
		params.setPageSize(3);
		params.getSysHome().setLocationBanner("10");
		
	    List<SysHome> lstSysHome = sysHomeService.selectBanner(params);
	    model.addAttribute("lstSysHome", lstSysHome);

		List<ProductXtcp> xtcp =  productXtcpService.selectProductXtcpIndex();				
		model.addAttribute("xtcpData", xtcp);
		List<PEProduct> smcp =  pEProductService.selectStarPEProductIndex();				
		model.addAttribute("smcpData", smcp);
		
		if (isLogin) {
			return "web/home";
		} else {
			return "web/index";
		}

	}

	/**
	 * 首页－未登录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		
		BannerCtrlModel params =new BannerCtrlModel();
		params.getSysHome().setEnable(1);
		params.setPageSize(3);
		params.getSysHome().setLocationBanner("10");
		
	    List<SysHome> lstSysHome = sysHomeService.selectBanner(params);
	    model.addAttribute("lstSysHome", lstSysHome);
		
		List<ProductXtcp> xtcp =  productXtcpService.selectProductXtcpIndex();
				
		model.addAttribute("xtcpData", xtcp);

		List<PEProduct> smcp =  pEProductService.selectStarPEProductIndex();
					
		model.addAttribute("smcpData", smcp);
		
		
		return "web/index";
	}

	/**
	 * 首页-已登陆
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/home")
	public String home(HttpServletRequest request, Model model) {
		
		BannerCtrlModel params =new BannerCtrlModel();
		params.getSysHome().setEnable(1);
		params.setPageSize(3);
		params.getSysHome().setLocationBanner("10");
		
	    List<SysHome> lstSysHome = sysHomeService.selectBanner(params);
	    model.addAttribute("lstSysHome", lstSysHome);

		List<ProductXtcp> xtcp =  productXtcpService.selectProductXtcpIndex();
					
		model.addAttribute("xtcpData", xtcp);

		List<PEProduct> smcp =  pEProductService.selectStarPEProductIndex();
					
		model.addAttribute("smcpData", smcp);
		
		
		return "web/home";
	}

	/**
	 * 登录页
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		String returnUrl = request.getHeader("referer");  
        if(returnUrl==null || returnUrl.trim().equals("")){  
            returnUrl = "/";  
        }
        
        model.addAttribute("returnUrl", returnUrl);
        
		return "web/passport/login";
	}
	/**
	 * 登录页
	 */
	@RequestMapping("/mlogin")
	public String mlogin(HttpServletRequest request, Model model) {
//		String returnUrl = request.getHeader("referer");  
//        if(returnUrl==null || returnUrl.trim().equals("")){  
//            returnUrl = "/";  
//        }
//        
//        model.addAttribute("returnUrl", returnUrl);
        
		return "web/passport/mlogin";
	}
}