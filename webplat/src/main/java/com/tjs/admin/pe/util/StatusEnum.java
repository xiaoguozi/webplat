package com.tjs.admin.pe.util;

/**
 * 发布状态枚举类
 * 
 *@author zhsoft
 *@since 2015年4月30日
 **/
public enum StatusEnum {
    
	/** 未上线 */
	NOT_LINE(1),
	
	/** 上线 */
	ON_LINE(2),
	
	/** 下线 */
	OFF_LINE(3);
	
	private int status;
	
	private StatusEnum(int status) {
		this.status = status;
	}

	public int getStatus() {
		return status;
	}
	
}
