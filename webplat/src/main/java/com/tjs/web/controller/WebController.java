package com.tjs.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.model.User;
import com.tjs.admin.service.UserService;

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
	public String index(HttpServletRequest request) {
		return "web/index";
	}

	/**
	 * 首页-已登陆
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/home")
	public String home(HttpServletRequest request) {
		return "web/home";
	}

	/**
	 * 登录页
	 */
	@RequestMapping("/login")
	public String login() {
		return "web/passport/login";
	}
}