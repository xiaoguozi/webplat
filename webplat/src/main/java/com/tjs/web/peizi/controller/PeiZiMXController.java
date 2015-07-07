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
import com.tjs.web.constants.PeiZiConstants;
import com.tjs.web.peizi.model.FreePeiziDetailVO;
import com.tjs.web.peizi.model.UserInfoExtendVO;
import com.tjs.web.peizi.service.IPeiZiIndexService;
import com.tjs.web.zhifu.service.IZhifuService;

/**
 * 免息赔控制器
 * 
 * @author dyj
 * @since 2015年6月6日
 *
 **/
@Controller
@RequestMapping(value = "/web/peizi/mxp")
public class PeiZiMXController {

	@Resource
	IPeizi iPeizi;
	@Resource
	IPeiziRule iPeiziRule;
	@Resource
	private IPeiZiIndexService iPeiZiIndexService;
	@Resource
	private UserService userService;
	@Resource
    private UserInfoService userInfoService;
	@Resource
	private ICustomerFund customerFundService;
	@Resource
	private IZhifuService zhifuService;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * 免息配第一步
	 * 
	 * @return
	 */
	@RequestMapping("/monthCapital")
	public String dayCapital(Peizi peizio, Model model) {
		
		// 获取免息配的配资规则
		PeiziRuleCtrlModel peiziRuleCtrlModel = new PeiziRuleCtrlModel();
		peiziRuleCtrlModel.getPeiziRule().setRuleType(
				PeiziTypeEnum.MXPEIZI.getKey());

		List<PeiziRule> lstPeiziRule = iPeiziRule
				.selectPeiziRule(peiziRuleCtrlModel);
		if (lstPeiziRule == null || lstPeiziRule.size() == 0) {
			throw new RuntimeException("免息配资规则没有找到");
		}
		PeiziRule peiziRule = lstPeiziRule.get(0);
		model.addAttribute("peiziRule",peiziRule);
		if(peiziRule.getRuleEnable().equals("20")){
			return "web/peizi/mxp/mxpeizi";
		}
		
		Peizi peizi = new Peizi();
		// 规则信息
		peizi.setDataId(peizio.getDataId());
		peizi.setDataType(PeiziTypeEnum.MXPEIZI.getKey());
		peizi.setDataTypeSylx("10");
		peizi.setDataStep("1");
		//收益类型
		

		// 用户点击上一步选择信息
		peizi.setDataJyksDate(StringUtils.isBlank(peizio.getDataJyksDate()) ? "2"
				: peizio.getDataJyksDate());
		Integer dataZjsyqx = ((null == peizio.getDataZjsyqx() || new Integer(0)
				.equals(peizio.getDataZjsyqx())) ? 1 : peizio.getDataZjsyqx());
		peizi.setDataZjsyqx(dataZjsyqx);
		model.addAttribute("peizi", peizi);
		model.addAttribute("peiziRule", peiziRule);
		
		//查询当天免费配活动是否有名额
		PZIndexCtrlModel pzIndexCtrlModel = new PZIndexCtrlModel();
		pzIndexCtrlModel.setDateString(sdf.format(Calendar.getInstance().getTime()));
		pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MXPEIZI.getIntegerKey());
		List<FreePeiziDetailVO> lstPZVO = iPeiZiIndexService.getFreePeiziDetailList(pzIndexCtrlModel);
		if(lstPZVO!=null 
				&& lstPZVO.size()>0){
			if(lstPZVO.get(0).getPeiziCount()>=PeiZiConstants.FREE_CHARGE_COUNT){
				model.addAttribute("result", PeiZiConstants.RESULT_NO_AMOUNT);
				return "web/peizi/mxp/mxpeizi";
			}else{
				Subject subject = SecurityUtils.getSubject();
				String username = (String)subject.getPrincipal();
				if(username!=null){
					User user = userService.selectByUsername(username);
					pzIndexCtrlModel.setUserId(user.getId());
					pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MXPEIZI.getIntegerKey());
					List<UserInfoExtendVO> lstUser = iPeiZiIndexService.getUserInfoExtendList(pzIndexCtrlModel);
					if(lstUser!=null 
							&& lstUser.size()>0){
						UserInfoExtendVO userInfoExtendVO = lstUser.get(0);
						if(userInfoExtendVO.getPeiziType()==PeiziTypeEnum.MXPEIZI.getIntegerKey()
								&& userInfoExtendVO.getIsOwnResource()==0){
							model.addAttribute("result", PeiZiConstants.RESULT_ALREADY_USED);
							return "web/peizi/mxp/mxpeizi";
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
				pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MXPEIZI.getIntegerKey());
				List<UserInfoExtendVO> lstUser = iPeiZiIndexService.getUserInfoExtendList(pzIndexCtrlModel);
				if(lstUser!=null 
						&& lstUser.size()>0){
					UserInfoExtendVO userInfoExtendVO = lstUser.get(0);
					if(userInfoExtendVO.getPeiziType()==PeiziTypeEnum.MXPEIZI.getIntegerKey()
							&& userInfoExtendVO.getIsOwnResource()==0){
						model.addAttribute("result", PeiZiConstants.RESULT_ALREADY_USED);
						return "web/peizi/mxp/mxpeizi";
					}
				}
			}
		}
		

		return "web/peizi/mxp/mxpeizi";
	}

