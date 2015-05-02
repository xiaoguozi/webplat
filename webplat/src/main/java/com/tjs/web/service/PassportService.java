package com.tjs.web.service;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.core.generic.GenericService;

/**
 * 用户 业务 接口
 * 
 * @author swpan
 * @since 2014年7月5日 上午11:53:33
 **/
public interface PassportService{
   
    long regUser(User user, UserInfo userInfo);
    
    boolean notExistUserName(String userName);

    String sendSmsCode(String userName);
    
    boolean resetPassword(String userName, String password);
}
