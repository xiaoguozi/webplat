package com.tjs.admin.pe.controller;

import com.tjs.admin.pe.model.PEProductNet;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 私募产品净值控制模型
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
public class PEProductNetCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private int limitStart;
	
	private String netTimeStr;
	
	private String productId;
	
	private PEProductNet peProductNet;

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getNetTimeStr() {
		return netTimeStr;
	}

	public void setNetTimeStr(String netTimeStr) {
		this.netTimeStr = netTimeStr;
	}

	public PEProductNet getPeProductNet() {
		return peProductNet;
	}

	public void setPeProductNet(PEProductNet peProductNet) {
		this.peProductNet = peProductNet;
	}
	
	public int getLimitStart() {
		return (this.getPageNo()-1)*this.getPageSize();
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	
}
