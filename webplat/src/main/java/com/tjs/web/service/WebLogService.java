package com.tjs.web.service;

import com.tjs.core.generic.GenericService;
import com.tjs.web.model.WebLog;

/**
 * weblog
 * 
 * @author swpan
 * @since 2014年7月5日 上午11:53:33
 **/
public interface WebLogService extends GenericService<WebLog, Long> {
    
    Integer selectListCount();
}
