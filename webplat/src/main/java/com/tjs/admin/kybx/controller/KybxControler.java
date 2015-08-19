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

import com.tjs.admin.kybx.model.Kybx;
import com.tjs.admin.kybx.service.IKybxService;
import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
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
	 private UserService userService;
	 
	 @Resource
	 private UserInfoService UserInfoService;
	 
	 
	 @Resource
	 private IKybxService kybxService;

       
    @RequestMapping("/kybxIndex")
    public String kybxIndex() {
        return "admin/kybx/kybxIndex";
    }
    
    
    @RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(KybxCtrlModel kybxCtrlModel, Model model) {    	   	
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	Integer total = kybxService.countKybx(kybxCtrlModel);
    	result.put("total", total.intValue());    	
        return result;
    }

    
    @RequestMapping("/listData")
    public String listData(KybxCtrlModel kybxCtrlModel, Model model) {   	
    	List<Kybx> showData = new ArrayList<Kybx>();
    	showData = kybxService.selectKybx(kybxCtrlModel);
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", kybxCtrlModel);
        return "admin/kybx/kybxListData";
    }
    
    @RequestMapping("/insert")
    public String insert(Kybx kybx, KybxCtrlModel kybxCtrlModel, Model model) {
    	
    	model.addAttribute(kybx);
    	model.addAttribute("ctrlData", kybxCtrlModel);
        return "admin/kybx/insertKybx";
    }
  

    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(Kybx kybx, KybxCtrlModel kybxCtrlModel, Model model) {    	
    	
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
		
		kybx.setKybxCreateBy(userInfo==null?username:userInfo.getName());
		kybx.setKybxCreateDate(new Date());
        //订单人提交信息		
    	Map<String, Object> result = new HashMap<String, Object>();
    	kybxService.insertKybx(kybx);
    	result.put("code", "0");
      	result.put("bizData", kybx);
    	
        return result;
    }
    
    @RequestMapping("/update")
    public String update(@RequestParam(value="id",required=false) Long kybxId,KybxCtrlModel kybxCtrlModel, Model model) {
    	Kybx kybx = kybxService.findBykybxId(kybxId);
    	model.addAttribute(kybx);
    	model.addAttribute("ctrlData", kybxCtrlModel);
        return "admin/kybx/updateKybx";
    }
  

    @RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(Kybx kybx, KybxCtrlModel kybxCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		
		User user = userService.selectByUsername(username);
		UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
		
		kybx.setKybxModifyBy(userInfo==null?username:userInfo.getName());
		kybx.setKybxModifyDate(new Date());

		kybxService.updateKybx(kybx);	
    	result.put("code", "0");
    	result.put("bizData", kybx);
        return result;
    }
  
       
}
