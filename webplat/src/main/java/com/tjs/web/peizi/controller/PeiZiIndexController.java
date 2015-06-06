package com.tjs.web.peizi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	 * 免费配资查看方案进度
	 * @return
	 */
	@RequestMapping("/freeScheduleActivity")
	public String  freeScheduleActivity() {
		return "web/peizi/hdpeizipro";
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
	 * 月月配
	 * @return
	 */
	@RequestMapping("/monthCapital")
	public String  monthCapital() {
		return "web/peizi/yypeizi";
	}
	
	/**
	 * 月月配下一步
	 * @return
	 */
	@RequestMapping("/monthNextCapital")
	public String  monthNextCapital() {
		return "web/peizi/yypznext";
	}
	
	/**
	 * 月月配最后一步
	 * @return
	 */
	@RequestMapping("/monthLastCapital")
	public String  monthLastCapital() {
		return "web/peizi/yypzlast";
	}
	
	/**
	 * 月月配查看方案进度
	 * @return
	 */
	@RequestMapping("/monthScheduleCapital")
	public String  monthScheduleCapital() {
		return "web/peizi/yypzyanzi";
	}
	
	/**
	 * 月月配个人中心信息
	 * @return
	 */
	@RequestMapping("/monthCenterCapital")
	public String  monthCenterCapital() {
		return "web/peizi/yyzhongxin";
	}
	
	/**
	 * 低息配
	 * @return
	 */
	@RequestMapping("/lowCapital")
	public String  lowCapital() {
		return "web/peizi/dxpeizi";
	}
	
	/**
	 * 低息配下一步
	 * @return
	 */
	@RequestMapping("/lowNextCapital")
	public String  lowNextCapital() {
		return "web/peizi/dxpznext";
	}
	
	/**
	 * 低息配最后一步
	 * @return
	 */
	@RequestMapping("/lowLastCapital")
	public String  lowLastCapital() {
		return "web/peizi/dxpzlast";
	}
	
	
	/**
	 * 低息配查看方案进度
	 * @return
	 */
	@RequestMapping("/lowScheduleCapital")
	public String  lowScheduleCapital() {
		return "web/peizi/dxpzyanzi";
	}
	
	/**
	 * 低息配个人中心信息
	 * @return
	 */
	@RequestMapping("/lowCenterCapital")
	public String  lowCenterCapital() {
		return "web/peizi/dxzhongxin";
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
	 * 个人中心天天配跟踪
	 * @return
	 */
	@RequestMapping("/centerDaySchedule")
	public String centerDaySchedule() {
		return "web/peizi/ttpzpro";
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
	public String agreement() {
		return "web/peizi/stackAgreement";            
	}
	
	
}
