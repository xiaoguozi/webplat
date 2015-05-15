package com.tjs.admin.pe.controller;

import com.tjs.admin.pe.model.PEProduct;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 私募产品控制模型
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
/**
 * @author zh
 *
 */
public class PEProductCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private int limitStart;
	
	/* 净值日期 */
	private String netWorthTimeStr;
	
	/* 成立日期 */
	private String setupTimeStr;
	
	/* 开放日期 */
	private String openTimeStr;
	
	/** 产品对象 */
	private PEProduct peProduct;
	
	/** 经理ID */
	private String managerId;
	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public PEProduct getPeProduct() {
		if (null == peProduct) {
			peProduct = new PEProduct();
		}
		return peProduct;
	}

	public void setPeProduct(PEProduct peProduct) {
		this.peProduct = peProduct;
	}

	public String getNetWorthTimeStr() {
		return netWorthTimeStr;
	}

	public void setNetWorthTimeStr(String netWorthTimeStr) {
		this.netWorthTimeStr = netWorthTimeStr;
	}

	public String getSetupTimeStr() {
		return setupTimeStr;
	}

	public void setSetupTimeStr(String setupTimeStr) {
		this.setupTimeStr = setupTimeStr;
	}

	public String getOpenTimeStr() {
		return openTimeStr;
	}

	public void setOpenTimeStr(String openTimeStr) {
		this.openTimeStr = openTimeStr;
	}

	public int getLimitStart() {
		return (this.getPageNo()-1)*this.getPageSize();
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	
}
