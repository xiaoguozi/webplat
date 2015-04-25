package com.tjs.admin.pe.controller;

import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEProductNet;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 私募经理控制模型
 * 
 *@author zhsoft
 *@since 2015年4月21日
 **/
public class PEManagerCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private PEManager peManager;

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public PEManager getPeManager() {
		return peManager;
	}

	public void setPeManager(PEManager peManager) {
		this.peManager = peManager;
	}

	
}
