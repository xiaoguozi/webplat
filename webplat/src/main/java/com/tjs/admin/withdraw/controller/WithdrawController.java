package com.tjs.admin.withdraw.controller;

import java.io.UnsupportedEncodingException;
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
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.withdraw.service.IWithdrawBizService;
import com.tjs.admin.zhifu.controller.WithdrawCtrlModel;
import com.tjs.admin.zhifu.model.Withdraw;
import com.tjs.admin.zhifu.service.IWithdraw;
import com.tjs.admin.zhifu.zfenum.WithdrawEnum;

/**
 * 
 * @author 何志刚
 * @since 2015年3月21日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/admin/withdraw")
public class WithdrawController {
 
	@Resource
	IWithdraw withdrawService;
	@Resource
	IWithdrawBizService withdrawBizService;
	@Resource
	private UserService userService;	 
	@Resource
	private UserInfoService UserInfoService;
	
	@RequestMapping("/withdrawIndex")
    public String xtgsIndex() {
        return "admin/withdraw/withdrawIndex";
    }
    
    @RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(WithdrawCtrlModel withdrawCtrlModel, Model model){
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	int icount = withdrawService.countWithdraw(withdrawCtrlModel);
    	   	
    	result.put("total", icount);
    	
        return result;
    }

    
    @RequestMapping("/listData")
    public String listData(WithdrawCtrlModel withdrawCtrlModel, Model model) throws UnsupportedEncodingException {
    	List<Withdraw> lstWithdraw = withdrawService.selectWithdraw(withdrawCtrlModel);
    	model.addAttribute("showData", lstWithdraw);
		model.addAttribute("ctrlData", withdrawCtrlModel);
    	
        return "admin/withdraw/withdrawListData";
    }
    
    @RequestMapping("/update")
    public String update(@RequestParam(value="id",required=false) Long withrowId, WithdrawCtrlModel withdrawCtrlModel, Model model) {
    	Withdraw withdraw = withdrawService.findByWithdrawId(withrowId);
    	model.addAttribute(withdraw);
    	model.addAttribute("ctrlData", withdrawCtrlModel);
        return "admin/withdraw/updateWithdraw";
    }
  

    @RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(Withdraw withdraw, WithdrawCtrlModel withdrawCtrlModel, Model model) {  	
    	Map<String, Object> result = new HashMap<String, Object>();
    	
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();		
		User user = userService.selectByUsername(username);
		UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
		String userName=userInfo==null?"":userInfo.getName();		
    	withdrawBizService.updateWithdraw(withdraw,userName);
    	result.put("code", "0");
    	result.put("bizData", withdrawCtrlModel);
        return result;
    }
	
}
