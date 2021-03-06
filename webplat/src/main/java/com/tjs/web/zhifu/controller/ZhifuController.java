package com.tjs.web.zhifu.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.zhifu.controller.CustbankCtrlModel;
import com.tjs.admin.zhifu.controller.CustomerFundCtrlModel;
import com.tjs.admin.zhifu.controller.FundRecordCtrlModel;
import com.tjs.admin.zhifu.controller.RechargeCtrlModel;
import com.tjs.admin.zhifu.controller.WithdrawCtrlModel;
import com.tjs.admin.zhifu.model.Area;
import com.tjs.admin.zhifu.model.Bank;
import com.tjs.admin.zhifu.model.Custbank;
import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.model.FundRecord;
import com.tjs.admin.zhifu.model.Recharge;
import com.tjs.admin.zhifu.model.Withdraw;
import com.tjs.admin.zhifu.service.IAreaBank;
import com.tjs.admin.zhifu.service.ICustbank;
import com.tjs.admin.zhifu.service.ICustomerFund;
import com.tjs.admin.zhifu.service.IFundRecord;
import com.tjs.admin.zhifu.service.IRecharge;
import com.tjs.admin.zhifu.service.IWithdraw;
import com.tjs.admin.zhifu.zfenum.AreaLevelEnum;
import com.tjs.admin.zhifu.zfenum.BankNameEnum;
import com.tjs.admin.zhifu.zfenum.CustBankCardFromEnum;
import com.tjs.admin.zhifu.zfenum.FundRecordFundTypeEnum;
import com.tjs.admin.zhifu.zfenum.RechargeFundTypeEnum;
import com.tjs.admin.zhifu.zfenum.RechargeStatusEnum;
import com.tjs.core.zhifu.Configuration;
import com.tjs.core.zhifu.DigestUtil;
import com.tjs.web.peizi.token.TokenConstants;
import com.tjs.web.peizi.token.TokenHandler;
import com.tjs.web.zhifu.service.IZhifuService;

@Controller
@RequestMapping(value = "/web/userCenter/zhifu")
public class ZhifuController {
	
	@Resource
	private IRecharge rechargeService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private UserInfoService userInfoService;
	
	@Resource
    private IZhifuService zhifuService;
	
	@Resource
	private ICustomerFund customerFundService;
	
	@Resource
	private IFundRecord fundRecordService;
	
	
	@Resource
	private ICustbank custbankService;
	
	@Resource
	private IAreaBank areaService;
	
	@Resource
	private IWithdraw withdrawService;
	
	@Autowired  
	private  HttpServletRequest request; 
	
	/** 充值流水前缀 */
	private static final String PREFIX = "TJS_";
	
	/** 点对点返回给易宝服务器  */
	private static final String SUCCESS = "success";
	
	private Logger logging = Logger.getLogger(ZhifuController.class);
	
	@RequestMapping("/enterCur")
    public String enterCur(Model model) {
		model.addAttribute("isLog", "true");
		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		CustomerFund customerFund = getCustomerFund(user.getId());
		
		model.addAttribute("totalFund", customerFund.getTotalFund());
		model.addAttribute("usableFund", customerFund.getUsebleFund());
		
		return "web/zhifu/enterCur"; 
	}
	
