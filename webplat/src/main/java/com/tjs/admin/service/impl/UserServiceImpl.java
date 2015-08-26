package com.tjs.admin.service.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.controller.UserCtrlModel;
import com.tjs.admin.dao.UserMapper;
import com.tjs.admin.model.User;
import com.tjs.admin.model.UserExample;
import com.tjs.admin.service.UserService;
import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.service.ICustomerFund;
import com.tjs.core.generic.GenericDao;
import com.tjs.core.generic.GenericServiceImpl;

/**
 * 用户Service实现类
 *
 * @author StarZou
 * @since 2014年7月5日 上午11:54:24
 */
@Service
public class UserServiceImpl extends GenericServiceImpl<User, Long> implements UserService {

    @Resource
    private UserMapper userMapper;
    
    
    @Resource
    private ICustomerFund customerService;

    @Override
    public int insert(User model) {
    	int iResult = userMapper.insertSelective(model);
    	if(model.getId()>0){
    		CustomerFund customerFund = new CustomerFund();
    		customerFund.setCustomerId(model.getId());
    		customerFund.setDongjieFund(BigDecimal.ZERO);
    		customerFund.setFxbzFund(BigDecimal.ZERO);
    		customerFund.setPeiziFund(BigDecimal.ZERO);
    		customerFund.setTotalFund(BigDecimal.ZERO);
    		customerFund.setUsebleFund(BigDecimal.ZERO);
    		customerFund.setLockId(1);
    		customerService.insertCustomerFund(customerFund);
    		
    	}
        return iResult;
    }

    @Override
    public int update(User model) {
        return userMapper.updateByPrimaryKeySelective(model);
    }

    @Override
    public int delete(Long id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public User authentication(User user) {
        return userMapper.authentication(user);
    }

    @Override
    public User selectById(Long id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public GenericDao<User, Long> getDao() {
        return userMapper;
    }

    @Override
    public User selectByUsername(String username) {
        UserExample example = new UserExample();
        example.createCriteria().andUsernameEqualTo(username);
        final List<User> list = userMapper.selectByExample(example);
        return list.get(0);
    }
    
    @Override
    public List<User> selectList() {
    	return userMapper.selectList(null);
    }
    
    @Override
    public Integer selectListCount(UserCtrlModel userCtrlModel) {
    	return userMapper.selectListCount(userCtrlModel);
    }

	@Override
	public List<User> selectUserList(UserCtrlModel userCtrlModel) {
		// TODO Auto-generated method stub
		return userMapper.selectList(userCtrlModel);
	}
	
	@Override
    public Integer selectAdminRmdListCount(UserCtrlModel userCtrlModel) {
    	return userMapper.selectAdminRmdListCount(userCtrlModel);
    }

	@Override
	public List<User> selectAdminRmdUserList(UserCtrlModel userCtrlModel) {
		return userMapper.selectAdminRmdUserList(userCtrlModel);
	}

	@Override
	public Integer selectMyRmdUserCount(UserCtrlModel userCtrlModel) {
		return userMapper.selectMyRmdUserCount(userCtrlModel);
	}

	@Override
	public List<User> selectMyRmdUserList(UserCtrlModel userCtrlModel) {
		return userMapper.selectMyRmdUserList(userCtrlModel);
	}
    
}
