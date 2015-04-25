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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.constants.UserConstants;
import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserService;
import com.tjs.web.constants.WebConstants;
import com.tjs.web.service.PassportService;

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

    /**
     * 用户登录
     * 
     * @param user
     * @param result
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@Valid User user, String verifyCode, BindingResult result, Model model, HttpServletRequest request) {
        try {
        	String code = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);        //获取生成的验证码 
            Subject subject = SecurityUtils.getSubject();
            // 已登陆则 跳到首页
            if (subject.isAuthenticated()) {
                return "redirect:/";
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
        return "redirect:/";
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
        return "web/passport/login";
    }
    

    @RequestMapping("/getPwd")
    public String getPwd(User user, PassportCtrlModel ctrlModel, Model model) {
    	user.setUsername("myname");
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
        return "web/passport/getPwd";
    }

    @RequestMapping("/getPwdS2")
    public String getPwdS2(User user, PassportCtrlModel ctrlModel, Model model) {
    	user.setUsername("myname");
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
        return "web/passport/getPwdS2";
    }

    @RequestMapping("/getPwdS3")
    public String getPwdS3(User user, PassportCtrlModel ctrlModel, Model model) {
    	user.setUsername("myname");
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
        return "web/passport/getPwdS3";
    }

    @RequestMapping("/getPwdS4")
    public String getPwdSuccess(User user, PassportCtrlModel ctrlModel, Model model) {
    	user.setUsername("myname");
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
        return "web/passport/getPwdS4";
    }

    @RequestMapping("/reg")
    public String reg(User user, PassportCtrlModel ctrlModel, Model model) {
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", ctrlModel);
        return "web/passport/reg";
    }


    @RequestMapping("/validUserName")
    @ResponseBody
    public boolean validUsername(String userName, Model model, HttpServletRequest request) {
    	        
    	boolean isValid = passportService.validUserName(userName);    	
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
    
    @RequestMapping("/validMobileVerifyCode")
    @ResponseBody
    public boolean validMobileVerifyCode(String mobileVerifyCode, Model model, HttpServletRequest request) {
    	
    	/*boolean isValid = false;    	
    	String code = (String) request.getSession().getAttribute("mobileVerifyCode");
        if(StringExtUtils.isNotBlank(code) && code.equalsIgnoreCase(mobileVerifyCode)){
        	isValid = true;  
        }*/
        return true;
    }

    @RequestMapping("/regS2")
    public String regS2(PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	String code = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);        //获取生成的验证码 
        if(code.equalsIgnoreCase(ctrlModel.getVerifyCode())){
        	return "web/passport/regS2";
        	
        }else{
        	model.addAttribute("error", "验证码错误");
        }
    	
    	
        return "web/passport/reg";

        
    }

    @RequestMapping("/regS3")
    public String regS3(PassportCtrlModel ctrlModel, Model model, HttpServletRequest request) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	String code = (String) request.getSession().getAttribute(WebConstants.SMS_VERIFY_SESSION_KEY);        //获取生成的验证码 
        if(code.equalsIgnoreCase(ctrlModel.getMobileVerifyCode())){
        	User user = new User();
        	user.setUsername(ctrlModel.getUserName());
        	user.setPassword(ctrlModel.getPassword());
        	user.setCreateTime(new Date());
        	UserInfo userInfo = new UserInfo();
        	userInfo.setMobileNo(ctrlModel.getUserName());
        	userInfo.setNickName(ctrlModel.getUserName());
        	userInfo.setRegTime(new Date());
        	userInfo.setUserStatus(UserConstants.USER_STATUS_REG);
        	Long userId = passportService.regUser(user, userInfo);
        	if(userId>0){
        		//注册成功，登录后回到首页
        		 try {
        		Subject subject = SecurityUtils.getSubject();
        		subject.login(new UsernamePasswordToken(ctrlModel.getUserName(), ctrlModel.getPassword()));
                // 验证成功在Session中保存用户信息
                final User authUserInfo = userService.selectByUsername(user.getUsername());
                request.getSession().setAttribute("userInfo", authUserInfo);
                return "web/passport/regSuccess";
        		 } catch (AuthenticationException e) {
        	            // 身份验证失败
        	            model.addAttribute("error", "注册服务发生错误，请稍后再试！");
        	            return "web/passport/regS2";
        	        }
        	}
        	model.addAttribute("error", "注册服务发生错误，请稍后再试！");
        	
        }else{
        	model.addAttribute("error", "验证码错误");
        }
    	
    	
        return "web/passport/regS2";

        
    }
  

}
