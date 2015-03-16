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
@RequestMapping("/admin/page")
public class PageController {

    /**
     * 404页
     */
    @RequestMapping("/404")
    public String error404() {
        return "admin/page/404";
    }

    /**
     * 401页
     */
    @RequestMapping("/401")
    public String error401() {
        return "admin/page/401";
    }

    /**
     * 500页
     */
    @RequestMapping("/500")
    public String error500() {
        return "admin/page/500";
    }

}