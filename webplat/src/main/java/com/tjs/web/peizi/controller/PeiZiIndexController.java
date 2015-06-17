package com.tjs.web.peizi.controller;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.StringUtils;

/**
 * 配资首页控制器
 * 
 *@author zhsoft
 *@since 2015年5月22日
 *
 **/

@Controller
@RequestMapping(value = "/web/peizi")
public class PeiZiIndexController {
	 @Resource
	 private UserService userService;
	 
	 @Resource
	 private UserInfoService UserInfoService;
	/**
	 * 配资首页
	 * @return
	 */
	@RequestMapping("/index")
    public String index() {
        return "web/peizi/index";
    }
	
	/**
	 * 淘金活动主页
	 * @return
	 */
	@RequestMapping("/activity")
	public String  activity() {
		return "web/peizi/tjhuodong";
	}
	
	
	/**
	 * 淘金配资主页
	 * @return
	 */
	@RequestMapping("/capital")
	public String  capital() {
		return "web/peizi/tjpeizi";
	}
		
	
	/**
	 * 淘金募集页
	 * @return
	 */
	@RequestMapping("/raise")
	public String raise() {
		return "web/peizi/tjmuji";
	}

	/**
	 * 淘金募集首页推荐
	 * @return
	 */
	@RequestMapping("/recommandRaise")
	public String recommandRaise() {
		return "web/peizi/tjmujimingxi";
	}
	
	/**
	 * 淘金自营
	 * @return
	 */
	@RequestMapping("/self")
	public String self() {
		return "web/peizi/tjziying";
	}
	
	/**
	 * 淘金自营首页推荐
	 * @return
	 */
	@RequestMapping("/recommandSelf")
	public String recommandSelf() {
		return "web/peizi/tjziyingmingxi";
	}
	
	/**
	 * 个人中心
	 * @return
	 */
	@RequestMapping("/personalCenter")
	public String personalCenter() {
		return "web/peizi/zhongxin";
	}
	
	
	
	/**
	 * 交易软件
	 * @return
	 */
	@RequestMapping("/trade")
	public String trade() {
		return "web/peizi/ruanjian";
	}
	
	/**
	 * 充值
	 * @return
	 */
	@RequestMapping("/recharge")
	public String recharge() {
		return "web/peizi/chongzhi";
	}
	
	/**
	 * 支付宝充值
	 * @return
	 */
	@RequestMapping("/alipay")
	public String alipay() {
		return "web/peizi/zhifubao";
	}
	
	/**
	 * 线下充值
	 * @return
	 */
	@RequestMapping("/offLinePay")
	public String offLinePay() {
		return "web/peizi/xianxia";
	}
	
	/**
	 * 充值记录
	 * @return
	 */
	@RequestMapping("/rechargeRecord")
	public String rechargeRecord() {
		return "web/peizi/jilu";
	}
	
	/**
	 * 资金明细
	 * @return
	 */
	@RequestMapping("/moneyDetail")
	public String moneyDetail() {
		return "web/peizi/zijinmx";
	}
	
	
	/**
	 * 配资协议 
	 * @return
	 */
	@RequestMapping("/agreement")
	public String agreement(Model model) {
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal(); 
		if(StringUtils.isNotBlank(username)){
			User user = userService.selectByUsername(username);
    		UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
    		model.addAttribute("userName", (userInfo==null?"":userInfo.getName()));
    		model.addAttribute("tjsName", (userInfo==null?username:userInfo.getNickName()));				
		}  
		
		
		return "web/peizi/stackAgreement";            
	}	
	
	
	
}
