package com.tjs.web.peizi.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.peizi.constants.OperaStatusEnum;
import com.tjs.admin.peizi.constants.PeiziTypeEnum;
import com.tjs.admin.peizi.controller.PeiziCtrlModel;
import com.tjs.admin.peizi.controller.PeiziRuleCtrlModel;
import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.peizi.model.PeiziRule;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.peizi.service.IPeiziRule;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.BigDecimalUtils;
import com.tjs.admin.utils.StringUtils;
import com.tjs.admin.zhifu.controller.CustomerFundCtrlModel;
import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.model.FundRecord;
import com.tjs.admin.zhifu.service.ICustomerFund;
import com.tjs.admin.zhifu.zfenum.FundRecordFundTypeEnum;
import com.tjs.web.constants.PeiZiConstants;
import com.tjs.web.peizi.model.FreePeiziDetailVO;
import com.tjs.web.peizi.model.UserInfoExtendVO;
import com.tjs.web.peizi.service.IPeiZiIndexService;
import com.tjs.web.zhifu.service.IZhifuService;

/**
 * 免费配资控制器
 * 
 *@author dyj
 *@since 2015年5月22日
 *
 **/

@Controller
@RequestMapping(value = "/web/peizi/mfp")
public class PeiZiMFIndexController {
	
	@Resource
	private IPeiZiIndexService iPeiZiIndexService;
	
	@Resource
	private IPeizi iPeiziService;
	
	@Resource
	private UserService userService;
	
	@Resource
    private UserInfoService userInfoService;
	
	@Resource
	IPeiziRule iPeiziRule;
	
	@Resource
	private ICustomerFund customerFundService;
	
