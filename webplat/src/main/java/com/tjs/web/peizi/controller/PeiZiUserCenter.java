package com.tjs.web.peizi.controller;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.model.User;
import com.tjs.admin.peizi.controller.PeiziCtrlModel;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.service.UserService;

/**
 * 用户中心配资
 * 
 *@author dyj
 *@since 2015年6月9日
 *
 **/

@Controller
@RequestMapping(value = "/web/peizi/usercenter")
public class PeiZiUserCenter {
	
	@Resource
	private IPeizi iPeiziService;
	
	@Resource
	private UserService userService;

	/**
	 * 免费配资用户中心
	 * @return
	 */
	@RequestMapping("/mfp")
	public String  mfpUserCenter(Model modle) {
		//已经配置需要先登录
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		
		PeiziCtrlModel peiziCtrlModel = new PeiziCtrlModel();
		peiziCtrlModel.getPeizi().setDataUserId(user.getId());
		//peiziCtrlModel.getPeizi().set
		//查询配资记录
		iPeiziService.selectPeizi(peiziCtrlModel);
		
		
		return "web/peizi/mfp/hdpeiziuser";
	}
	
}
