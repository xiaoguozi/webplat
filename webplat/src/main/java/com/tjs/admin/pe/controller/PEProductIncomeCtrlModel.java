package com.tjs.admin.pe.controller;

import com.tjs.admin.pe.model.PEProductIncome;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 私募产品收益排名控制模型
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
public class PEProductIncomeCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private String productId;
	
	private PEProductIncome peProductIncome;

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public PEProductIncome getPeProductIncome() {
		return peProductIncome;
	}

	public void setPeProductIncome(PEProductIncome peProductIncome) {
		this.peProductIncome = peProductIncome;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	
}