	/**
	 * 免息配下一步
	 * 
	 * @return
	 */
	@RequestMapping("/monthNextCapital")
	public String monthNextCapital(Peizi peizi, Model model) {
		if (BigDecimalUtils.isNull(peizi.getDataZcpzj())
				|| BigDecimalUtils.isNull(peizi.getDataTzbzj())) {
			return "redirect:/rest/web/peizi/mxp/monthCapital";
		}
		
		//判断用户实名认证
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		if(username!=null){
			User user = userService.selectByUsername(username);
			UserInfo userInfoTemp = userInfoService.findUserInfoByUserId(user.getId());
			if(userInfoTemp.getIsValidate()!=1){
				//实名认证
				model.addAttribute("result", "-3");
				return "web/peizi/mxp/mxpeizi";
			}
		}
		

		PZIndexCtrlModel pzIndexCtrlModel = new PZIndexCtrlModel();
		pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MXPEIZI.getIntegerKey());
		pzIndexCtrlModel.setDateString(sdf.format(Calendar.getInstance().getTime()));
		int result = iPeiZiIndexService.checkFreePeiZiIsValid(pzIndexCtrlModel);
		if(PeiZiConstants.RESULT_ALREADY_USED==result){
			model.addAttribute("result", "您已经参加过该活动");
			return "web/peizi/mxp/mxpeizi";
		}else if(PeiZiConstants.RESULT_NO_AMOUNT==result){
			model.addAttribute("result", "名额已满");
			return "web/peizi/mxp/mxpeizi";
		}
		
