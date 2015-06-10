package com.tjs.web.peizi.controller;

import com.tjs.core.generic.GenericCtrlModel;

/**
 * 配资活动控制模型
 * 
 *@author dyj
 *@since 2015年6月3日
 **/
public class PZIndexCtrlModel extends GenericCtrlModel {

	/** 当前日期  */
	private String dateString;
	
	/** 用户Id */
	private Long userId = 0L;
	
	/** 配资类型  */
	private int peiziType = 0;
	
	/** 流水Id */
	private Long dataId = 0L;

	public String getDateString() {
		return dateString;
	}

	public void setDateString(String dateString) {
		this.dateString = dateString;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public int getPeiziType() {
		return peiziType;
	}

	public void setPeiziType(int peiziType) {
		this.peiziType = peiziType;
	}

	public Long getDataId() {
		return dataId;
	}

	public void setDataId(Long dataId) {
		this.dataId = dataId;
	}

}
