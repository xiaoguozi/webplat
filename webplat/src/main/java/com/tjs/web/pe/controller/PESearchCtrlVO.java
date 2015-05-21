package com.tjs.web.pe.controller;

import com.tjs.core.generic.GenericCtrlModel;

/**
 * 查询条件VO
 * @author duanyujun
 *
 */
public class PESearchCtrlVO extends GenericCtrlModel {

	/** 关键字 */
	private String keyword;
	
	/** 私募产品Id */
	private String peProductId;
	
	/** 基金经理 */
	private int peManagerId = 0;
	
	/** 基金公司 */
	private int peCompanyId = 0;
	
	/** 基金类型 */
	private int peType = 0;
	
	/** 年华收益率  */
	private int peYearRate = 0;
	
	/** 基金经理更多 */
	private int peManagerMore = 0;
	
	/** 基金公司更多 */
	private int peCompanyMore = 0;
	
	/**是否上线，默认是上线  */
	private int onLine = 1;
	
	/** 年以来过滤条件 */
	private int currentYear = 0;
	
	/** 最近一年、两年 */
	private int currentYearPeriod = 0;
	
	private int totalPageSize;
	
	private int limitStart;

	public int getTotalPageSize() {
		if (super.getTotalCount() % super.getPageSize() == 0) {
			return super.getTotalCount() / super.getPageSize();
		} else {
			return super.getTotalCount() / super.getPageSize() + 1;
		}

	}

	public void setTotalPageSize(int totalPageSize) {
		this.totalPageSize = totalPageSize;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPeManagerId() {
		return peManagerId;
	}

	public void setPeManagerId(int peManagerId) {
		this.peManagerId = peManagerId;
	}

	public int getPeCompanyId() {
		return peCompanyId;
	}

	public void setPeCompanyId(int peCompanyId) {
		this.peCompanyId = peCompanyId;
	}

	public int getPeType() {
		return peType;
	}

	public void setPeType(int peType) {
		this.peType = peType;
	}

	public int getPeYearRate() {
		return peYearRate;
	}

	public void setPeYearRate(int peYearRate) {
		this.peYearRate = peYearRate;
	}

	public int getPeManagerMore() {
		return peManagerMore;
	}

	public void setPeManagerMore(int peManagerMore) {
		this.peManagerMore = peManagerMore;
	}

	public int getPeCompanyMore() {
		return peCompanyMore;
	}

	public void setPeCompanyMore(int peCompanyMore) {
		this.peCompanyMore = peCompanyMore;
	}

	public int getLimitStart() {
		return (this.getPageNo()-1)*this.getPageSize();
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	public int getOnLine() {
		return onLine;
	}

	public void setOnLine(int onLine) {
		this.onLine = onLine;
	}

	public String getPeProductId() {
		return peProductId;
	}

	public void setPeProductId(String peProductId) {
		this.peProductId = peProductId;
	}

	public int getCurrentYear() {
		return currentYear;
	}

	public void setCurrentYear(int currentYear) {
		this.currentYear = currentYear;
	}

	public int getCurrentYearPeriod() {
		return currentYearPeriod;
	}

	public void setCurrentYearPeriod(int currentYearPeriod) {
		this.currentYearPeriod = currentYearPeriod;
	}
	
}