		peizi.setDataStep("2");
		peizi.setDataPzje(BigDecimalUtils.subtract(peizi.getDataZcpzj(),
				peizi.getDataTzbzj()));
		peizi.setZfzje(BigDecimalUtils.add(peizi.getDataTzbzj(),
				peizi.getDataJklxTotal()));
		peizi.setZfglf(BigDecimalUtils.div(
				BigDecimalUtils.multiply(peizi.getDataZfglf(),
						peizi.getDataZcpzj()), new BigDecimal(10000)));
		return "web/peizi/mxp/mxpznext";
	}
	
	
	
	

	/**
	 * 重新选择配资方案
	 * 
	 * @return
	 */
	@RequestMapping("/monthFirstCapital")
	public String monthFirstCapital(Peizi peizi, Model model) {
		peizi.setDataStep("1");
		peizi = new Peizi();
		model.addAttribute("peizi", peizi);
		return "web/peizi/mxp/mxpeizi";
	}

	/**
	 * 免息配最后一步
	 * 
	 * @return
	 */
	@RequestMapping("/monthLastCapital")
	public String monthLastCapital(Peizi peizi, Model model) {
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		
		if (BigDecimalUtils.isNull(peizi.getDataZcpzj())
				|| BigDecimalUtils.isNull(peizi.getDataTzbzj()) 
				|| username==null) {
			return "redirect:/rest/web/peizi/mxp/monthCapital";
		}
		
		//1、将用户能使用资源设置为0
		PZIndexCtrlModel pzIndexCtrlModel = new PZIndexCtrlModel();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		pzIndexCtrlModel.setUserId(user.getId());
		pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MXPEIZI.getIntegerKey());
		List<UserInfoExtendVO> lstUser = iPeiZiIndexService.getUserInfoExtendList(pzIndexCtrlModel);
		if(lstUser!=null && lstUser.size()>0){
			UserInfoExtendVO userInfoExtendVO = lstUser.get(0);
			if(userInfoExtendVO.getIsOwnResource()!=PeiZiConstants.IS_OWN_RESOURCE){
				model.addAttribute("result", PeiZiConstants.RESULT_ALREADY_USED);
				return "web/peizi/mxp/mxpeizi";
			}else{
				//1、更新状态并产生订单
				userInfoExtendVO.setIsOwnResource(0);
				userInfoExtendVO.setPhone(username);
				
				peizi.setDataStep("3");
				peizi.setDataOperaStatus("10");// 正在验资中
				peizi.setDataUserId(user.getId());
				peizi.setDataUserName(userInfo==null?"":userInfo.getName());
				peizi.setDataUserTel(username);
				peizi.setDataOperaStatus(OperaStatusEnum.PZPay.getKey());
				
				iPeiZiIndexService.createFreeChargePeiziOrder(userInfoExtendVO, peizi);
			}
		}
		
		//账户信息
		CustomerFund customerFund = getCustomerFund(user.getId());
		
		model.addAttribute("customerFund", customerFund);
		model.addAttribute("peizi", peizi);
		return "web/peizi/mxp/mxpzpay";
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
		peizi = iPeizi.findByPeiziId(peizi.getDataId());
		//账户信息
		CustomerFund customerFund = getCustomerFund(user.getId());
		
		model.addAttribute("customerFund", customerFund);
		model.addAttribute("peizi", peizi);
		return "web/peizi/mxp/mxpzpay";
	}
	
	
	/**
	 * 免息配付款
	 * 
	 * @return
	 */
	@RequestMapping("/monthPay")
	public String monthPay(PeiziCtrlModel peiziCtrlModel, Model model) {
		Peizi peizi = peiziCtrlModel.getPeizi();
		if (BigDecimalUtils.isNull(peizi.getDataTzbzj())) {
			return "redirect:/rest/web/peizi/mxp/monthCapital";
		}
		//从数据库中读取
		peizi = iPeizi.findByPeiziId(peizi.getDataId());
		
		//判断用户实名认证
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		
		CustomerFund customerFund = getCustomerFund(user.getId());
		if(customerFund.getUsebleFund().compareTo(peizi.getDataTzbzj())!=-1){
			//1、修改保证金
			customerFund.setUsebleFund(customerFund.getUsebleFund().subtract(peizi.getDataTzbzj()));
			customerFund.setPeiziFund(customerFund.getPeiziFund().add(peizi.getDataPzje()));
			customerFund.setFxbzFund(customerFund.getFxbzFund().add(peizi.getDataTzbzj()));	
			//TODO 增加利息
			
			//2、插入记录
			FundRecord fundRecord = new FundRecord();
			fundRecord.setAmount(peizi.getDataTzbzj());
			fundRecord.setBusinessId(peizi.getDataId());
			fundRecord.setCreateBy(userInfo.getName()==null?userInfo.getMobileNo():userInfo.getName());
			fundRecord.setCreateTime(Calendar.getInstance().getTime());
			fundRecord.setCustomerId(user.getId());
			fundRecord.setFundType(FundRecordFundTypeEnum.TZBZJ.getKey());
			fundRecord.setRecordDesc(FundRecordFundTypeEnum.TZBZJ.getValue());
			fundRecord.setUsableAmount(customerFund.getUsebleFund());
			
			FundRecord fundRecord2 = new FundRecord();
			fundRecord2.setAmount(peizi.getDataTzbzj());
			fundRecord2.setBusinessId(peizi.getDataId());
			fundRecord2.setCreateBy(userInfo.getName()==null?userInfo.getMobileNo():userInfo.getName());
			fundRecord2.setCreateTime(Calendar.getInstance().getTime());
			fundRecord2.setCustomerId(user.getId());
			fundRecord2.setFundType(FundRecordFundTypeEnum.PZJE.getKey());
			fundRecord2.setRecordDesc(FundRecordFundTypeEnum.PZJE.getValue());
			fundRecord2.setUsableAmount(customerFund.getUsebleFund());
			
			//TODO 利息
			List<FundRecord> lstFundRecord = new ArrayList<FundRecord>();
			lstFundRecord.add(fundRecord);
			lstFundRecord.add(fundRecord2);
			
			zhifuService.payPeizi(lstFundRecord, customerFund, peizi);
		}
		
		
		model.addAttribute("usableFund", customerFund.getUsebleFund());
		
		return "web/peizi/mxp/mxpzlast";
	}
	

	/**
	 * 天天配查看方案进度
	 * 
	 * @return
	 */
	@RequestMapping("/monthScheduleCapital")
	public String monthScheduleCapital(
			@RequestParam(value = "dataId", required = true) Long dataId,
			Model model) {
		// 如果dataId不为空，从数据库里面读取记录
		if (null != dataId && !dataId.equals(new Long(0))) {
			Peizi peizi = iPeizi.findByPeiziId(dataId);
			model.addAttribute("peizi", peizi);
		}
		return "web/peizi/mxp/mxpzyanzi";
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
	
}
