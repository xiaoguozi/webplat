package com.tjs.web.zhifu.controller;

import com.tjs.core.generic.GenericCtrlModel;

/**
 * 支付模型
 * 
 *@author dyj
 *@since 2015年6月27日
 **/
public class ZhifuModel extends GenericCtrlModel {

	/** 充值金额  */
	private String rechargeAmount;
	
	/** 银行类型 */
	private String bankType;

	public String getRechargeAmount() {
		return rechargeAmount;
	}

	public void setRechargeAmount(String rechargeAmount) {
		this.rechargeAmount = rechargeAmount;
	}

	public String getBankType() {
		return bankType;
	}

	public void setBankType(String bankType) {
		this.bankType = bankType;
	}

	

}
