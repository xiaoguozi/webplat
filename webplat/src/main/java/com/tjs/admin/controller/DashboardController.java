package com.tjs.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 视图控制器,返回jsp视图给前端
 * 
 * @author StarZou
 * @since 2014年5月28日 下午4:00:49
 **/
@Controller
@RequestMapping("/admin/dashboard")
public class DashboardController {

    /**
     * dashboard页
     */
    @RequestMapping("/index")
    public String index() {
        return "admin/dashboard/index";
    }

}