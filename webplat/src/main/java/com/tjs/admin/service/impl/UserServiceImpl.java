package com.tjs.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tjs.admin.controller.UserCtrlModel;
import com.tjs.admin.dao.UserMapper;
import com.tjs.admin.model.User;
import com.tjs.admin.model.UserExample;
import com.tjs.admin.service.UserService;
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

    @Override
    public int insert(User model) {
        return userMapper.insertSelective(model);
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
    
}
