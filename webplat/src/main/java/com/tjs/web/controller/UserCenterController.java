package com.tjs.web.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.ddq.webservice.identify.IdentifierWebService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.nciic.www.IdentifierServiceClient.CheckResponse;

import com.alibaba.fastjson.JSON;
import com.tjs.admin.controller.UserCtrlModel;
import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.system.utils.FileUtil;
import com.tjs.admin.utils.StringUtils;
import com.tjs.admin.zhifu.controller.CustomerFundCtrlModel;
import com.tjs.admin.zhifu.controller.RechargeCtrlModel;
import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.model.Recharge;
import com.tjs.admin.zhifu.service.ICustomerFund;
import com.tjs.web.constants.PeiZiConstants;
import com.tjs.web.model.CustIdentity;
import com.tjs.web.service.CustIdentityService;
import com.tjs.web.utils.QRCodeUtils;

/**
 * 用户控制器
 * 
 * @author StarZou
 * @since 2014年5月28日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/web/userCenter")
public class UserCenterController {

    @Resource
    private UserService userService;
    
    @Resource
    private UserInfoService userInfoService;
    
    @Resource
    private CustIdentityService custIdentityService;
    
    @Resource
	private ICustomerFund customerFundService;
    
    @RequestMapping("/index")
    public String index(Model model) {
    	model.addAttribute("isLog", "true");
    	//查询手机号
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		CustomerFund customerFund = getCustomerFund(user.getId()); 
		
		model.addAttribute("userId", userInfo.getUserId());
		model.addAttribute("phone", username);
		model.addAttribute("name", userInfo.getName());
		model.addAttribute("certId", userInfo.getCertId());
		model.addAttribute("qq", userInfo.getQqNo());
		model.addAttribute("email", userInfo.getEmail());
		model.addAttribute("customerFund", customerFund);
		model.addAttribute("isValidate", userInfo.getIsValidate());
		
        return "web/userCenter/userInfoModify";
    }
    
    @RequestMapping("/userModify")
    public String userModify(Model model) {
    	model.addAttribute("isLog", "true");
    	//查询手机号
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		CustomerFund customerFund = getCustomerFund(user.getId()); 
		
		model.addAttribute("userId", userInfo.getUserId());
		model.addAttribute("phone", username);
		model.addAttribute("name", userInfo.getName());
		model.addAttribute("certId", userInfo.getCertId());
		model.addAttribute("qq", userInfo.getQqNo());
		model.addAttribute("email", userInfo.getEmail());
		model.addAttribute("customerFund", customerFund);
		model.addAttribute("isValidate", userInfo.getIsValidate());
		
        return "web/userCenter/userInfoModify";
    }
    
    @RequestMapping("/saveUserInfo")
    public String saveUserInfo(UserCenterCtrlModel userCenterCtrlModel, Model model) {
    	model.addAttribute("isLog", "true");
    	//查询手机号
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		
		if(userInfo.getIsValidate()!=1){
			userInfo.setName(userCenterCtrlModel.getUserInfo().getName());
			userInfo.setCertId(userCenterCtrlModel.getUserInfo().getCertId());
		}
		
		userInfo.setQqNo(userCenterCtrlModel.getUserInfo().getQqNo());
		userInfo.setEmail(userCenterCtrlModel.getUserInfo().getEmail());
		userInfoService.updateUserInfo(userInfo);
    	
		model.addAttribute("userId", userInfo.getUserId());
		model.addAttribute("phone", username);
		model.addAttribute("name", userInfo.getName());
		model.addAttribute("certId", userInfo.getCertId());
		model.addAttribute("qq", userInfo.getQqNo());
		model.addAttribute("email", userInfo.getEmail());
		model.addAttribute("isValidate", userInfo.getIsValidate());
		model.addAttribute("changeSucess", true);
		
        return "web/userCenter/userInfoModify";
    }
    
    @RequestMapping("/userModifyData")
    @ResponseBody
    public boolean userModifyData(@RequestParam(value="password") String  password,@RequestParam(value="newpassword") String  newpassword) {    	
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user= userService.selectByUsername(username);
		if(password.equalsIgnoreCase(user.getPassword())){
			user.setPassword(newpassword);
			userService.update(user);
			return true;
		}else{
			return false;
		}		
    }
    
    @RequestMapping("/valiadPassword")
    @ResponseBody
    public boolean valiadPassword(@RequestParam(value="password") String  password) {
    	boolean isValid = false;   
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user= userService.selectByUsername(username);
		if(password.equalsIgnoreCase(user.getPassword())){
			isValid = true;
		}
        return isValid;
    }
    
    
    @RequestMapping("/validateNameCertId")
    @ResponseBody
    public String validateNameCertId(@RequestParam(value="name") String  name, 
    		@RequestParam(value="certId") String  certId,
    		@RequestParam(value="userId") Long  userId) {
		String result = "false";

		if (StringUtils.isBlank(name) || StringUtils.isBlank(certId)) {
			return result;
		}
		
		//保存用户提交的姓名和身份证号
		UserInfo userInfoTemp = userInfoService.findUserInfoByUserId(userId);
		userInfoTemp.setName(name);
		userInfoTemp.setCertId(certId);
		userInfoService.updateUserInfo(userInfoTemp);
		
		
		//TODO 实名认证流程：
		// 1）、姓名和身份证号已经被实名验证并且有通过了的记录
		// 2）、姓名和身份证号已经被实名验证并且有两次都没有通过的记录
		// 3)、 数据库中已经被验证过一次但没有通过 或者 无记录，此时需要去调用身份证接口
		// 	 i、验证通过，更新t_user_info和t_cust_identity
		//	 ii、未验证通过，往t_cust_identity新增记录
		
		CustIdentity tempCustIdentity = new CustIdentity();
		tempCustIdentity.setRealName(name);
		tempCustIdentity.setCardNo(certId);
		List<CustIdentity> lstResult = custIdentityService.query(tempCustIdentity);
		//是否已经通过了验证
		boolean isChecked = false;
		for(CustIdentity custIdentity : lstResult){
			if(custIdentity.getStatus()==1){
				isChecked = true;
				result = PeiZiConstants.VALIDATE_RESULT_EXIST;
			}
		}
		
		if(isChecked){
			return result;
		}else{
			if(lstResult.size()>=2){
				return PeiZiConstants.VALIDATE_RESULT_MAN;
			}else{
				//调用接口
				CheckResponse response = new CheckResponse();
				// 测试--跳过验证码
				try {
					String value = IdentifierWebService.simpleCheckByJson(certId, name, "tjs_admin", "b8DvR2jl");
					response = JSON.parseObject(value, CheckResponse.class);
					if (response.getResponseCode() == 100) {
						if ("一致".equals(response.getIdentifier().getResult())) {
							result = "true";
							//添加记录
							tempCustIdentity.setCustomerId(userId);
							tempCustIdentity.setIdentifyType(0);
							tempCustIdentity.setCreateTime(Calendar.getInstance().getTime());
							tempCustIdentity.setValidType(0);
							tempCustIdentity.setStatus(1);
							UserInfo userInfo = userInfoService.findUserInfoByUserId(userId);
							userInfo.setIsValidate(1);
							
							custIdentityService.validateCustIdentity(tempCustIdentity, userInfo);
						} else {
							result = PeiZiConstants.VALIDATE_RESULT_NOT_SAME;
							//添加记录
							tempCustIdentity.setCustomerId(userId);
							tempCustIdentity.setIdentifyType(0);
							tempCustIdentity.setCreateTime(Calendar.getInstance().getTime());
							tempCustIdentity.setValidType(0);
							tempCustIdentity.setStatus(2);
							
							custIdentityService.validateCustIdentity(tempCustIdentity, null);
						}
					}else{
						throw new Exception(response.getResponseCode() + "");
					}
				} catch (Exception e) {
					if ("-71".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_71;
					} else if ("-53".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_53;
					} else if ("-72".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_72;
					} else if ("-31".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_31;
					} else if ("-60".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_60;
					} else if ("-90".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_90;
					} else {

					}
				}
				
			}
		}
		
		return result;
	}
    
  
    @RequestMapping("/valiadCertId")
    @ResponseBody
    public String valiadCertId(@RequestParam(value="name") String  name, 
    		@RequestParam(value="certId") String  certId,
    		@RequestParam(value="userId") Long  userId) {
		String result = "false";

		if (StringUtils.isBlank(name) || StringUtils.isBlank(certId)) {
			return result;
		}
		
		//需要先查询数据中的姓名和身份证号码，如果不一致要提示用户先保存后认证
		UserInfo userInfoTemp = userInfoService.findUserInfoByUserId(userId);
		if(!name.equals(userInfoTemp.getName()) || !certId.equals(userInfoTemp.getCertId())){
			result = "-1";
			return  result;
		}
		
		//TODO 实名认证流程：
		// 1）、姓名和身份证号已经被实名验证并且有通过了的记录
		// 2）、姓名和身份证号已经被实名验证并且有两次都没有通过的记录
		// 3)、 数据库中已经被验证过一次但没有通过 或者 无记录，此时需要去调用身份证接口
		// 	 i、验证通过，更新t_user_info和t_cust_identity
		//	 ii、未验证通过，往t_cust_identity新增记录
		
		CustIdentity tempCustIdentity = new CustIdentity();
		tempCustIdentity.setRealName(name);
		tempCustIdentity.setCardNo(certId);
		List<CustIdentity> lstResult = custIdentityService.query(tempCustIdentity);
		//是否已经通过了验证
		boolean isChecked = false;
		for(CustIdentity custIdentity : lstResult){
			if(custIdentity.getStatus()==1){
				isChecked = true;
				result = PeiZiConstants.VALIDATE_RESULT_EXIST;
			}
		}
		
		if(isChecked){
			return result;
		}else{
			if(lstResult.size()>=2){
				return PeiZiConstants.VALIDATE_RESULT_MAN;
			}else{
				//调用接口
				CheckResponse response = new CheckResponse();
				// 测试--跳过验证码
				try {
					String value = IdentifierWebService.simpleCheckByJson(certId, name,
							"tjs_admin", "b8DvR2jl");
					response = JSON.parseObject(value, CheckResponse.class);
					if (response.getResponseCode() == 100) {
						if ("一致".equals(response.getIdentifier().getResult())) {
							result = "true";
							//添加记录
							tempCustIdentity.setCustomerId(userId);
							tempCustIdentity.setIdentifyType(0);
							tempCustIdentity.setCreateTime(Calendar.getInstance().getTime());
							tempCustIdentity.setValidType(0);
							tempCustIdentity.setStatus(1);
							UserInfo userInfo = userInfoService.findUserInfoByUserId(userId);
							userInfo.setIsValidate(1);
							
							custIdentityService.validateCustIdentity(tempCustIdentity, userInfo);
						} else {
							result = PeiZiConstants.VALIDATE_RESULT_NOT_SAME;
							//添加记录
							tempCustIdentity.setCustomerId(userId);
							tempCustIdentity.setIdentifyType(0);
							tempCustIdentity.setCreateTime(Calendar.getInstance().getTime());
							tempCustIdentity.setValidType(0);
							tempCustIdentity.setStatus(2);
							
							custIdentityService.validateCustIdentity(tempCustIdentity, null);
						}
					}else{
						throw new Exception(response.getResponseCode() + "");
					}
				} catch (Exception e) {
					if ("-71".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_71;
					} else if ("-53".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_53;
					} else if ("-72".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_72;
					} else if ("-31".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_31;
					} else if ("-60".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_60;
					} else if ("-90".equals(e.getMessage())) {
						result = PeiZiConstants.VALIDATE_RESULT_90;
					} else {

					}
				}
				
			}
		}
		
		return result;
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
	 * 我的推荐
	 * @param model
	 * @return
	 */
	@RequestMapping("/myRecommend")
    public String myRecommend(UserCtrlModel userCtrlModel, Model model) {
		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		userCtrlModel.setUser(new User());
		userCtrlModel.getUser().setParent(user.getId());
		
    	//设置总条数
    	int totalCount =userService.selectMyRmdUserCount(userCtrlModel);
    	userCtrlModel.setPageSize(8);
    	userCtrlModel.setTotalCount(totalCount); 
    	
    	//判断请求页
        int totalPageNO = userCtrlModel.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(userCtrlModel.getPageNo()<1){//如果请求的页数小于1，设置成第一页
        	userCtrlModel.setPageNo(1);
        } else if(userCtrlModel.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	userCtrlModel.setPageNo(totalPageNO);
        }else{
        	currentPageNo = userCtrlModel.getPageNo();
        }
        userCtrlModel.setPageNo(currentPageNo);
        userCtrlModel.setSortField("create_time");
        userCtrlModel.setSortType("desc");
        
		List<User> lstUser = userService.selectMyRmdUserList(userCtrlModel);
		for(User userVO : lstUser){
			userVO.setUsername(formatMobileNo(userVO.getUsername()));
		}
		
		model.addAttribute("userCtrlModel", userCtrlModel);
		model.addAttribute("lstUser", lstUser);
		
		return "web/userCenter/myRecommend";
	}
	
	/**
	 * 生成二维码
	 * 
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/rerfererQRCode")
	public void getQRCode(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ServletOutputStream ot = response.getOutputStream();
		String contextPath = getContextPath(request);
		String url = contextPath + "rest/web/passport/mreg?regFrom=6&parent=" + id;
		String ttString = UserCenterController.class.getResource("/").getPath();
		String p = ttString.substring(0,
				ttString.indexOf("/WEB-INF/classes"));
		String logoUrl = p+File.separator + "assets/img/wx/logo_share.jpg";
		QRCodeUtils.generateQRCode(ot, url, logoUrl, 300);
		ot.flush();
		ot.close();
	}
	
	private String getContextPath(HttpServletRequest request){
//		String path = request.getContextPath();
//		String basePath = request.getScheme() + "://"
//				+ request.getServerName() + ":" + request.getServerPort()
//				+ path + "/";
//		return basePath;
		return "http://www.taojinshan.com.cn/";
	}
	
	private String formatMobileNo(String mobileNo){
		if(StringUtils.isBlank(mobileNo)){
			return mobileNo;
		}
		String mobileNoMask = mobileNo.substring(0,3)+"****"+mobileNo.substring(7);
		return mobileNoMask;
	}

}
 