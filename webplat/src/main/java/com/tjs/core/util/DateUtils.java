package com.tjs.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.druid.support.logging.LogFactory;

/**
 * 日期工具类
 * 
 *@author zhsoft
 *@since 2015年4月8日
 **/
public final class DateUtils {
	
	public static final Logger LOGGER = LoggerFactory.getLogger(DateUtils.class);
	
	public static final SimpleDateFormat SDF_YMD = new SimpleDateFormat("yyyy-MM-dd");
	
	public static final SimpleDateFormat SDF_HMS = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
	
	public static final Date str2Date(String date) {
		Date result = null;
		
		try {
			if(StringExtUtils.isNotBlank(date)){
				result = SDF_YMD.parse(date);
			}
		} catch (ParseException e) {
			LOGGER.debug(e.getMessage());
		}
		
		return result;
	}
	
	public static final Date getCurrentDate() {
		return new Date(System.currentTimeMillis());
	}
}
