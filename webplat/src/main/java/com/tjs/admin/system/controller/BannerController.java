package com.tjs.admin.system.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.system.model.SysHome;
import com.tjs.admin.system.service.ISysHome;
import com.tjs.admin.system.utils.FileUtil;
import com.tjs.admin.xintuo.controller.XinTuoGsCtrlModel;

/**
 * 
 * @author 何志刚
 * @since 2015年3月21日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/admin/system/banner")
public class BannerController {
	
	@Resource
	private ISysHome sysHomeService;
	
	 @Resource
	 private UserService userService;
	 
	 @Resource
	 private UserInfoService UserInfoService;
	
	
	 @RequestMapping("/bannerIndex")
     public String bannerIndex(HttpServletRequest request) {
        return "admin/system/banner/bannerIndex";
        
    }

	 @RequestMapping("/listDataCount")
	    @ResponseBody
	    public Map<String, Integer> listDataCount(BannerCtrlModel bannerCtrlModel, Model model) {    	
	    	
	    	Map<String, Integer> result = new HashMap<String, Integer>();
	    	Integer total = sysHomeService.countBanner(bannerCtrlModel);   
	    	result.put("total", total.intValue());    	
	        return result;
	    }

	    
	    @RequestMapping("/listData")
	    public String listData(BannerCtrlModel bannerCtrlModel, Model model) {   	
	    	List<SysHome> showData = new ArrayList<SysHome>();
	    	showData = sysHomeService.selectBanner(bannerCtrlModel);  	
	    	model.addAttribute("showData", showData);
			model.addAttribute("ctrlData", bannerCtrlModel);
	        return "admin/system/banner/bannerListData";
	    }
	     
	 
	    
	    @RequestMapping("/insert")
	    public String insert(SysHome sysHome, BannerCtrlModel bannerCtrlModel, Model model) {	    	
	    	model.addAttribute(sysHome);
	    	model.addAttribute("ctrlData", bannerCtrlModel);
	        return "admin/system/banner/insertBanner";
	    }
	  

	    @RequestMapping("/insertData")
	    @ResponseBody
	    public Map<String, Object> insertData(SysHome sysHome,Model model) {
	    	Map<String, Object> result = new HashMap<String, Object>();
	    	
	    	Subject subject = SecurityUtils.getSubject();
			String username = (String)subject.getPrincipal();
			
			User user = userService.selectByUsername(username);
			UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
			
			
			sysHome.setCreateTime(new Date());	
			sysHome.setCreateBy((userInfo==null?"":userInfo.getNickName()));
			sysHome.setUpdateBy(userInfo==null?"":userInfo.getNickName());
			sysHome.setUpdateTime(new Date());
			sysHome.setUserType(0);
	    	int id = sysHomeService.insertBanner(sysHome);
	    	result.put("code", "0");
	    	result.put("bizData", sysHome);
	    	
	        return result;
	    }


	    @RequestMapping("/update")
	    public String update(@RequestParam(value="id",required=false) Long homeId, BannerCtrlModel bannerCtrlModel, Model model) {
	    	SysHome sysHome = sysHomeService.findSysHomeById(homeId);   
	    	model.addAttribute(sysHome);
	    	model.addAttribute("ctrlData", bannerCtrlModel);
	        return "admin/system/banner/updateBanner";
	    }
	  

	    @RequestMapping("/updateData")
	    @ResponseBody
	    public Map<String, Object> updateData(SysHome sysHome, XinTuoGsCtrlModel xintuoGsCtrlModel, Model model) {	    	
	    	Map<String, Object> result = new HashMap<String, Object>();
	    	
	    	Subject subject = SecurityUtils.getSubject();
			String username = (String)subject.getPrincipal();			
			User user = userService.selectByUsername(username);
			UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
			sysHome.setUserType(0);
			sysHome.setUpdateBy(userInfo==null?"":userInfo.getNickName());
			sysHome.setUpdateTime(new Date());
	    	int id = sysHomeService.updateBanner(sysHome);   	
	    	result.put("code", "0");
	    	result.put("bizData", sysHome);	    	
	        return result;
	    }

	 
	 
}
