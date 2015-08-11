package com.tjs.admin.kybx.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.order.model.Order;
import com.tjs.admin.order.service.IOrderService;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
/**
 * 订单预定控制
 * 
 * @author 何志刚
 * @since 2015年3月21日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/admin/kybx")
public class KybxControler {
	
	 @Resource
	 private IOrderService iOrderService;
	 
	 @Resource
	 private UserService userService;
	 
	 @Resource
	 private UserInfoService UserInfoService;

       
    @RequestMapping("/kybxIndex")
    public String kybxIndex() {
        return "admin/kybx/kybxIndex";
    }
    
  
       
}
