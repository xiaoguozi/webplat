package com.tjs.admin.pe.model;

/**
 * 私募经理产品实体
 * 
 *@author zhsoft
 *@since 2015年4月30日
 **/
public class PEManagerProduct {
	
	private Long id;
	
	/** 私募经理ID */
	private Long managerId;
	
	/** 私募经理名称 */
	private String managerName;
	
	/** 私募公司ID */
	private Long companyId;
	
	/** 私募公司名称 */
	private String companyName;
	
	/** 私募产品ID */
	private Long productId;
	
	/** 私募产品名称 */
	private String productName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getManagerId() {
		return managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "PEManagerProduct [id=" + id + ", managerId=" + managerId
				+ ", managerName=" + managerName + ", companyId=" + companyId
				+ ", companyName=" + companyName + ", productId=" + productId
				+ ", productName=" + productName + "]";
	}
	
}
