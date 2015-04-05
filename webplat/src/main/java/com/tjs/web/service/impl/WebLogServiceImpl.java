package com.tjs.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.core.generic.GenericDao;
import com.tjs.core.generic.GenericServiceImpl;
import com.tjs.web.dao.WebLogMapper;
import com.tjs.web.model.WebLog;
import com.tjs.web.service.WebLogService;

/**
 * 用户Service实现类
 *
 * @author StarZou
 * @since 2014年7月5日 上午11:54:24
 */
@Service
public class WebLogServiceImpl extends GenericServiceImpl<WebLog, Long> implements WebLogService {

    @Resource
    private WebLogMapper webLogMapper;

    @Override
    public int insert(WebLog model) {
        return webLogMapper.insertSelective(model);
    }

    @Override
    public int update(WebLog model) {
        return webLogMapper.updateByPrimaryKeySelective(model);
    }

    @Override
    public int delete(Long id) {
        return webLogMapper.deleteByPrimaryKey(id);
    }

    @Override
    public GenericDao<WebLog, Long> getDao() {
        return webLogMapper;
    }
    
    @Override
    public List<WebLog> selectList() {
    	return webLogMapper.selectList();
    }
    
    @Override
    public Integer selectListCount() {
    	return webLogMapper.selectListCount();
    }
    
}
