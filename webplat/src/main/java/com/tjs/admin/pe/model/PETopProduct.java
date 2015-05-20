package com.tjs.admin.pe.model;

import java.math.BigDecimal;

public class PETopProduct {

	/** 产品Id */
	private long id;
	
	/** 产品名称 */
	private String name; 
	
	/** 累计收益 */
	private BigDecimal accumulatedIncome;
	
	/** 最新净值 */
	private BigDecimal netWorth;
	
	/** 运行时间 */
	private Integer runTime;
	
	/** 年收益率 */
	private BigDecimal yearRate;
	
	/** 今年以来收益率 */
	private BigDecimal nowRate;
	
	/** 近1年收益率 */
	private BigDecimal oneRate;
	
	/** 近2年收益率 */
	private BigDecimal towRate;
	
	/** 基金经理Id */
	private String managerId;
	
	/** 基金经理姓名 */
	private String managerName;
	
	/** 头像 */
	private String managerLogo;
	
	/** 基金经理评价 */
	private String managerReview;
	
	/** 公司名称 */
	private String companyName;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerLogo() {
		return managerLogo;
	}

	public void setManagerLogo(String managerLogo) {
		this.managerLogo = managerLogo;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getManagerReview() {
		return managerReview;
	}

	public void setManagerReview(String managerReview) {
		this.managerReview = managerReview;
	}
	
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public BigDecimal getAccumulatedIncome() {
		return accumulatedIncome;
	}

	public void setAccumulatedIncome(BigDecimal accumulatedIncome) {
		this.accumulatedIncome = accumulatedIncome;
	}

	public BigDecimal getNetWorth() {
		return netWorth;
	}

	public void setNetWorth(BigDecimal netWorth) {
		this.netWorth = netWorth;
	}

	public Integer getRunTime() {
		return runTime;
	}

	public void setRunTime(Integer runTime) {
		this.runTime = runTime;
	}

	public BigDecimal getYearRate() {
		return yearRate;
	}

	public void setYearRate(BigDecimal yearRate) {
		this.yearRate = yearRate;
	}

	public BigDecimal getNowRate() {
		return nowRate;
	}

	public void setNowRate(BigDecimal nowRate) {
		this.nowRate = nowRate;
	}

	public BigDecimal getOneRate() {
		return oneRate;
	}

	public void setOneRate(BigDecimal oneRate) {
		this.oneRate = oneRate;
	}

	public BigDecimal getTowRate() {
		return towRate;
	}

	public void setTowRate(BigDecimal towRate) {
		this.towRate = towRate;
	}


}
