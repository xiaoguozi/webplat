package com.tjs.admin.pe.model;

public class PETopProduct {

	/** 产品Id */
	private long id;
	
	/** 产品名称 */
	private String name; 
	
	/** 累计收益 */
	private String accumulatedIncome;
	
	/** 基金经理Id */
	private String managerId;
	
	/** 基金经理姓名 */
	private String managerName;
	
	/** 头像 */
	private String managerLogo;
	
	/** 基金经理评价 */
	private String managerReview;

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

	@Override
	public String toString() {
		return "PETopProduct [id=" + id + ", name=" + name
				+ ", accumulatedIncome=" + accumulatedIncome + ", managerId="
				+ managerId + ", managerName=" + managerName + ", managerLogo="
				+ managerLogo + ", managerReview=" + managerReview + "]";
	}
	
	
}
