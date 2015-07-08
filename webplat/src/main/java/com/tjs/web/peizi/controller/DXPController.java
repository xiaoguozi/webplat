package com.tjs.web.peizi.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
import com.tjs.web.peizi.token.TokenConstants;
import com.tjs.web.peizi.token.TokenHandler;
import com.tjs.web.zhifu.service.IZhifuService;

/**
 * 配资首页控制器
 * 
 *@author zhsoft
 *@since 2015年5月22日
 *
 **/
@Controller
@RequestMapping(value = "/web/peizi/dxp")
public class DXPController {
		
	@Resource
	IPeizi iPeizi;
	@Resource
	IPeiziRule iPeiziRule;
	
	 @Resource
	 private UserService userService;
	 
	 @Resource
	 private UserInfoService UserInfoService;
	 
	 @Resource
	 private IZhifuService zhifuService;
	 
	 @Resource
	 private ICustomerFund customerFundService;
	 
	/**
	 * 低息配第一步
	 * @return
	 */
	@RequestMapping("/lowCapital")
	public String  lowCapital(Model model) {
		
		
		//获取天天配的配资规则
		PeiziRuleCtrlModel peiziRuleCtrlModel = new PeiziRuleCtrlModel();
		peiziRuleCtrlModel.getPeiziRule().setRuleType(PeiziTypeEnum.DXPEIZI.getKey());
		
		List<PeiziRule> lstPeiziRule = iPeiziRule.selectPeiziRule(peiziRuleCtrlModel);
		if(lstPeiziRule==null||lstPeiziRule.size()==0){
			throw new  RuntimeException("低息配资规则没有找到");
		}
		PeiziRule peiziRule = lstPeiziRule.get(0);
		Peizi peizi = new Peizi();
		//规则信息
		peizi.setDataType(PeiziTypeEnum.DXPEIZI.getKey());
		peizi.setDataTypeSylx(peiziRule.getRuleGlsyType());
//		peizi.setDataZfglf(peiziRule.getRuleZhglf());
//		peizi.setDataNll(peiziRule.getRuleNll());
//		peizi.setDataYll(peiziRule.getRuleYll());
//		peizi.setDataRuleJjx(peiziRule.getRuleJjx());
//		peizi.setDataRulePcx(peiziRule.getRulePcx());
		peizi.setDataStep("1");
		

		peizi.setDataJyksDate("2");
		peizi.setDataZjsyqx(1);
		
		model.addAttribute("peiziRule",peiziRule);
		model.addAttribute("peizi",peizi);
		
		//判断用户实名认证
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		if(username!=null){
			User user = userService.selectByUsername(username);
			UserInfo userInfoTemp = UserInfoService.findUserInfoByUserId(user.getId());
			model.addAttribute("islogin", "true");
			if(userInfoTemp.getIsValidate()!=1){
				//实名认证
				model.addAttribute("result", "-3");//没有认证		
			}else{
				model.addAttribute("result", "-2");//已实名认证
			}
		}
		
		return "web/peizi/dxp/dxpeizi";
	}
	
	
	/**
	 * 低息配下一步
	 * @return
	 */
	@RequestMapping("/lowNextCapital")
	public String  lowNextCapital(Peizi peizi,Model model,HttpServletRequest request) {		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();	
		if(BigDecimalUtils.isNull(peizi.getDataZcpzj())||BigDecimalUtils.isNull(peizi.getDataTzbzj())
				||StringUtils.isBlank(username)){//判断是否等率
			return "redirect:/rest/web/peizi/dxp/lowCapital";  
		}
		String token = TokenHandler.generateGUID(request.getSession());
		peizi.setDataStep("2");
		peizi.setDataPzje(BigDecimalUtils.subtract(peizi.getDataZcpzj(), peizi.getDataTzbzj()));		
		peizi.setZfzje(BigDecimalUtils.add(peizi.getDataTzbzj(), peizi.getDataJklxTotal()));
		peizi.setZfglf(BigDecimalUtils.div(BigDecimalUtils.multiply(peizi.getDataZfglf(), peizi.getDataZcpzj()), new BigDecimal(10000)));
		model.addAttribute(TokenConstants.DEFAULT_TOKEN_NAME, token);
		return "web/peizi/dxp/dxpznext";		
	}
	
	
	
	
	
