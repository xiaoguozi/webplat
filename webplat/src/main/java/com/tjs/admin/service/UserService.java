package com.tjs.admin.service;

import java.util.List;

import com.tjs.admin.controller.UserCtrlModel;
import com.tjs.admin.model.User;
import com.tjs.core.generic.GenericService;

/**
 * 用户 业务 接口
 * 
 * @author StarZou
 * @since 2014年7月5日 上午11:53:33
 **/
public interface UserService extends GenericService<User, Long> {

    /**
     * 用户验证
     * 
     * @param user
     * @return
     */
    User authentication(User user);

    /**
     * 根据用户名查询用户
     * 
     * @param username
     * @return
     */
    User selectByUsername(String username);
    
    Integer selectListCount(UserCtrlModel userCtrlModel);
    
    
    List<User> selectUserList(UserCtrlModel userCtrlModel);
    
    /**
     * 查询我推荐的用户数量
     * @param userCtrlModel
     * @return
     */
    Integer selectMyRmdUserCount(UserCtrlModel userCtrlModel);
    
    /**
     * 查询我推荐的用户
     * @param userCtrlModel
     * @return
     */
    List<User> selectMyRmdUserList(UserCtrlModel userCtrlModel);
    
}