	@RequestMapping("/epay")
    public String epay(HttpServletRequest request,  ZhifuModel zhifuModel, Model model) {
		String rechargeAmount = zhifuModel.getRechargeAmount();
		String pdFrpId = zhifuModel.getPdFrpId();
		String callbackUrl = zhifuModel.getCallbackUrl();
		
		//插入充值记录
		Recharge recharge = new Recharge();
		recharge.setAmount(new BigDecimal(rechargeAmount));
		recharge.setLockId(1);
		insertRecharge(request, recharge, pdFrpId);
		
		String p0_Cmd           = "Buy";
		String p2_Order         = PREFIX + String.valueOf(recharge.getRechangeId());
		String p3_Amt           = rechargeAmount;
		String p4_Cur           = "CNY";
		String p5_Pid           = "taojinshan";
		String p6_Pcat          = "productcat";
		String p7_Pdesc         = "desc";
		String p8_Url           = callbackUrl;
		String p9_SAF           = "0";
		String pa_MP            = "";
		String pd_FrpId         = pdFrpId;
		String pm_Period        = "";
		String pn_Unit          = "";
		String pr_NeedResponse  = "1";

		String p1_MerId			= Configuration.getInstance().getValue("p1_MerId");
		String keyValue			= Configuration.getInstance().getValue("keyValue");
		String[] strArr			= {p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, 
									p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pm_Period, pn_Unit, pr_NeedResponse};
		String hmac				= DigestUtil.getHmac(strArr, keyValue);
		String requestURL		= Configuration.getInstance().getValue("requestURL");
		
		
		model.addAttribute("p0_Cmd", 	p0_Cmd);
		model.addAttribute("p1_MerId", 	p1_MerId);
		model.addAttribute("p2_Order",	p2_Order);
		model.addAttribute("p3_Amt",	p3_Amt);
		model.addAttribute("p4_Cur",	p4_Cur);
		model.addAttribute("p5_Pid",	p5_Pid);
		model.addAttribute("p6_Pcat",	p6_Pcat);
		model.addAttribute("p7_Pdesc",	p7_Pdesc);
		model.addAttribute("p8_Url",	p8_Url);
		model.addAttribute("p9_SAF",	p9_SAF);
		model.addAttribute("pa_MP",		pa_MP);
		model.addAttribute("pd_FrpId",	pd_FrpId);
		model.addAttribute("pm_Period",	pm_Period);
		model.addAttribute("pn_Unit",	pn_Unit);
		model.addAttribute("pr_NeedResponse",pr_NeedResponse);
		model.addAttribute("requestURL",requestURL);
		model.addAttribute("hmac",hmac);
		
		
		return "web/zhifu/pay";
	}
	
	@RequestMapping("/callback")
    public String callback(ZhifuModel zhifuModel, Model model) {
		
		//检查返回的参数和hmac是否被认为修改
		if(!checkHmac(zhifuModel)){
			return "web/zhifu/callback"; 
		}
		
		//1、充值流水
		String orderId = zhifuModel.getR6_Order();
		orderId = orderId.replace(PREFIX, "");
		Recharge recharge = rechargeService.findByRechargeId(Long.valueOf(orderId));
		//用户Id
		Long userId =recharge.getCustomerId();
		UserInfo userInfo = userInfoService.findUserInfoByUserId(userId);
		
		
		if(RechargeStatusEnum.SUCCESS.getIntegerKey().equals(recharge.getStatus())){
			CustomerFund customerFund = getCustomerFund(userId);
			model.addAttribute("amount", zhifuModel.getR3_Amt());
			model.addAttribute("totalAmount", customerFund.getTotalFund());
			return "web/zhifu/callback"; 
		}
		recharge.setStatus(RechargeStatusEnum.SUCCESS.getIntegerKey());
		recharge.setPaynumber(zhifuModel.getR2_TrxId());
		
		//2、个人账户信息
		CustomerFund customerFund = getCustomerFund(userId);
		BigDecimal usableAmount = null;
		if(customerFund.getUsebleFund()==null){
			usableAmount = new BigDecimal(zhifuModel.getR3_Amt());
		}else{
			usableAmount = customerFund.getUsebleFund().add(new BigDecimal(zhifuModel.getR3_Amt()));
		}
		customerFund.setUsebleFund(usableAmount);
		//设置总金额
		customerFund.setTotalFund(customerFund.getTotalFund()==null?new BigDecimal(zhifuModel.getR3_Amt()):
			customerFund.getTotalFund().add(new BigDecimal(zhifuModel.getR3_Amt())));
		
		//3、资金流水
		FundRecord fundRecord = new FundRecord();
		fundRecord.setAmount(new BigDecimal(zhifuModel.getR3_Amt()));
		fundRecord.setBusinessId(Long.valueOf(orderId));
		fundRecord.setCreateBy(userInfo.getName()==null?userInfo.getMobileNo():userInfo.getName());
		fundRecord.setCreateTime(Calendar.getInstance().getTime());
		fundRecord.setCustomerId(userId);
		fundRecord.setFundType(FundRecordFundTypeEnum.CZ.getKey());
		fundRecord.setRecordDesc(FundRecordFundTypeEnum.CZ.getValue());
		fundRecord.setUsableAmount(usableAmount);
		
		zhifuService.callbackUpdate(recharge, fundRecord, customerFund);
		
		model.addAttribute("amount", zhifuModel.getR3_Amt());
		model.addAttribute("totalAmount", customerFund.getTotalFund());
		
		return "web/zhifu/callback";
	}
	