	/**
	 * 低息配最后一步
	 * @return
	 */
	@RequestMapping("/lowLastCapital")
	public String  lowLastCapital(Peizi peizi,Model model,HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();			
		if(BigDecimalUtils.isNull(peizi.getDataZcpzj())||BigDecimalUtils.isNull(peizi.getDataTzbzj())
				||StringUtils.isBlank(username)){
			return "redirect:/rest/web/peizi/dxp/lowCapital";  
		}
				
		if(!TokenHandler.validToken(request)){
			return "redirect:/rest/web/peizi/dxp/lowCapital"; 
		}
		
		
		peizi.setDataStep("3");
		peizi.setDataOperaStatus(OperaStatusEnum.PZPay.getKey());//待支付
		User user = userService.selectByUsername(username);
		if(peizi.getDataId()==null){
			Date nowDate = new Date();
			peizi.setDataCreateDate(nowDate);
			peizi.setDataModifyDate(nowDate);
			peizi.setDataSubmitDate(nowDate);			
			if(StringUtils.isNotBlank(username)){
	    		UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
	    		peizi.setDataUserName(userInfo==null?"":userInfo.getName());
				peizi.setDataUserTel(username);
				peizi.setDataUserId(user.getId());	
			}   			
			iPeizi.insertPeizi(peizi);
		}else{
			Date nowDate = new Date();
			peizi.setDataModifyDate(nowDate);
			iPeizi.updatePeizi(peizi);
		}
		//账户信息
		CustomerFund customerFund = getCustomerFund(user.getId());
		model.addAttribute("customerFund", customerFund);
		model.addAttribute("peiziType", PeiziTypeEnum.DXPEIZI.getKey());
		model.addAttribute("peizi",peizi);	
		
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
			return "redirect:/rest/web/peizi/dxp/monthCapital";  
		}
		User user = userService.selectByUsername(username);
		//从数据库中读取
		peizi = iPeizi.findByPeiziId(peizi.getDataId());
		peizi.setDataJklxTotal(peizi.getDataJklxTotal()==null?BigDecimal.ZERO:peizi.getDataJklxTotal());
		//账户信息
		CustomerFund customerFund = getCustomerFund(user.getId());
		
		model.addAttribute("customerFund", customerFund);
		model.addAttribute("peizi", peizi);
		model.addAttribute("peiziType", PeiziTypeEnum.DXPEIZI.getKey());
		return "web/peizi/pzpay";
	}
	
	
	/**
	 * 月月配付款
	 * 
	 * @return
	 */
	@RequestMapping("/pay")
	public String pay(PeiziCtrlModel peiziCtrlModel, Model model) {
		Peizi peizi = peiziCtrlModel.getPeizi();
		if (peizi.getDataId()==null) {
			return "redirect:/rest/web/peizi/yyp/monthCapital";  
		}
		//判断用户实名认证
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
		//从数据库中读取
		peizi = iPeizi.findByPeiziId(peizi.getDataId());
		//如果不是待支付状态，直接跳到成功页面
		if(!OperaStatusEnum.PZPay.getKey().equals(peizi.getDataOperaStatus())){
			CustomerFund customerFund = getCustomerFund(user.getId());
			model.addAttribute("usableFund", customerFund.getUsebleFund());
			model.addAttribute("peizi", peizi);
			return "web/peizi/pzpay";
		}
		
		CustomerFund customerFund = getCustomerFund(user.getId());
		if(customerFund.getUsebleFund().compareTo(peizi.getDataTzbzj())!=-1){
			BigDecimal usableAmount1 = null;
			BigDecimal usableAmount2 = null;
			
			//1、修改保证金
			usableAmount1 = customerFund.getUsebleFund().subtract(peizi.getDataTzbzj());
			customerFund.setUsebleFund(usableAmount1);
			customerFund.setPeiziFund(customerFund.getPeiziFund().add(peizi.getDataPzje()));
			customerFund.setFxbzFund(customerFund.getFxbzFund().add(peizi.getDataTzbzj()));	
			//TODO 付利息
			if(peizi.getDataJklxTotal()!=null && BigDecimal.ZERO.compareTo(peizi.getDataJklxTotal())!=0){
				usableAmount2 = customerFund.getUsebleFund().subtract(peizi.getDataJklxTotal());
				customerFund.setTotalFund(customerFund.getTotalFund().subtract(peizi.getDataJklxTotal()));
				customerFund.setUsebleFund(usableAmount2);
			}else{
				usableAmount2 = usableAmount1;
			}
			
			//2、插入记录  --投资保证金
			FundRecord fundRecord = buildFundRecord(peizi, userInfo, FundRecordFundTypeEnum.TZBZJ, usableAmount1);
			// --配资金额
			FundRecord fundRecord2 = buildFundRecord(peizi, userInfo, FundRecordFundTypeEnum.PZJE, usableAmount1);
			List<FundRecord> lstFundRecord = new ArrayList<FundRecord>();
			lstFundRecord.add(fundRecord);
			lstFundRecord.add(fundRecord2);
			// --利息
			if(peizi.getDataJklxTotal()!=null && BigDecimal.ZERO.compareTo(peizi.getDataJklxTotal())!=0){
				FundRecord fundRecord3 = buildFundRecord(peizi, userInfo, FundRecordFundTypeEnum.JKLX, usableAmount2);
				lstFundRecord.add(fundRecord3);
			}
			
			//设置配资状态
			peizi.setDataOperaStatus(OperaStatusEnum.PZZhong.getKey());
			
			zhifuService.payPeizi(lstFundRecord, customerFund, peizi);
		}
		
		model.addAttribute("peizi",peizi);
		model.addAttribute("usableFund", customerFund.getUsebleFund());
		
		return "web/peizi/dxp/dxpzlast";
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
	 * 低息配查看方案进度
	 * @return
	 */
	@RequestMapping("/lowScheduleCapital")
	public String  lowScheduleCapital(@RequestParam(value="dataId",required=true) Long dataId,Model model) {
		//如果dataId不为空，从数据库里面读取记录
		if(null!=dataId&&!dataId.equals(new Long(0))){
			Peizi peizi = iPeizi.findByPeiziId(dataId);
			model.addAttribute("peizi",peizi);					
		}		
		return "web/peizi/dxp/dxpzyanzi";
	}
	
	
	
	
	
}
