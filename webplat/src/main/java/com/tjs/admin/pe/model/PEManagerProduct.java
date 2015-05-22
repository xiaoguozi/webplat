package com.tjs.admin.pe.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 私募经理产品实体
 * 
 *@author zhsoft
 *@since 2015年4月30日
 **/
public class PEManagerProduct {
	
     private Long managerId;
	
	/** 头像 */
	private String logo;
	
	/** 姓名 */
	private String managerName;
	
	/** 文化程度 */
	private String education;
	
	/** 毕业院校 */
	private String school;
	
	/** 从业年限 */
	private String workYear;
	
	/** 从业背景 */
	private String background;
	
	/** 过往从业机构 */
	private String institution;
	
	/** 经理评级: 1:一级、2:二级、3:三级、4:四级、5:五级 */
	private int level;
	
	/** 管理基金数 */	
	private Long manageFund;
	
	/** 盈利产品数 */	
	private Long profitProduct;
	
	/** 点评 */	
	private String review;
	
	/** 人物介绍 */
	private String introduce;
	
	/** 推荐位 */
	private String recommendLocation;
	
	/** 推荐顺序 */
	private String recommendSequence;
	
	/** 状态:1、未上线，2、上线, 3、下线  */
	private int status;
	
	/** 公司ID */
	private Long companyId;
	
	/** 公司名称  */
	private String companyName;
	
	private long createrId;
	
	private String createrName;
	
	private Date createDate;
	
	private Date lastModifyDate;
	
	
	private Long productId;
	
	/* 基金名称 */
	private String productName; 
	
	/* 基金简称 */
	private String productSimpleName;
	
	/* 累计收益 */
	private BigDecimal accumulatedIncome;

	public Long getManagerId() {
		return managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getWorkYear() {
		return workYear;
	}

	public void setWorkYear(String workYear) {
		this.workYear = workYear;
	}

	public String getBackground() {
		return background;
	}

	public void setBackground(String background) {
		this.background = background;
	}

	public String getInstitution() {
		return institution;
	}

	public void setInstitution(String institution) {
		this.institution = institution;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public Long getManageFund() {
		return manageFund;
	}

	public void setManageFund(Long manageFund) {
		this.manageFund = manageFund;
	}

	public Long getProfitProduct() {
		return profitProduct;
	}

	public void setProfitProduct(Long profitProduct) {
		this.profitProduct = profitProduct;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getRecommendLocation() {
		return recommendLocation;
	}

	public void setRecommendLocation(String recommendLocation) {
		this.recommendLocation = recommendLocation;
	}

	public String getRecommendSequence() {
		return recommendSequence;
	}

	public void setRecommendSequence(String recommendSequence) {
		this.recommendSequence = recommendSequence;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public long getCreaterId() {
		return createrId;
	}

	public void setCreaterId(long createrId) {
		this.createrId = createrId;
	}

	public String getCreaterName() {
		return createrName;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
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

	public String getProductSimpleName() {
		return productSimpleName;
	}

	public void setProductSimpleName(String productSimpleName) {
		this.productSimpleName = productSimpleName;
	}

	public BigDecimal getAccumulatedIncome() {
		return accumulatedIncome;
	}

	public void setAccumulatedIncome(BigDecimal accumulatedIncome) {
		this.accumulatedIncome = accumulatedIncome;
	}
	

}
