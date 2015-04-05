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
	
	private ProductXtgs productXtgs;

	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public ProductXtgs getProductXtgs() {
		return productXtgs;
	}

	public void setProductXtgs(ProductXtgs productXtgs) {
		this.productXtgs = productXtgs;
	}

	
	
	
}
