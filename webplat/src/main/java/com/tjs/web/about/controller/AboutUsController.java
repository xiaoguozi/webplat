package com.tjs.web.about.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 关于我们控制器
 * 
 *@author zhsoft
 *@since 2015年5月26日
 *
 **/

@Controller
@RequestMapping(value = "/web/aboutUs")
public class AboutUsController {
	
	/**
	 * 关于我们首页
	 * @return
	 */
	@RequestMapping("/index")
    public String index() {
        return "web/about/index";
    }
	
	/**
	 * 管理团队
	 * @return
	 */
	@RequestMapping("/team")
    public String team() {
        return "web/about/team";
    }
	
	/**
	 * 人才招聘
	 * @return
	 */
	@RequestMapping("/jobs")
    public String jobs() {
        return "web/about/jobs";
    }
	
	
	/**
	 * 联系我们
	 * @return
	 */
	@RequestMapping("/contact")
    public String contact() {
        return "web/about/contact";
    }
	
	/**
	 * 商户合作
	 * @return
	 */
	@RequestMapping("/partner")
    public String partner() {
        return "web/about/partner";
    }
	
}
