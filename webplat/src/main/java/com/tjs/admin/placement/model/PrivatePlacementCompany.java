/**
 * 私募公司
 * 
 *@Author zhsoft
 *@Time 2015年3月25日
 *
 **/
package com.tjs.admin.placement.model;

import java.util.Date;

public class PrivatePlacementCompany {
	
	private int id;
	
	/** 公司LOGO */
	private String logo;
	
	/** 公司名称 */
	private String name;
	
	/** 成立时间 */
	private Date setupTime;
	
	/** 管理规模 */
	private String managementScale;
	
	/** 所在区域 */
	private String area;
	
	/** 投研人数 */
	private String investmentNumber;
	
	/** 旗下经理 */
	private String manager;
	
	/** 产品线 */
	private String productLine;
	
	/** 点评 */
	private String review;
	
	/** 核心人物 */
	private String coreCharacter;
	
	/** 投资理念 */
	private String investmentPhilosophy;
	
	/** 投研团队 */
	private String investmentTeam;
	
	/** 公司简介 */
	private String companyProfile;
	
	private Date createDate;
	
	private Date lastModifyDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getSetupTime() {
		return setupTime;
	}

	public void setSetupTime(Date setupTime) {
		this.setupTime = setupTime;
	}

	public String getManagementScale() {
		return managementScale;
	}

	public void setManagementScale(String managementScale) {
		this.managementScale = managementScale;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getInvestmentNumber() {
		return investmentNumber;
	}

	public void setInvestmentNumber(String investmentNumber) {
		this.investmentNumber = investmentNumber;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getProductLine() {
		return productLine;
	}

	public void setProductLine(String productLine) {
		this.productLine = productLine;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getCoreCharacter() {
		return coreCharacter;
	}

	public void setCoreCharacter(String coreCharacter) {
		this.coreCharacter = coreCharacter;
	}

	public String getInvestmentPhilosophy() {
		return investmentPhilosophy;
	}

	public void setInvestmentPhilosophy(String investmentPhilosophy) {
		this.investmentPhilosophy = investmentPhilosophy;
	}

	public String getInvestmentTeam() {
		return investmentTeam;
	}

	public void setInvestmentTeam(String investmentTeam) {
		this.investmentTeam = investmentTeam;
	}

	public String getCompanyProfile() {
		return companyProfile;
	}

	public void setCompanyProfile(String companyProfile) {
		this.companyProfile = companyProfile;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getLastModifyDate() {
		return lastModifyDate;
	}

	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}

	@Override
	public String toString() {
		return "PrivatePlacementCompany [id=" + id + ", logo=" + logo
				+ ", name=" + name + ", setupTime=" + setupTime
				+ ", managementScale=" + managementScale + ", area=" + area
				+ ", investmentNumber=" + investmentNumber + ", manager="
				+ manager + ", productLine=" + productLine + ", review="
				+ review + ", coreCharacter=" + coreCharacter
				+ ", investmentPhilosophy=" + investmentPhilosophy
				+ ", investmentTeam=" + investmentTeam + ", companyProfile="
				+ companyProfile + ", createDate=" + createDate
				+ ", lastModifyDate=" + lastModifyDate + "]";
	}

	
	
}