package com.tjs.wx.center.controller;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.StringUtils;

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
			model.addAttribute("userInfo",userInfo);
			model.addAttribute("user",user);
		}else{
			return "redirect:/rest/web/mlogin";
		}
				
        return "wx/center/personInfo";
    }	
}
