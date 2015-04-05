package com.tjs.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 公共视图控制器
 * 
 * @author starzou
 * @since 2014年4月15日 下午4:16:34
 **/
@Controller
@RequestMapping("/admin")
public class AdminController {
    /**
     * 首页
     * 
     * @param request
     * @return
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        return "admin/index";
    }
    
    /**
     * 登录页
     */
    @RequestMapping("/login")
    public String login() {
        return "admin/user/login";
    }
}