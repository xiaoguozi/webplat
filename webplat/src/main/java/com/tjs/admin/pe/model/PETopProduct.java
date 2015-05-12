package com.tjs.admin.pe.model;

public class PETopProduct {

	/** 产品Id */
	private long id;
	
	/** 产品名称 */
	private String name; 
	
	/** 累计收益 */
	private String accumulatedIncome;
	
	/** 最新净值 */
	private String netWorth;
	
	/** 运行时间 */
	private String runTime;
	
	/** 年收益率 */
	private String yearRate;
	
	/** 今年以来收益率 */
	private String nowRate;
	
	/** 近1年收益率 */
	private String oneRate;
	
	/** 近2年收益率 */
	private String towRate;
	
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

	public String getAccumulatedIncome() {
		return accumulatedIncome;
	}

	public void setAccumulatedIncome(String accumulatedIncome) {
		this.accumulatedIncome = accumulatedIncome;
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
	
	public String getNowRate() {
		return nowRate;
	}

	public void setNowRate(String nowRate) {
		this.nowRate = nowRate;
	}

	public String getOneRate() {
		return oneRate;
	}

	public void setOneRate(String oneRate) {
		this.oneRate = oneRate;
	}

	
	public String getTowRate() {
		return towRate;
	}

	public void setTowRate(String towRate) {
		this.towRate = towRate;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getNetWorth() {
		return netWorth;
	}

	public void setNetWorth(String netWorth) {
		this.netWorth = netWorth;
	}

	public String getRunTime() {
		return runTime;
	}

	public void setRunTime(String runTime) {
		this.runTime = runTime;
	}

	public String getYearRate() {
		return yearRate;
	}

	public void setYearRate(String yearRate) {
		this.yearRate = yearRate;
	}

	

}
