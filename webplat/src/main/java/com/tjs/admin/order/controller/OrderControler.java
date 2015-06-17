package com.tjs.admin.order.controller;

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
@RequestMapping(value = "/admin/order/order")
public class OrderControler {
	
	 @Resource
	 private IOrderService iOrderService;
	 
	 @Resource
	 private UserService userService;
	 
	 @Resource
	 private UserInfoService UserInfoService;

       
    @RequestMapping("/orderIndex")
    public String xtgsIndex() {
        return "admin/order/orderIndex";
    }
    
    @RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(OrderCtrlModel orderCtrlModel, Model model) {    	   	
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	Integer total = iOrderService.countOrder(orderCtrlModel);   
    	result.put("total", total.intValue());    	
        return result;
    }

    
    @RequestMapping("/listData")
    public String listData(OrderCtrlModel orderCtrlModel, Model model) {   	
    	List<Order> showData = new ArrayList<Order>();
    	showData = iOrderService.selectOrder(orderCtrlModel);   	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", orderCtrlModel);
        return "admin/order/orderListData";
    }
    
    @RequestMapping("/insert")
    public String insert(Order Order, OrderCtrlModel orderCtrlModel, Model model) {
    	
    	model.addAttribute(Order);
    	model.addAttribute("ctrlData", orderCtrlModel);
        return "admin/order/insertOrder";
    }
  

    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(Order order, OrderCtrlModel orderCtrlModel, Model model) {    	
    	
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
        //订单人提交信息
		
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = iOrderService.insertOrder(order);
    	result.put("code", "0");
    	result.put("bizData", order);
    	
        return result;
    }


    @RequestMapping("/update")
    public String update(@RequestParam(value="id",required=false) Long orderId,OrderCtrlModel orderCtrlModel, Model model) {
    	Order order = iOrderService.findByOrderId(orderId);
    	model.addAttribute(order);
    	model.addAttribute("ctrlData", orderCtrlModel);
        return "admin/order/updateOrder";
    }
  

    @RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(Order order, OrderCtrlModel orderCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	
    	if("20".equals(order.getOperateStatus())){
    		Subject subject = SecurityUtils.getSubject();
    		String username = (String)subject.getPrincipal();
    		
    		User user = userService.selectByUsername(username);
    		UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
    		
    		order.setOperateId(user.getId());
    		order.setOperateName(userInfo==null?"":userInfo.getName());
    		order.setOperateDate(new Date());
    		
    		
		}   	
    	iOrderService.updateOrder(order);
    	
    	result.put("code", "0");
    	result.put("bizData", order);
        return result;
    }


    @RequestMapping("/view")
    public String view(@RequestParam(value="id",required=false) Long orderId, OrderCtrlModel orderCtrlModel, Model model) {
    	Order order = iOrderService.findByOrderId(orderId);
    	model.addAttribute(order);
    	model.addAttribute("ctrlData", orderCtrlModel);
        return "admin/order/viewOrder";
    }
    
    @RequestMapping("/deleteData")
    public  Map<String, Object> deleteData(@RequestParam(value="ids",required=false) Long[] orderIds,OrderCtrlModel orderCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	iOrderService.deleteBatchOrder(orderIds);;
    	result.put("code", "0");
    	model.addAttribute("ctrlData", orderCtrlModel);
        return result;
    }
    
    @RequestMapping("/updateStatus")
    public  Map<String, Object> updateStatus(@RequestParam(value="ids",required=false) Long[] orderIds,OrderCtrlModel orderCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	iOrderService.updateBatchOrderStatus(orderIds);
    	result.put("code", "0");
    	model.addAttribute("ctrlData", orderCtrlModel);
        return result;
    }
       
}
