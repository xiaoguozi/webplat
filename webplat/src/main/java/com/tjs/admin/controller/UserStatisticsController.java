package com.tjs.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.model.User;
import com.tjs.admin.service.UserService;

/**
 * 用户统计控制器
 * 
 * @author StarZou
 * @since 2014年5月28日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/admin/user/statistics")
public class UserStatisticsController {

    @Resource
    private UserService userService;

    
    @RequestMapping("/index")
    public String index() {
    	return "admin/user/statistics/index";
    }
    
    @RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(UserCtrlModel userCtrlModel, Model model) {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	
    	Integer total = userService.selectAdminRmdListCount(userCtrlModel);
    	
    	result.put("total", total);
    	
        return result;
    }

    
    @RequestMapping("/listData")
    public String listData(UserCtrlModel userCtrlModel, Model model) {
    	List<User> showData = new ArrayList<User>();
    	showData = userService.selectAdminRmdUserList(userCtrlModel);
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", userCtrlModel);
    	
        return "admin/user/statistics/listData";
    }
    
}
