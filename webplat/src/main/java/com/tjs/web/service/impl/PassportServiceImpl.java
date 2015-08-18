package com.tjs.web.service.impl;

import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.dao.UserMapper;
import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.web.service.PassportService;
import com.ucpaas.restDemo.client.AbsRestClient;
import com.ucpaas.restDemo.client.JsonReqClient;

/**
 * 用户Service实现类
 *
 * @author StarZou
 * @since 2014年7月5日 上午11:54:24
 */
@Service
public class PassportServiceImpl implements PassportService {

    @Resource
    private UserService userService;

    @Resource
    private UserInfoService userInfoService;
    
    @Resource
    private UserMapper userMapper;
    
    @Override
    public long regUser(User user, UserInfo userInfo) {
    	userService.insert(user);
    	Long userId = user.getId();
    	if(userId>0){
    		userInfo.setUserId(userId);
    		userInfoService.insert(userInfo);
    	}
    	
    	return userId;
    }

    @Override
	public boolean notExistUserName(String userName){
    	boolean isValid = true;
    	int count = userMapper.selectCountByUserName(userName);
    	if(count >0){
    		isValid = false;
    	}
    	
    	return isValid;
    } 

    @Override
	public boolean resetPassword(String userName, String password){
    	boolean isValid = true;

		// 重置密码
		try {
			User user = userService.selectByUsername(userName);
			user.setPassword(password);
			userService.update(user);
		} catch (Exception e) {
			isValid = false;
		}

    	return isValid;
    } 
    
    @Override
	public String sendSmsCode(String userName){
    	
    	//生产随机验证码
    	int max=9999;
        int min=1000;
        Random random = new Random();
        int code = random.nextInt(max)%(max-min+1) + min;
        
        String smsCode = ""+code;
    	
    //	userName = "15099934336";
    	
    	//TODO 发送短信验证码
    	
    	String accountSid="6f97d5e6c0510b7605a7470c9316efa9";
		String authToken="65fcd6178dc9c92b699ee0a0b587cd9f";
		String appId="e054516603424d1c9e85c1c5be001afc";
		String templateId="6736";
		String to=userName;
		String para=smsCode;
		try {
			AbsRestClient restClient = new JsonReqClient();
			String result=restClient.templateSMS(accountSid, authToken, appId, templateId, to, para);
			//System.out.println("Response content is: " + result);
		} catch (Exception e) {
			// TODO: handle exception
			//e.printStackTrace();
		}
		
	//	smsCode = "1234";
    	
    	return smsCode;
    }

	@Override
	public void sendMovieCode(String userName, String password, String movieCode) {
    	
    	String accountSid="6f97d5e6c0510b7605a7470c9316efa9";
		String authToken="65fcd6178dc9c92b699ee0a0b587cd9f";
		String appId="e054516603424d1c9e85c1c5be001afc";
		String templateId="11644";
		String to=userName;
		String para=password+","+movieCode;
		try {
			AbsRestClient restClient = new JsonReqClient();
			String result=restClient.templateSMS(accountSid, authToken, appId, templateId, to, para);
			//System.out.println("Response content is: " + result);
		} catch (Exception e) {
			// TODO: handle exception
			//e.printStackTrace();
		}
	
    	
    	return;
	}
    
}