	@Resource
	private IZhifuService zhifuService;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/freeActivity")
	public String  freeActivity(Model model) {
		//获取免费配的配资规则
		PeiziRuleCtrlModel peiziRuleCtrlModel = new PeiziRuleCtrlModel();
		peiziRuleCtrlModel.getPeiziRule().setRuleType(PeiziTypeEnum.MFPEIZI.getKey());
		
		List<PeiziRule> lstPeiziRule = iPeiziRule.selectPeiziRule(peiziRuleCtrlModel);
		if(lstPeiziRule==null||lstPeiziRule.size()==0){
			throw new  RuntimeException("免息配资规则没有找到");
		}
		PeiziRule peiziRule = lstPeiziRule.get(0);
		model.addAttribute("peiziRule",peiziRule);
		
		if(peiziRule.getRuleEnable().equals("20")){
			return "web/peizi/mfp/hdpeizi"; 
		}
		
		//查询当天免费配活动是否有名额
		PZIndexCtrlModel pzIndexCtrlModel = new PZIndexCtrlModel();
		pzIndexCtrlModel.setDateString(sdf.format(Calendar.getInstance().getTime()));
		pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MFPEIZI.getIntegerKey());
		List<FreePeiziDetailVO> lstPZVO = iPeiZiIndexService.getFreePeiziDetailList(pzIndexCtrlModel);
		if(lstPZVO!=null 
				&& lstPZVO.size()>0){
			if(lstPZVO.get(0).getPeiziCount()>=PeiZiConstants.FREE_ALL_COUNT){
				model.addAttribute("result", PeiZiConstants.RESULT_NO_AMOUNT);
			}else{
				Subject subject = SecurityUtils.getSubject();
				String username = (String)subject.getPrincipal();
				if(username!=null){
					User user = userService.selectByUsername(username);
					pzIndexCtrlModel.setUserId(user.getId());
					pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MFPEIZI.getIntegerKey());
					List<UserInfoExtendVO> lstUser = iPeiZiIndexService.getUserInfoExtendList(pzIndexCtrlModel);
					if(lstUser!=null 
							&& lstUser.size()>0){
						UserInfoExtendVO userInfoExtendVO = lstUser.get(0);
						if(userInfoExtendVO.getPeiziType()==PeiziTypeEnum.MFPEIZI.getIntegerKey()
								&& userInfoExtendVO.getIsOwnResource()==0){
							model.addAttribute("result", PeiZiConstants.RESULT_ALREADY_USED);
						}
					}
				}
			}
		}else{
			Subject subject = SecurityUtils.getSubject();
			String username = (String)subject.getPrincipal();
			if(username!=null){
				User user = userService.selectByUsername(username);
				pzIndexCtrlModel.setUserId(user.getId());
				pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MFPEIZI.getIntegerKey());
				List<UserInfoExtendVO> lstUser = iPeiZiIndexService.getUserInfoExtendList(pzIndexCtrlModel);
				if(lstUser!=null 
						&& lstUser.size()>0){
					UserInfoExtendVO userInfoExtendVO = lstUser.get(0);
					if(userInfoExtendVO.getPeiziType()==PeiziTypeEnum.MFPEIZI.getIntegerKey()
							&& userInfoExtendVO.getIsOwnResource()==0){
						model.addAttribute("result", PeiZiConstants.RESULT_ALREADY_USED);
					}
				}
			}
		}
		
		
		return "web/peizi/mfp/hdpeizi";
	}
	
	
	/**
	 * 免费配资下一步
	 * @return
	 */
	@RequestMapping("/freeNextActivity")
	public String  freeNextActivity(Model model) {
		//获取免费配的配资规则
		PeiziRuleCtrlModel peiziRuleCtrlModel = new PeiziRuleCtrlModel();
		peiziRuleCtrlModel.getPeiziRule().setRuleType(PeiziTypeEnum.MFPEIZI.getKey());
		
		List<PeiziRule> lstPeiziRule = iPeiziRule.selectPeiziRule(peiziRuleCtrlModel);
		if(lstPeiziRule==null||lstPeiziRule.size()==0){
			throw new  RuntimeException("免息配资规则没有找到");
		}
		PeiziRule peiziRule = lstPeiziRule.get(0);
		model.addAttribute("peiziRule",peiziRule);
		
		if(peiziRule.getRuleEnable().equals("20")){
			return "redirect:/rest/web/peizi/mfp/freeActivity";  
		}
		
		PZIndexCtrlModel pzIndexCtrlModel = new PZIndexCtrlModel();
		pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MFPEIZI.getIntegerKey());
		pzIndexCtrlModel.setDateString(sdf.format(Calendar.getInstance().getTime()));
		
		//判断用户实名认证
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		if(username!=null){
			User user = userService.selectByUsername(username);
			UserInfo userInfoTemp = userInfoService.findUserInfoByUserId(user.getId());
			if(userInfoTemp.getIsValidate()!=1){
				//实名认证
				model.addAttribute("result", "-3");
				return "web/peizi/mfp/hdpeizi";
			}
		}
		
		int result = iPeiZiIndexService.checkFreePeiZiIsValid(pzIndexCtrlModel);
		if(PeiZiConstants.RESULT_ALREADY_USED==result){
			model.addAttribute("result", "您已经参加过该活动");
			return "web/peizi/mfp/hdpeizi";
		}else if(PeiZiConstants.RESULT_NO_AMOUNT==result){
			model.addAttribute("result", "名额已满");
			return "web/peizi/mfp/hdpeizi";
		}
		
		
		model.addAttribute("jjx", BigDecimalUtils.multiply(new BigDecimal(7500), peiziRule.getRuleJjx3()).divide(new BigDecimal(100)));
		model.addAttribute("pcx", BigDecimalUtils.multiply(new BigDecimal(7500), peiziRule.getRulePcx3()).divide(new BigDecimal(100)));
		
		
		return "web/peizi/mfp/hdpeizinext";
	}
	
	/**
	 * 免费配资最后一步
	 * @return
	 */
	@RequestMapping("/freeLastActivity")
	public String  freeLastActivity(Model model) {
		//获取免费配的配资规则
		PeiziRuleCtrlModel peiziRuleCtrlModel = new PeiziRuleCtrlModel();
		peiziRuleCtrlModel.getPeiziRule().setRuleType(PeiziTypeEnum.MFPEIZI.getKey());
		
		List<PeiziRule> lstPeiziRule = iPeiziRule.selectPeiziRule(peiziRuleCtrlModel);
		if(lstPeiziRule==null||lstPeiziRule.size()==0){
			throw new  RuntimeException("免息配资规则没有找到");
		}
		PeiziRule peiziRule = lstPeiziRule.get(0);
		model.addAttribute("peiziRule",peiziRule);
		
		if(peiziRule.getRuleEnable().equals("20")){
			return "redirect:/rest/web/peizi/mfp/freeActivity";  
		}
		
		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		//如果用户没有登录直接访问
		if(username==null){
			return "web/peizi/mfp/hdpeizi";
		}
		Peizi peizi = new Peizi();
		//1、将用户能使用资源设置为0
		PZIndexCtrlModel pzIndexCtrlModel = new PZIndexCtrlModel();
		User user = userService.selectByUsername(username);
		pzIndexCtrlModel.setUserId(user.getId());
		pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MFPEIZI.getIntegerKey());
		List<UserInfoExtendVO> lstUser = iPeiZiIndexService.getUserInfoExtendList(pzIndexCtrlModel);
		if(lstUser!=null && lstUser.size()>0){
			UserInfoExtendVO userInfoExtendVO = lstUser.get(0);
			if(userInfoExtendVO.getIsOwnResource()!=PeiZiConstants.IS_OWN_RESOURCE){
				model.addAttribute("result", PeiZiConstants.RESULT_ALREADY_USED);
				return "web/peizi/mfp/hdpeizi";
			}else{
				//1、更新状态并产生订单
				userInfoExtendVO.setIsOwnResource(0);
				userInfoExtendVO.setPhone(username);
				peizi = iPeiZiIndexService.createFreeAllPeiziOrder(userInfoExtendVO, PeiziTypeEnum.MFPEIZI.getKey());
			}
		}
		model.addAttribute("dataId", peizi.getDataId());
		
		//账户信息
		CustomerFund customerFund = getCustomerFund(user.getId());
		model.addAttribute("customerFund", customerFund);
		model.addAttribute("peizi", peizi);
		model.addAttribute("peiziType", PeiziTypeEnum.MFPEIZI.getKey());
		return "web/peizi/pzpay";
	}
	
	/**
	 * 从后台打开确认支付页
	 * 
	 * @return
	 */
	@RequestMapping("/confirmPay")
	public String confirmPay(PeiziCtrlModel peiziCtrlModel, Model model) {
		Peizi peizi = peiziCtrlModel.getPeizi();
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		if(StringUtils.isBlank(username) || peizi.getDataId()==null){
			return "redirect:/rest/web/peizi/mxp/monthCapital";
		}
		User user = userService.selectByUsername(username);
		//从数据库中读取
		peizi = iPeiziService.findByPeiziId(peizi.getDataId());
		//账户信息
		CustomerFund customerFund = getCustomerFund(user.getId());
		
		model.addAttribute("customerFund", customerFund);
		model.addAttribute("peizi", peizi);
		model.addAttribute("peiziType", PeiziTypeEnum.MFPEIZI.getKey());
		return "web/peizi/pzpay";
	}
	
	
	/**
	 * 免息配付款
	 * 
	 * @return
	 */
	@RequestMapping("/pay")
	public String pay(PeiziCtrlModel peiziCtrlModel, Model model) {
		Peizi peizi = peiziCtrlModel.getPeizi();
		if (peizi.getDataId()==null) {
			return "redirect:/rest/web/peizi/mxp/monthCapital";
		}
		//判断用户实名认证
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		//从数据库中读取
		peizi = iPeiziService.findByPeiziId(peizi.getDataId());
		//如果不是待支付状态，直接跳到成功页面
		if(!OperaStatusEnum.PZPay.getKey().equals(peizi.getDataOperaStatus())){
			CustomerFund customerFund = getCustomerFund(user.getId());
			model.addAttribute("usableFund", customerFund.getUsebleFund());
			return "web/peizi/mxp/mxpzlast";
		}
		
		CustomerFund customerFund = getCustomerFund(user.getId());
		if(customerFund.getUsebleFund().compareTo(peizi.getDataTzbzj())!=-1){
			//1、修改保证金
			customerFund.setUsebleFund(customerFund.getUsebleFund().subtract(peizi.getDataTzbzj()));
			customerFund.setPeiziFund(customerFund.getPeiziFund().add(peizi.getDataPzje()));
			customerFund.setFxbzFund(customerFund.getFxbzFund().add(peizi.getDataTzbzj()));	
			//TODO 付利息
			if(peizi.getDataJklxTotal()!=null){
				customerFund.setTotalFund(customerFund.getTotalFund().subtract(peizi.getDataJklxTotal()));
				customerFund.setUsebleFund(customerFund.getUsebleFund().subtract(peizi.getDataJklxTotal()));
			}
			
			//2、插入记录  --投资保证金
			FundRecord fundRecord = buildFundRecord(peizi, userInfo, FundRecordFundTypeEnum.TZBZJ, customerFund.getUsebleFund());
			// --配资金额
			FundRecord fundRecord2 = buildFundRecord(peizi, userInfo, FundRecordFundTypeEnum.PZJE, customerFund.getUsebleFund());
			List<FundRecord> lstFundRecord = new ArrayList<FundRecord>();
			lstFundRecord.add(fundRecord);
			lstFundRecord.add(fundRecord2);
			// --利息
			if(peizi.getDataJklxTotal()!=null){
				FundRecord fundRecord3 = buildFundRecord(peizi, userInfo, FundRecordFundTypeEnum.JKLX, customerFund.getUsebleFund());
				lstFundRecord.add(fundRecord3);
			}
			
			//设置配资状态
			peizi.setDataOperaStatus(OperaStatusEnum.PZZhong.getKey());
			
			zhifuService.payPeizi(lstFundRecord, customerFund, peizi);
		}
		
		
		model.addAttribute("usableFund", customerFund.getUsebleFund());
		
		return "web/peizi/mxp/mxpzlast";
	}
	
	/**
	 * 构造资金流水
	 * @param peizi
	 * @param fundTypeEnum
	 * @param usableAmount
	 * @return FundRecord
	 */
	private FundRecord buildFundRecord(Peizi peizi, UserInfo userInfo,
				FundRecordFundTypeEnum fundTypeEnum, BigDecimal usableAmount){
		FundRecord fundRecord = new FundRecord();
		if(FundRecordFundTypeEnum.TZBZJ.getKey().equals(fundTypeEnum.getKey())){
			fundRecord.setAmount(peizi.getDataTzbzj());
		}else if(FundRecordFundTypeEnum.PZJE.getKey().equals(fundTypeEnum.getKey())){
			fundRecord.setAmount(peizi.getDataPzje());
		}else if(FundRecordFundTypeEnum.JKLX.getKey().equals(fundTypeEnum.getKey())){
			fundRecord.setAmount(peizi.getDataJklxTotal());
		}
		
		fundRecord.setBusinessId(peizi.getDataId());
		fundRecord.setCreateBy(userInfo.getName()==null?userInfo.getMobileNo():userInfo.getName());
		fundRecord.setCreateTime(Calendar.getInstance().getTime());
		fundRecord.setCustomerId(userInfo.getUserId());
		fundRecord.setFundType(fundTypeEnum.getKey());
		fundRecord.setRecordDesc(fundTypeEnum.getValue());
		fundRecord.setUsableAmount(usableAmount);
		
		return fundRecord;
	}

	/**
	 * 获取个人账户信息
	 * @param userId
	 * @return CustomerFund
	 */
	private CustomerFund getCustomerFund(Long userId){
		CustomerFund customerFund = null;
		//查询用户个人账户
		CustomerFundCtrlModel customerFundCtrlModel = new CustomerFundCtrlModel();
		customerFundCtrlModel.getCustomerFund().setCustomerId(userId);
		List<CustomerFund> lstCustomerFund = customerFundService.selectCustomerFund(customerFundCtrlModel);
		if(lstCustomerFund!=null && lstCustomerFund.size()>0){
			customerFund = lstCustomerFund.get(0);
		}else{
			CustomerFund cNewCustomerFund = new CustomerFund();
			cNewCustomerFund.setCustomerId(userId);
			cNewCustomerFund.setTotalFund(BigDecimal.ZERO);
			cNewCustomerFund.setUsebleFund(BigDecimal.ZERO);
			cNewCustomerFund.setPeiziFund(BigDecimal.ZERO);
			cNewCustomerFund.setFxbzFund(BigDecimal.ZERO);
			cNewCustomerFund.setDongjieFund(BigDecimal.ZERO);
			
			cNewCustomerFund.setLockId(1);
			customerFundService.insertCustomerFund(cNewCustomerFund);
			customerFund = cNewCustomerFund;
		}
		
		return customerFund;
	}
	
	
	/**
	 * 免费配资查看方案进度
	 * @return
	 */
	@RequestMapping("/freeScheduleActivity")
	public String  freeScheduleActivity(Model model) {
		//获取免费配的配资规则
		PeiziRuleCtrlModel peiziRuleCtrlModel = new PeiziRuleCtrlModel();
		peiziRuleCtrlModel.getPeiziRule().setRuleType(PeiziTypeEnum.MFPEIZI.getKey());
		
		List<PeiziRule> lstPeiziRule = iPeiziRule.selectPeiziRule(peiziRuleCtrlModel);
		if(lstPeiziRule==null||lstPeiziRule.size()==0){
			throw new  RuntimeException("免息配资规则没有找到");
		}
		PeiziRule peiziRule = lstPeiziRule.get(0);
		
		model.addAttribute("jjx", BigDecimalUtils.multiply(new BigDecimal(7500), peiziRule.getRuleJjx3()).divide(new BigDecimal(100)));
		model.addAttribute("pcx", BigDecimalUtils.multiply(new BigDecimal(7500), peiziRule.getRulePcx3()).divide(new BigDecimal(100)));
		
		
		return "web/peizi/mfp/hdpeizipro";
	}
	
}
