package com.tjs.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tjs.admin.constants.UserConstants;
import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.StringUtils;
import com.tjs.core.util.StringExtUtils;
import com.tjs.web.constants.WebConstants;
import com.tjs.web.enums.RegFromEnum;
import com.tjs.web.service.PassportService;
import com.tjs.web.utils.StringEncryptUtil;

/**
 * 用户控制器
 * 
 * @author StarZou
 * @since 2014年5月28日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/web/passport")
public class PassportController {

    @Resource
    private UserService userService;
    
    @Resource
    private PassportService passportService;
    
    Gson gson = new Gson();
    
    /**
     * 用户登录
     * 
     * @param user
     * @param result
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@Valid User user, String verifyCode, String returnUrl, BindingResult result, Model model, HttpServletRequest request) {
    	//model.addAttribute("returnUrl", returnUrl);
    	try {
        	//String code = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);        //获取生成的验证码 
            Subject subject = SecurityUtils.getSubject();
            // 已登陆则 跳到首页
            if (subject.isAuthenticated()) {
            	if(null == request.getSession().getAttribute("userInfo")){
            		final User authUserInfo = userService.selectByUsername((String)subject.getPrincipal());
                    request.getSession().setAttribute("userInfo", authUserInfo);
            	}
            	
            	SavedRequest tt = WebUtils.getSavedRequest(request);
                return "redirect:/";//+returnUrl;
            }
            if (result.hasErrors()) {
                model.addAttribute("error", "参数错误！");
                return "web/passport/login";
            }
            // 身份验证
            subject.login(new UsernamePasswordToken(user.getUsername(), user.getPassword()));
            // 验证成功在Session中保存用户信息
            final User authUserInfo = userService.selectByUsername(user.getUsername());
            request.getSession().setAttribute("userInfo", authUserInfo);
        } catch (AuthenticationException e) {
            // 身份验证失败
            model.addAttribute("error", "用户名或密码错误 ！");
            return "web/passport/login";
        }
    	
    	SavedRequest saveRequest = WebUtils.getSavedRequest(request);
    	if(saveRequest!=null){
    		String url = saveRequest.getRequestUrl();
    	    url = (url==null?"":url); 
    	    url = url.substring(url.indexOf("rest"));
    		return "redirect:/"+url;
    	}else{
    		 return "redirect:/";//+returnUrl;
    	}
    	
       
    }

    /**
     * 用户登出
     * 
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("userInfo");
        // 登出操作
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/";
    }
    

    @RequestMapping("/agreement")
    public String agreement(User user, PassportCtrlModel ctrlModel, Model model) {
    	
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
    	
        return "web/passport/agreement";
    }

    @RequestMapping("/getPwd")
    public String getPwd(User user, PassportCtrlModel ctrlModel, Model model) {
    	
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
    	
        return "web/passport/getPwd";
    }

    @RequestMapping("/getPwdS2")
    public String getPwdS2(User user, PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	//验证手机号，验证图片验证码，清除session图片验证码
    	//发送短信验证码(若果session中已有同一个手机号&手机验证码，则不发送，防刷？)，同时把手机号和验证码保存到session
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
    	String code = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY); 
    	boolean dataValid = true;
    	String errorMsg = "";
    	if(StringExtUtils.isBlank(code) || !code.equalsIgnoreCase(ctrlModel.getVerifyCode())){
    		dataValid = false;
    		errorMsg = "验证码错误";
    	}else if(!StringExtUtils.checkMobileNumber(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号格式错误";
    	}else if(passportService.notExistUserName(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号未注册";
    	}
    	//清空图片验证码
    	request.getSession().setAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY, "");
    	
    	if(dataValid){
    		request.getSession().setAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY, ctrlModel.getUserName());
        	String smsCode = passportService.sendSmsCode(ctrlModel.getUserName());
        	request.getSession().setAttribute(WebConstants.SMS_VERIFY_SESSION_KEY, smsCode);
        	request.getSession().setAttribute(WebConstants.SMS_RESEND_COUNT_SESSION_KEY, 0);
        	request.getSession().setAttribute(WebConstants.SMS_VERIFY_COUNT_SESSION_KEY, 0);
        	
        	return "web/passport/getPwdS2";
    	}

		model.addAttribute("error", errorMsg);
		return "web/passport/getPwd";
    }

    @RequestMapping("/getPwdS3")
    public String getPwdS3(User user, PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	//验证手机号&短信验证码
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
    	boolean dataValid = true;
    	String errorMsg = "";
    	String userName = (String)request.getSession().getAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY);
    	String smsCode = (String) request.getSession().getAttribute(WebConstants.SMS_VERIFY_SESSION_KEY);
    	if(StringExtUtils.isBlank(smsCode) || !smsCode.equalsIgnoreCase(ctrlModel.getMobileVerifyCode())){
    		dataValid = false;
    		errorMsg = "手机验证码错误";
    	}else if(StringExtUtils.isBlank(userName) 
    			|| !userName.equalsIgnoreCase(ctrlModel.getUserName()) 
    			|| !StringExtUtils.checkMobileNumber(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号验证错误";
    	}else if(passportService.notExistUserName(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号未注册";
    	}
    	
    	if(dataValid){
        	return "web/passport/getPwdS3";
    	}
    	
    	model.addAttribute("error", errorMsg);
		return "web/passport/getPwdS2";
    	
    }

    @RequestMapping("/getPwdS4")
    public String getPwdS4(User user, PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	//验证手机号，验证短信验证码
    	//保存新密码到数据库，清除session中的手机号和短信验证码
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
    	boolean dataValid = true;
    	String errorMsg = "";
    	String userName = (String)request.getSession().getAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY);
    	String smsCode = (String) request.getSession().getAttribute(WebConstants.SMS_VERIFY_SESSION_KEY);
    	if(StringExtUtils.isBlank(smsCode) || !smsCode.equalsIgnoreCase(ctrlModel.getMobileVerifyCode())){
    		dataValid = false;
    		errorMsg = "手机验证码错误";
    	}else if(StringExtUtils.isBlank(userName) 
    			|| !userName.equalsIgnoreCase(ctrlModel.getUserName()) 
    			|| !StringExtUtils.checkMobileNumber(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号验证错误";
    	}else if(StringExtUtils.isBlank(ctrlModel.getPassword()) ){
    		dataValid = false;
    		errorMsg = "新密码验证错误";
    	}else if(passportService.notExistUserName(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号未注册";
    	}
    	
    	if(dataValid){
			boolean result = passportService.resetPassword(userName, ctrlModel.getPassword());
			if(result){
				// 清除session中的手机号&短信验证码
				request.getSession().setAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY, "");
				request.getSession().setAttribute(WebConstants.SMS_VERIFY_SESSION_KEY, "");
				return "web/passport/getPwdS4";
			}else{
				dataValid = false;
	    		errorMsg = "重置密码服务发生错误，请稍后再试！";
			}
    	}

		model.addAttribute("error", errorMsg);
		return "web/passport/getPwdS3";
    	
    }

    @RequestMapping("/reg")
    public String reg(User user, PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
        return "web/passport/reg";
    }


    @RequestMapping("/existUserName")
    @ResponseBody
    public boolean existUserName(String userName, Model model, HttpServletRequest request) {
    	
    	boolean isValid = false;
    	if(StringExtUtils.checkMobileNumber(userName)){
    		isValid = !passportService.notExistUserName(userName); 
    	}
    	   	
        return isValid;
    }


    @RequestMapping("/notExistUserName")
    @ResponseBody
    public boolean notExistUserName(String userName, Model model, HttpServletRequest request) {
    	
    	boolean isValid = false;
    	if(StringExtUtils.checkMobileNumber(userName)){
    		isValid = passportService.notExistUserName(userName); 
    	}
    	   	
        return isValid;
    }
    
    @RequestMapping("/validVerifyCode")
    @ResponseBody
    public boolean validVerifyCode(String verifyCode, Model model, HttpServletRequest request) {
    	
    	boolean isValid = false;    	
    	String code = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);        //获取生成的验证码 
        if(code.equalsIgnoreCase(verifyCode)){
        	isValid = true;  
        }
        return isValid;
    }

    @RequestMapping("/sendMobileVerifyCode")
    @ResponseBody
    public boolean sendMobileVerifyCode(String mobileNo, Model model, HttpServletRequest request) {
    	boolean isValid = false;
    	if(StringExtUtils.checkMobileNumber(mobileNo)){
    		request.getSession().setAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY, mobileNo);
        	String smsCode = passportService.sendSmsCode(mobileNo);
        	request.getSession().setAttribute(WebConstants.SMS_VERIFY_SESSION_KEY, smsCode);
        	request.getSession().setAttribute(WebConstants.SMS_RESEND_COUNT_SESSION_KEY, 0);
        	request.getSession().setAttribute(WebConstants.SMS_VERIFY_COUNT_SESSION_KEY, 0);
        	isValid = true;
    	}
    	
    	return isValid;
    }

    @RequestMapping("/reSendMobileVerifyCode")
    @ResponseBody
    public boolean reSendMobileVerifyCode(String mobileNo, Model model, HttpServletRequest request) {
    	boolean isValid = false;
    	String userName = (String)request.getSession().getAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY);
    	if(StringExtUtils.isNotBlank(userName) 
    			&& userName.equalsIgnoreCase(mobileNo) 
    			&& StringExtUtils.checkMobileNumber(mobileNo)){
    		//TODO 添加计数器，防刷
    		Integer resendCount = (Integer)request.getSession().getAttribute(WebConstants.SMS_RESEND_COUNT_SESSION_KEY);
    		if(resendCount<=WebConstants.SMS_RESEND_COUNT_MAX){
    			String smsCode = passportService.sendSmsCode(userName);
    			resendCount ++;
            	request.getSession().setAttribute(WebConstants.SMS_VERIFY_SESSION_KEY, smsCode);
            	request.getSession().setAttribute(WebConstants.SMS_RESEND_COUNT_SESSION_KEY, resendCount);
            	isValid = true;
    		}
    	}
    	
    	return isValid;
    }

    @RequestMapping("/validMobileVerifyCode")
    @ResponseBody
    public boolean validMobileVerifyCode(String mobileVerifyCode, Model model, HttpServletRequest request) {
    	boolean isValid = false;  
    	Integer verifyCount = (Integer)request.getSession().getAttribute(WebConstants.SMS_VERIFY_COUNT_SESSION_KEY);
    	//如果不存在，表明还没有发送验证码，直接返回错误信息
    	if(verifyCount==null){
    		return isValid;
    	}
		if(verifyCount<=WebConstants.SMS_VERIFY_COUNT_MAX){
			String code = (String) request.getSession().getAttribute(WebConstants.SMS_VERIFY_SESSION_KEY);
	        if(StringExtUtils.isNotBlank(code) && code.equalsIgnoreCase(mobileVerifyCode)){
	        	isValid = true;  
	        }
	        verifyCount ++;
        	request.getSession().setAttribute(WebConstants.SMS_VERIFY_COUNT_SESSION_KEY, verifyCount);
		}
		
        return isValid;
    }

    @RequestMapping("/regS2")
    public String regS2(PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	//验证手机号，验证图片验证码，清除session图片验证码
    	//发送短信验证码(若果session中已有同一个手机号&手机验证码，则不发送，防刷？)，同时把手机号和验证码保存到session
    	model.addAttribute("ctrlData", ctrlModel);
    	String code = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY); 
    	boolean dataValid = true;
    	String errorMsg = "";
    	if(StringExtUtils.isBlank(code) || !code.equalsIgnoreCase(ctrlModel.getVerifyCode())){
    		dataValid = false;
    		errorMsg = "验证码错误";
    	}else if(!StringExtUtils.checkMobileNumber(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号格式错误";
    	}else if(!passportService.notExistUserName(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号已注册";
    	}
    	//清空图片验证码
    	request.getSession().setAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY, "");
    	
    	if(dataValid){
    		request.getSession().setAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY, ctrlModel.getUserName());
        	String smsCode = passportService.sendSmsCode(ctrlModel.getUserName());
        	request.getSession().setAttribute(WebConstants.SMS_VERIFY_SESSION_KEY, smsCode);
        	request.getSession().setAttribute(WebConstants.SMS_RESEND_COUNT_SESSION_KEY, 0);
        	request.getSession().setAttribute(WebConstants.SMS_VERIFY_COUNT_SESSION_KEY, 0);
        	
        	return "web/passport/regS2";
    	}

		model.addAttribute("error", errorMsg);
		return "web/passport/reg";
    	
        
    }

    @RequestMapping("/regS3")
    public String regS3(PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	//验证手机号，验证短信验证码（session是否匹配，数据库中是否存在）
    	//新增帐号到数据库，清除session中的手机号和短信验证码
    	model.addAttribute("ctrlData", ctrlModel);
    	boolean dataValid = true;
    	String errorMsg = "";
    	String userName = (String)request.getSession().getAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY);
    	String smsCode = (String) request.getSession().getAttribute(WebConstants.SMS_VERIFY_SESSION_KEY);
    	if(StringExtUtils.isBlank(smsCode) || !smsCode.equalsIgnoreCase(ctrlModel.getMobileVerifyCode())){
    		dataValid = false;
    		errorMsg = "手机验证码错误";
    	}else if(StringExtUtils.isBlank(userName) 
    			|| !userName.equalsIgnoreCase(ctrlModel.getUserName()) 
    			|| !StringExtUtils.checkMobileNumber(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号验证错误";
    	}else if(StringExtUtils.isBlank(ctrlModel.getPassword())){
    		dataValid = false;
    		errorMsg = "密码验证错误";
    	}else if(!passportService.notExistUserName(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号已注册";
    	}
    	
    	if(dataValid){
    		User user = new User();
        	user.setUsername(ctrlModel.getUserName());
        	user.setPassword(ctrlModel.getPassword());
        	user.setCreateTime(new Date());
        	user.setRegFrom(ctrlModel.getRegFrom());
        	user.setParent(ctrlModel.getParent());
        	UserInfo userInfo = new UserInfo();
        	userInfo.setMobileNo(ctrlModel.getUserName());
        	userInfo.setNickName(ctrlModel.getUserName());
        	userInfo.setRegTime(new Date());
        	userInfo.setUserStatus(UserConstants.USER_STATUS_REG);
        	Long userId = passportService.regUser(user, userInfo);
			if (userId > 0) {
				// 注册成功，登录后回到首页
				// 清除session中的短信验证码
				request.getSession().setAttribute(WebConstants.SMS_VERIFY_SESSION_KEY, "");
				try {
					Subject subject = SecurityUtils.getSubject();
					subject.login(new UsernamePasswordToken(ctrlModel.getUserName(), ctrlModel.getPassword()));
					// 验证成功在Session中保存用户信息
					final User authUserInfo = userService.selectByUsername(user.getUsername());
					request.getSession().setAttribute("userInfo", authUserInfo);
				} catch (AuthenticationException e) {
					// 身份验证失败，需重新登录
					//dataValid = false;
		    		//errorMsg = "注册成功，立即登录！";
				}
	    		return "web/passport/regSuccess";
			}

			dataValid = false;
    		errorMsg = "注册服务发生错误，请稍后再试！";
    	}

		model.addAttribute("error", errorMsg);
		return "web/passport/regS2";
    	
    }


    @RequestMapping("/mreg")
    public String mreg(User user, PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
        return "web/passport/mreg";
    }
    
    /**
     * 高铁合作页面
     * @param user
     * @param ctrlModel
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/mregact")
    public String mregact(User user, PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
        return "web/passport/mregact";
    }
    
    /**
     * 高铁合作提交
     * @param ctrlModel
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/mregSact")
    @ResponseBody
    public String mregSact(PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	//验证手机号，验证短信验证码（session是否匹配，数据库中是否存在）
    	//新增帐号到数据库，清除session中的手机号和短信验证码
    	//model.addAttribute("ctrlData", ctrlModel);
    	//boolean dataValid = true;
    	Map<String, String> result = new HashMap<String, String>();		
    	String errorMsg = "0";
    	String userName = (String)request.getSession().getAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY);
    	String smsCode = (String) request.getSession().getAttribute(WebConstants.SMS_VERIFY_SESSION_KEY);
    	if(StringExtUtils.isBlank(smsCode) || !smsCode.equalsIgnoreCase(ctrlModel.getMobileVerifyCode())){
    		//dataValid = false;
    		//errorMsg = "手机验证码错误";
    		errorMsg = "1";
    	}else if(StringExtUtils.isBlank(userName) 
    			|| !userName.equalsIgnoreCase(ctrlModel.getUserName()) 
    			|| !StringExtUtils.checkMobileNumber(ctrlModel.getUserName())){
    		//dataValid = false;
    		//errorMsg = "手机号验证错误";
    		errorMsg = "2";
    	}else if(!passportService.notExistUserName(ctrlModel.getUserName())){
    		//dataValid = false;
    		//errorMsg = "手机号已注册";
    		errorMsg = "3";
    	}
    	
    	String passwdSource = StringEncryptUtil.genRandomNum(8);
    	
    	if("0".equals(errorMsg)){
    		String password = StringEncryptUtil.encrypt(passwdSource, "");
    		User user = new User();
        	user.setUsername(ctrlModel.getUserName());
        	user.setPassword(password);
        	user.setCreateTime(new Date());
        	//从高铁注册
        	if(StringUtils.isEmpty(ctrlModel.getRegFrom())){
	        	user.setRegFrom(RegFromEnum.HSR.getKey());
        	}else{
        		user.setRegFrom(RegFromEnum.HSR2.getKey());
        	}
        	
        	user.setParent(ctrlModel.getParent());
        	
        	UserInfo userInfo = new UserInfo();
        	userInfo.setMobileNo(ctrlModel.getUserName());
        	userInfo.setNickName(ctrlModel.getUserName());
        	userInfo.setRegTime(new Date());
        	userInfo.setUserStatus(UserConstants.USER_STATUS_REG);
        	Long userId = passportService.regUser(user, userInfo);
			if (userId > 0) {
				// 注册成功，登录后回到首页
				// 清除session中的短信验证码
				request.getSession().setAttribute(WebConstants.SMS_VERIFY_SESSION_KEY, "");
				//发送电影码
				passportService.sendMovieCode(ctrlModel.getUserName(), passwdSource, ctrlModel.getMovieCode());
			}else{
				//dataValid = false;
	    		//errorMsg = "注册服务发生错误，请稍后再试！";
	    		errorMsg = "4";
			}
			
    	}

    	result.put("movieCode", ctrlModel.getMovieCode());
    	result.put("password", passwdSource);
    	result.put("userName", ctrlModel.getUserName());
    	result.put("msg", errorMsg);
    	
    	return gson.toJson(result);
    }

    @RequestMapping("/mregS2")
    public String mregS2(PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	//验证手机号，验证短信验证码（session是否匹配，数据库中是否存在）
    	//新增帐号到数据库，清除session中的手机号和短信验证码
    	model.addAttribute("ctrlData", ctrlModel);
    	boolean dataValid = true;
    	String errorMsg = "";
    	String userName = (String)request.getSession().getAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY);
    	String smsCode = (String) request.getSession().getAttribute(WebConstants.SMS_VERIFY_SESSION_KEY);
    	if(StringExtUtils.isBlank(smsCode) || !smsCode.equalsIgnoreCase(ctrlModel.getMobileVerifyCode())){
    		dataValid = false;
    		errorMsg = "手机验证码错误";
    	}else if(StringExtUtils.isBlank(userName) 
    			|| !userName.equalsIgnoreCase(ctrlModel.getUserName()) 
    			|| !StringExtUtils.checkMobileNumber(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号验证错误";
    	}else if(StringExtUtils.isBlank(ctrlModel.getPassword())){
    		dataValid = false;
    		errorMsg = "密码验证错误";
    	}else if(!passportService.notExistUserName(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号已注册";
    	}
    	
    	if(dataValid){
    		User user = new User();
        	user.setUsername(ctrlModel.getUserName());
        	user.setPassword(ctrlModel.getPassword());
        	user.setCreateTime(new Date());
        	user.setRegFrom(ctrlModel.getRegFrom());
        	user.setParent(ctrlModel.getParent());
        	UserInfo userInfo = new UserInfo();
        	userInfo.setMobileNo(ctrlModel.getUserName());
        	userInfo.setNickName(ctrlModel.getUserName());
        	userInfo.setRegTime(new Date());
        	userInfo.setUserStatus(UserConstants.USER_STATUS_REG);
        	Long userId = passportService.regUser(user, userInfo);
			if (userId > 0) {
				// 注册成功，登录后回到首页
				// 清除session中的短信验证码
				request.getSession().setAttribute(WebConstants.SMS_VERIFY_SESSION_KEY, "");
				try {
					Subject subject = SecurityUtils.getSubject();
					subject.login(new UsernamePasswordToken(ctrlModel.getUserName(), ctrlModel.getPassword()));
					// 验证成功在Session中保存用户信息
					final User authUserInfo = userService.selectByUsername(user.getUsername());
					request.getSession().setAttribute("userInfo", authUserInfo);
				} catch (AuthenticationException e) {
					// 身份验证失败，需重新登录
					//dataValid = false;
		    		//errorMsg = "注册成功，立即登录！";
				}
	    		return "web/passport/mregSuccess";
			}

			dataValid = false;
    		errorMsg = "注册服务发生错误，请稍后再试！";
    	}

		model.addAttribute("error", errorMsg);
		return "web/passport/mreg";
    }
    
    
    
    /**
     * 微信用户登录
     * 
     * @param user
     * @param result
     * @return
     */
    @RequestMapping(value = "/mlogin", method = RequestMethod.POST)
    public String mlogin(@Valid User user, String verifyCode, String returnUrl, BindingResult result, Model model, HttpServletRequest request) {
    	//model.addAttribute("returnUrl", returnUrl);
    	try {
        	//String code = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);        //获取生成的验证码 
            Subject subject = SecurityUtils.getSubject();
            // 已登陆则 跳到首页
            if (subject.isAuthenticated()) {
            	if(null == request.getSession().getAttribute("userInfo")){
            		final User authUserInfo = userService.selectByUsername((String)subject.getPrincipal());
                    request.getSession().setAttribute("userInfo", authUserInfo);
            	}
            	
            	SavedRequest tt = WebUtils.getSavedRequest(request);
                return "redirect:/rest/wx/xintuo/index";//+returnUrl;
            }
            if (result.hasErrors()) {
                model.addAttribute("error", "参数错误！");
                return "web/passport/mlogin";
            }
            // 身份验证
            subject.login(new UsernamePasswordToken(user.getUsername(), user.getPassword()));
            // 验证成功在Session中保存用户信息
            final User authUserInfo = userService.selectByUsername(user.getUsername());
            request.getSession().setAttribute("userInfo", authUserInfo);
        } catch (AuthenticationException e) {
            // 身份验证失败
            model.addAttribute("error", "用户名或密码错误 ！");
            return "web/passport/mlogin";
        }
    	
    	SavedRequest saveRequest = WebUtils.getSavedRequest(request);
    	if(saveRequest!=null){
    		String url = saveRequest.getRequestUrl();
    	    url = (url==null?"":url); 
    	    url = url.substring(url.indexOf("rest"));
    		return "redirect:/"+url;
    	}else{
    		 return "redirect:/rest/wx/xintuo/index";//+returnUrl;
    	}
    	
       
    }
    
    /**
     * 微信找回密码
     * @param user
     * @param ctrlModel
     * @param model
     * @return
     */
    @RequestMapping("/getMPwd")
    public String getMPwd(User user, PassportCtrlModel ctrlModel, Model model) {  	
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);  	
        return "web/passport/getMPwd";
    }
    
    
    /**
     * 微信找回密码
     * @param user
     * @param ctrlModel
     * @param model
     * @return
     */
    @RequestMapping("/getMPwd2")
    public String getMPwd2(User user, PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {  	
    	//验证手机号，验证短信验证码
    	//保存新密码到数据库，清除session中的手机号和短信验证码
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
    	boolean dataValid = true;
    	String errorMsg = "";
    	String userName = (String)request.getSession().getAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY);
    	String smsCode = (String) request.getSession().getAttribute(WebConstants.SMS_VERIFY_SESSION_KEY);
    	if(StringExtUtils.isBlank(smsCode) || !smsCode.equalsIgnoreCase(ctrlModel.getMobileVerifyCode())){
    		dataValid = false;
    		errorMsg = "手机验证码错误";
    	}else if(StringExtUtils.isBlank(userName) 
    			|| !userName.equalsIgnoreCase(ctrlModel.getUserName()) 
    			|| !StringExtUtils.checkMobileNumber(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号验证错误";
    	}else if(StringExtUtils.isBlank(ctrlModel.getPassword()) ){
    		dataValid = false;
    		errorMsg = "新密码验证错误";
    	}else if(passportService.notExistUserName(ctrlModel.getUserName())){
    		dataValid = false;
    		errorMsg = "手机号未注册";
    	}
    	
    	if(dataValid){
			boolean result = passportService.resetPassword(userName, ctrlModel.getPassword());
			if(result){
				// 清除session中的手机号&短信验证码
				request.getSession().setAttribute(WebConstants.USERNAME_VERIFY_SESSION_KEY, "");
				request.getSession().setAttribute(WebConstants.SMS_VERIFY_SESSION_KEY, "");
				return "web/passport/getMPwd2";
			}else{
				dataValid = false;
	    		errorMsg = "重置密码服务发生错误，请稍后再试！";
			}
    	}

		model.addAttribute("error", errorMsg);
		return "web/passport/getMPwd";
    }


    /**
     * 用户登出
     * 
     * @param session
     * @return
     */
    @RequestMapping(value = "/mlogout", method = RequestMethod.GET)
    public String mlogout(HttpSession session) {
        session.removeAttribute("userInfo");
        // 登出操作
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/rest/wx/xintuo/index";
    }
}
