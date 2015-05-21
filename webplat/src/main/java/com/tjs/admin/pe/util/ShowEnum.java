package com.tjs.admin.pe.util;

/**
 * 发布状态枚举类
 * 
 *@author zhsoft
 *@since 2015年4月30日
 **/
public enum ShowEnum {
    
	/** 代表作 */
	SHOW(1),
	
	/** 非代表作 */
	ON_SHOW(2);
	
	
	private int status;
	
	private ShowEnum(int status) {
		this.status = status;
	}

	public int getStatus() {
		return status;
	}
	
}
