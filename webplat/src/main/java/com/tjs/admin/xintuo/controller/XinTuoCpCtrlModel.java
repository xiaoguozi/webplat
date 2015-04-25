package com.tjs.admin.xintuo.controller;

import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 信托公司
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
public class XinTuoCpCtrlModel extends GenericCtrlModel {

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

	private ProductXtcp productXtcp;

	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public ProductXtcp getProductXtcp() {
		return productXtcp;
	}

	public void setProductXtcp(ProductXtcp productXtcp) {
		this.productXtcp = productXtcp;
	}

	

	
	
	
}