	/** 充值流水 */
	@RequestMapping("/rechargeHistory")
    public String rechargeHistory(RechargeCtrlModel rechargeCtrlModel, Model model) {
		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		//查询充值流水
		rechargeCtrlModel.getRecharge().setCustomerId(user.getId());
		
    	//设置总条数
    	int totalCount =rechargeService.countRecharge(rechargeCtrlModel);
    	rechargeCtrlModel.setPageSize(8);
    	rechargeCtrlModel.setTotalCount(totalCount); 
    	
    	//判断请求页
        int totalPageNO = rechargeCtrlModel.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(rechargeCtrlModel.getPageNo()<1){//如果请求的页数小于1，设置成第一页
        	rechargeCtrlModel.setPageNo(1);
        } else if(rechargeCtrlModel.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	rechargeCtrlModel.setPageNo(totalPageNO);
        }else{
        	currentPageNo = rechargeCtrlModel.getPageNo();
        }
        rechargeCtrlModel.setPageNo(currentPageNo);
        rechargeCtrlModel.setSortField("create_time");
        rechargeCtrlModel.setSortType("desc");
        
		List<Recharge> lstRecharge = rechargeService.selectRecharge(rechargeCtrlModel);
		CustomerFund customerFund = getCustomerFund(user.getId());
		model.addAttribute("totalFund", customerFund.getTotalFund());
		model.addAttribute("usableFund", customerFund.getUsebleFund());
		model.addAttribute("lstRecharge", lstRecharge);
		model.addAttribute("isLog", "true");
		model.addAttribute("rechargeCtrlModel", rechargeCtrlModel);
		
		
		return "web/zhifu/rechargeHistory";
	}
	
