package com.tjs.admin.xintuo.controller;

import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 信托公司
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
public class XinTuoGsCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private int limitStart;
	
	private boolean isFormat=true;
	
	private ProductXtgs productXtgs;
	
	private int totalPageSize;
	
	public int getLimitStart() {
		return limitStart;
	}

	public int getTotalPageSize() {
		if(super.getTotalCount()%super.getPageSize()==0){
			return super.getTotalCount()/super.getPageSize();
		}else{
			return super.getTotalCount()/super.getPageSize()+1;
		}
	}

	public void setTotalPageSize(int totalPageSize) {
		this.totalPageSize = totalPageSize;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public ProductXtgs getProductXtgs() {
		if(productXtgs==null){
			productXtgs = new ProductXtgs();
		}
		return productXtgs;
	}

	public void setProductXtgs(ProductXtgs productXtgs) {
		this.productXtgs = productXtgs;
	}

	public boolean isFormat() {
		return isFormat;
	}

	public void setFormat(boolean isFormat) {
		this.isFormat = isFormat;
	}

	
	
	
}
