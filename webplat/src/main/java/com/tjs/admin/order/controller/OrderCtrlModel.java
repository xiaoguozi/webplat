package com.tjs.admin.order.controller;

import com.tjs.admin.order.model.Order;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 信托公司
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
public class OrderCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private int limitStart;
	
	private boolean isFormat=true;
	
	public boolean isFormat() {
		return isFormat;
	}

	public void setFormat(boolean isFormat) {
		this.isFormat = isFormat;
	}

	public int getLimitStart() {
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	private Order order;

	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	

	

	
	
	
}