	/** 资金流水 */
	@RequestMapping("/fundHistory")
    public String fundHistory(FundRecordCtrlModel fundRecordCtrlModel, Model model) {
		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		//查询充值流水
		fundRecordCtrlModel.getFundRecord().setCustomerId(user.getId());
		
    	//设置总条数
    	int totalCount =fundRecordService.countFundRecord(fundRecordCtrlModel);
    	fundRecordCtrlModel.setPageSize(8);
    	fundRecordCtrlModel.setTotalCount(totalCount); 
    	
    	//判断请求页
        int totalPageNO = fundRecordCtrlModel.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(fundRecordCtrlModel.getPageNo()<1){//如果请求的页数小于1，设置成第一页
        	fundRecordCtrlModel.setPageNo(1);
        } else if(fundRecordCtrlModel.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	fundRecordCtrlModel.setPageNo(totalPageNO);
        }else{
        	currentPageNo = fundRecordCtrlModel.getPageNo();
        }
        fundRecordCtrlModel.setPageNo(currentPageNo);
       // fundRecordCtrlModel.setSortField("create_time");
       // fundRecordCtrlModel.setSortType("desc");
        
		List<FundRecord> lstFundRecord = fundRecordService.selectFundRecord(fundRecordCtrlModel);
		CustomerFund customerFund = getCustomerFund(user.getId());
		model.addAttribute("totalFund", customerFund.getTotalFund());
		model.addAttribute("usableFund", customerFund.getUsebleFund());
		model.addAttribute("lstFundRecord", lstFundRecord);
		model.addAttribute("isLog", "true");
		model.addAttribute("fundRecordCtrlModel", fundRecordCtrlModel);
		
		
		return "web/zhifu/fundHistory";
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
	 * 插入充值流水
	 * @param request
	 * @param recharge
	 */
	private void insertRecharge(HttpServletRequest request, Recharge recharge, String pdFrpId){
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		
		recharge.setFundType(RechargeFundTypeEnum.YIBAOZHIFU.getKey());
		recharge.setCustomerId(user.getId());
		recharge.setStatus(0);
		recharge.setCreateTime(Calendar.getInstance().getTime());
		recharge.setCreateBy(userInfo.getName()==null?username:userInfo.getName());
		recharge.setRequestIp(request.getRemoteAddr());
		recharge.setRecordDesc(BankNameEnum.getValue(pdFrpId));
		
		rechargeService.insertRecharge(recharge);
	}
	
	
	
	
	/** 添加银行卡 */
	@RequestMapping("/addbank")
    public String addbank(Model model) {
		//获取登录信息
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		
		//获取添加的银行卡
		CustbankCtrlModel custbankCtrlModel = new CustbankCtrlModel();
		custbankCtrlModel.getCustbank().setCustomerId(user.getId());
		List<Custbank> lstCustbank = custbankService.selectCustbank(custbankCtrlModel);
		for(Custbank custbank:lstCustbank){
			custbank.setBankNo(this.getMaskCardNo(custbank.getBankNo()));
		}
		
		//获取省份
		Area area = new Area();
		area.setLevel(AreaLevelEnum.PROVINCE.getIntegerKey());
		List<Area> lstArea = areaService.selectAreaList(area);
		
		//获取银行
		List<Bank>lstBank = areaService.selectBankList(null);
		
		model.addAttribute("userInfo",userInfo);
		model.addAttribute("lstCustbank", lstCustbank);
		model.addAttribute("lstProvince", lstArea);
		model.addAttribute("lstBank", lstBank);
		
		String token = TokenHandler.generateGUID(request.getSession());
		model.addAttribute(TokenConstants.DEFAULT_TOKEN_NAME, token);
		return "web/zhifu/addbank";
	}
	
	
	/** 根据省份查询城市 */
	@RequestMapping("/queryCity")
	@ResponseBody
    public List<Area> queryCity(@RequestParam(value="provinceId") Integer id) {
		//获取登录信息
		Area area = new Area();
		area.setPid(id);
		area.setLevel(AreaLevelEnum.CITY.getIntegerKey());
		List<Area> lstCity = areaService.selectAreaList(area);				
        if(lstCity==null){
        	lstCity =  new ArrayList<Area>(0);
        }
		return lstCity;
	}
	
	/** 添加银行记录 */
	@RequestMapping("/addbankData")
    public String addbankData(Custbank custbank,Model model,Integer provinceId,Integer cityId) {
		//重复提交
		if(!TokenHandler.validToken(request)){
			return "redirect:/rest/web/userCenter/zhifu/addbank"; 
		}
		//获取登录信息
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		custbank.setCustomerId(user.getId());
		custbank.setCardFrom(CustBankCardFromEnum.PC.getIntegerKey());
		custbank.setIsQuick(0);
	    List<Bank> lstBank = areaService.selectBankList(custbank.getBankCode());	    
	    custbank.setBankName(lstBank.get(0).getBankName());
	    
	    Area area = new Area();
		area.setId(provinceId);
		List<Area> ListArea = areaService.selectAreaList(area);
		custbank.setBankProvince(ListArea.get(0).getNameCn());
		
		area.setId(cityId);
		ListArea = areaService.selectAreaList(area);
		custbank.setBankCity(ListArea.get(0).getNameCn());
		
	    custbank.setCreateTime(new Date());
	    custbankService.insertCustbank(custbank);		
		return "redirect:/rest/web/userCenter/zhifu/addbank";  
	}
	
	
	
	/** 添加银行记录 */
	@RequestMapping("/delBank")
    public String delBank(@RequestParam(value="dataId") long bankId) {
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		Custbank custBank =new Custbank();
		custBank.setBankId(bankId);
		custBank.setCustomerId(user.getId());
		custbankService.deleteCustbank(custBank);
		return "redirect:/rest/web/userCenter/zhifu/addbank";  
	}
	
	@RequestMapping("/withdrawIndex")
    public String withdrawIndex(Model model) {
		model.addAttribute("isLog", "true");
		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		CustomerFund customerFund = getCustomerFund(user.getId());
		model.addAttribute("usableFund", customerFund.getUsebleFund());
		
		//获取添加的银行卡
		CustbankCtrlModel custbankCtrlModel = new CustbankCtrlModel();
		custbankCtrlModel.getCustbank().setCustomerId(user.getId());
		List<Custbank> lstCustbank = custbankService.selectCustbank(custbankCtrlModel);
		
		model.addAttribute("lstCustbank", lstCustbank);
		if(lstCustbank==null || lstCustbank.size()==0){
			model.addAttribute("bankCount", "0");
		}else{
			for(Custbank bank : lstCustbank){
				bank.setBankNo(getMaskCardNo(bank.getBankNo()));
			}
		}
		return "web/zhifu/withdraw"; 
	}
	
	/**
	 * 提现
	 * @param model
	 * @return
	 */
	@RequestMapping("/withdraw")
    public String withdraw(HttpServletRequest request, WithdrawCtrlModel withdrawCtrlModel, Model model) {
		//model.addAttribute("isLog", "true");
		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		
		CustomerFund customerFund = getCustomerFund(user.getId());
		BigDecimal amount = withdrawCtrlModel.getWithdraw().getAmount();
		//如果传过来需提现的值大于可用余额，给用户提示，防止重复提交
		if(amount.compareTo(customerFund.getUsebleFund())==1){
			return "redirect:/rest/web/userCenter/zhifu/withdrawIndex";
		}
		
		
		//1、更新个人账户
		BigDecimal usableAmount = customerFund.getUsebleFund();
		customerFund.setUsebleFund(usableAmount.subtract(amount));
		customerFund.setDongjieFund(customerFund.getDongjieFund()==null?
				amount:customerFund.getDongjieFund().add(amount));
		
		//查询用户选中的银行
		Long userBankId = withdrawCtrlModel.getUserBankId();
		Custbank custbank = custbankService.findBybankId(userBankId);
		
		//2、插入提现流水
		Withdraw withdraw = new Withdraw();
		withdraw.setCustomerId(user.getId());
		//TODO
		withdraw.setBankCode(custbank.getBankCode());
		withdraw.setCardFrom(custbank.getCardFrom());
		withdraw.setCardNo(custbank.getBankNo());
		withdraw.setBankProvince(custbank.getBankProvince());
		withdraw.setBankcity(custbank.getBankCity());
		withdraw.setBankName(custbank.getBankName());
		withdraw.setAmount(amount);
		withdraw.setPoundageAmount(BigDecimal.ZERO);
		withdraw.setBranchName(custbank.getBranchName());
		withdraw.setRequestIp(request.getRemoteAddr());
		withdraw.setCreateTime(Calendar.getInstance().getTime());
		withdraw.setCreateBy(userInfo.getName()==null?username:userInfo.getName());
		withdraw.setStatus(0);
		withdraw.setLockId(1);
		
		
		//3、插入资金流水
		FundRecord fundRecord = new FundRecord();
		fundRecord.setAmount(amount);
		//fundRecord.setBusinessId();
		fundRecord.setCreateBy(userInfo.getName()==null?userInfo.getMobileNo():userInfo.getName());
		fundRecord.setCreateTime(Calendar.getInstance().getTime());
		fundRecord.setCustomerId(user.getId());
		fundRecord.setFundType(FundRecordFundTypeEnum.TXDJ.getKey());
		fundRecord.setRecordDesc(FundRecordFundTypeEnum.TXDJ.getValue());
		fundRecord.setUsableAmount(usableAmount);
		
		//提现操作
		zhifuService.withdraw(withdraw, fundRecord, customerFund);
		
		withdrawCtrlModel.getWithdraw().setCustomerId(user.getId());
		//设置总条数
    	int totalCount =withdrawService.countWithdraw(withdrawCtrlModel);
    	withdrawCtrlModel.setPageSize(8);
    	withdrawCtrlModel.setTotalCount(totalCount); 
    	
    	//判断请求页
        int totalPageNO = withdrawCtrlModel.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(withdrawCtrlModel.getPageNo()<1){//如果请求的页数小于1，设置成第一页
        	withdrawCtrlModel.setPageNo(1);
        } else if(withdrawCtrlModel.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	withdrawCtrlModel.setPageNo(totalPageNO);
        }else{
        	currentPageNo = withdrawCtrlModel.getPageNo();
        }
        withdrawCtrlModel.setPageNo(currentPageNo);
		
		
		List<Withdraw> lstWithdraw = withdrawService.selectWithdraw(withdrawCtrlModel);
		
		model.addAttribute("lstWithdraw", lstWithdraw);
		//model.addAttribute("totalFund", customerFund.getTotalFund());
		//model.addAttribute("usableFund", customerFund.getUsebleFund());
		model.addAttribute("withdrawCtrlModel", withdrawCtrlModel);
		//提现成功标志
		model.addAttribute("isSuccess","1");
		
		return "redirect:/rest/web/userCenter/zhifu/withdrawHistory"; 
	}
	
	/**
	 * 提现
	 * @param model
	 * @return
	 */
	@RequestMapping("/withdrawHistory")
    public String withdrawHistory(WithdrawCtrlModel withdrawCtrlModel, Model model) {
		model.addAttribute("isLog", "true");
		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		
		withdrawCtrlModel.getWithdraw().setCustomerId(user.getId());
		//设置总条数
    	int totalCount =withdrawService.countWithdraw(withdrawCtrlModel);
    	withdrawCtrlModel.setPageSize(8);
    	withdrawCtrlModel.setTotalCount(totalCount); 
    	
    	//判断请求页
        int totalPageNO = withdrawCtrlModel.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(withdrawCtrlModel.getPageNo()<1){//如果请求的页数小于1，设置成第一页
        	withdrawCtrlModel.setPageNo(1);
        } else if(withdrawCtrlModel.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	withdrawCtrlModel.setPageNo(totalPageNO);
        }else{
        	currentPageNo = withdrawCtrlModel.getPageNo();
        }
        withdrawCtrlModel.setPageNo(currentPageNo);
        withdrawCtrlModel.setSortField("create_time");
        withdrawCtrlModel.setSortType("desc");
		
		
		List<Withdraw> lstWithdraw = withdrawService.selectWithdraw(withdrawCtrlModel);
		
		model.addAttribute("lstWithdraw", lstWithdraw);
		model.addAttribute("withdrawCtrlModel", withdrawCtrlModel);
		
		return "web/zhifu/withdrawHistory"; 
	}
	
	private String getMaskCardNo(String cardNo){
		if(cardNo==null){
			return cardNo;
		}
		String strStart = cardNo.substring(0, 4);
		String strEnd = cardNo.substring(cardNo.length()-4);
		return strStart+"***********"+strEnd;
	}
	
	/**
	 * 比对hmac是否一致
	 * @param zhifuModel
	 * @return boolean
	 */
	private boolean checkHmac(ZhifuModel zhifuModel){
		 /** --回调结果参数-- */
		 String p1_MerId = formatString(zhifuModel.getP1_MerId());
		 String r0_Cmd = formatString(zhifuModel.getR0_Cmd());
		 String r1_Code = formatString(zhifuModel.getR1_Code());
		 String r2_TrxId = formatString(zhifuModel.getR2_TrxId());
		 String r3_Amt = formatString(zhifuModel.getR3_Amt());
		 String r4_Cur = formatString(zhifuModel.getR4_Cur());
		 String r5_Pid = formatString(zhifuModel.getR5_Pid());
		 String r6_Order = formatString(zhifuModel.getR6_Order());
		 String r7_Uid = formatString(zhifuModel.getR7_Uid());
		 String r8_MP = formatString(zhifuModel.getR8_MP());
		 String r9_BType = formatString(zhifuModel.getR9_BType());
		 
		 String keyValue = Configuration.getInstance().getValue("keyValue");
		 
		 String[] strArr = new String[]{p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur,
				 r5_Pid, r6_Order,  r7_Uid, r8_MP, r9_BType};
		 String hmac = DigestUtil.getHmac(strArr, keyValue);
		 if(hmac.equals(zhifuModel.getHmac())){
			 return true;
		 }
		 
		 return false;
	}
	
	private String formatString(String text) {
		return text == null ? "" : text.trim();
	}
	
}
