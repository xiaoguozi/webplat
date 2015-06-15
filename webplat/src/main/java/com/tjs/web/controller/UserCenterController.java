package com.tjs.web.controller;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.ddq.webservice.identify.IdentifierWebService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.nciic.www.IdentifierServiceClient.CheckResponse;

import com.google.gson.Gson;
import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.StringUtils;

/**
 * 用户控制器
 * 
 * @author StarZou
 * @since 2014年5月28日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/web/userCenter")
public class UserCenterController {

    @Resource
    private UserService userService;
    
    @Resource
    private UserInfoService userInfoService;
    
    Gson gson = new Gson();
    
    @RequestMapping("/index")
    public String index(Model model) {
    	model.addAttribute("isLog", "true");
    	//查询手机号
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		
		model.addAttribute("phone", username);
		model.addAttribute("name", userInfo.getName());
		model.addAttribute("certId", userInfo.getCertId());
		model.addAttribute("qq", userInfo.getQqNo());
		model.addAttribute("email", userInfo.getEmail());
		
        return "web/userCenter/userInfoModify";
    }
    
    @RequestMapping("/userModify")
    public String userModify(Model model) {
    	model.addAttribute("isLog", "true");
    	//查询手机号
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		
		model.addAttribute("phone", username);
		model.addAttribute("name", userInfo.getName());
		model.addAttribute("certId", userInfo.getCertId());
		model.addAttribute("qq", userInfo.getQqNo());
		model.addAttribute("email", userInfo.getEmail());
		
        return "web/userCenter/userInfoModify";
    }
    
    @RequestMapping("/saveUserInfo")
    public String saveUserInfo(UserCenterCtrlModel userCenterCtrlModel, Model model) {
    	model.addAttribute("isLog", "true");
    	//查询手机号
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		
		userInfo.setName(userCenterCtrlModel.getUserInfo().getName());
		userInfo.setCertId(userCenterCtrlModel.getUserInfo().getCertId());
		userInfo.setQqNo(userCenterCtrlModel.getUserInfo().getQqNo());
		userInfo.setEmail(userCenterCtrlModel.getUserInfo().getEmail());
		userInfoService.updateUserInfo(userInfo);
    	
		model.addAttribute("phone", username);
		model.addAttribute("name", userInfo.getName());
		model.addAttribute("certId", userInfo.getCertId());
		model.addAttribute("qq", userInfo.getQqNo());
		model.addAttribute("email", userInfo.getEmail());
		model.addAttribute("changeSucess", true);
		
        return "web/userCenter/userInfoModify";
    }
    
    
    @RequestMapping("/userModifyData")
    @ResponseBody
    public boolean userModifyData(@RequestParam(value="password") String  password,@RequestParam(value="newpassword") String  newpassword) {    	
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user= userService.selectByUsername(username);
		if(password.equalsIgnoreCase(user.getPassword())){
			user.setPassword(newpassword);
			userService.update(user);
			return true;
		}else{
			return false;
		}		
    }
    
    @RequestMapping("/valiadPassword")
    @ResponseBody
    public boolean valiadPassword(@RequestParam(value="password") String  password) {
    	boolean isValid = false;   
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user= userService.selectByUsername(username);
		if(password.equalsIgnoreCase(user.getPassword())){
			isValid = true;
		}
        return isValid;
    }
  
    @RequestMapping("/valiadCertId")
    @ResponseBody
    public String valiadCertId(@RequestParam(value="name") String  name, @RequestParam(value="certId") String  certId) {
		String result = "false";

		if (StringUtils.isBlank(name) || StringUtils.isBlank(certId)) {
			return result;
		}

		/**
		CheckResponse response = new CheckResponse();
		// 测试--跳过验证码
		try {
			String value = IdentifierWebService.simpleCheckByJson(certId, name,
					"tjs_admin", "b8DvR2jl");
			response = gson.fromJson(value, CheckResponse.class);
			if (response.getResponseCode() == 100) {
				if ("一致".equals(response.getIdentifier().getResult())) {
					result = "true";
				} else {
					result = "身份证号码与姓名不一致";
				}
			}
			throw new Exception(response.getResponseCode() + "");
		} catch (Exception e) {
			if ("-71".equals(e.getMessage())) {
				result = "认证服务参数不正确,请联系客服！";
			} else if ("-53".equals(e.getMessage())) {
				result = "认证服务账号过期,请联系客服！";
			} else if ("-72".equals(e.getMessage())) {
				result = "认证服务权限不足,请联系客服！";
			} else if ("-31".equals(e.getMessage())) {
				result = "认证服务需要充值,请联系客服！";
			} else if ("-60".equals(e.getMessage())) {
				result = "认证服务参数格式错误,请联系客服！";
			} else if ("-90".equals(e.getMessage())) {
				result = "认证服务器出问题,请联系客服！";
			} else {

			}
		}

		*/
		return "true";
	}
    

}
 