package com.tjs.admin.pe.controller;

import com.tjs.admin.pe.model.PECompany;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 私募公司控制模型
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
public class PECompanyCtrlModel extends GenericCtrlModel {

	private String keyWord;

	private String setupTimeStr;
	
	private PECompany peCompany;

	public String getSetupTimeStr() {
		return setupTimeStr;
	}

	public void setSetupTimeStr(String setupTimeStr) {
		this.setupTimeStr = setupTimeStr;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public PECompany getPeCompany() {
		return peCompany;
	}

	public void setPeCompany(PECompany peCompany) {
		this.peCompany = peCompany;
	}
	
	
}
