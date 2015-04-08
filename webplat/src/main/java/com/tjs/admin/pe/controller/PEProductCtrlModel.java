package com.tjs.admin.pe.controller;

import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 私募产品控制模型
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
public class PEProductCtrlModel extends GenericCtrlModel {

	private String keyWord;

	private PEProduct peProduct;


	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public PEProduct getPeProduct() {
		return peProduct;
	}

	public void setPeProduct(PEProduct peProduct) {
		this.peProduct = peProduct;
	}

	
}
