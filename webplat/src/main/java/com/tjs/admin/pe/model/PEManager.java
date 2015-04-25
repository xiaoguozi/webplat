package com.tjs.admin.pe.model;

import java.util.Date;

/**
 * 私募经理
 * 
 *@author zhsoft
 *@since 2015年4月21日
 **/
public class PEManager {

	private long id;
	
	/** 头像 */
	private String logo;
	
	/** 姓名 */
	private String name;
	
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
	private String manageFund;
	
	/** 盈利产品数 */	
	private String profitProduct;
	
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
	
	private long createrId;
	
	private String createrName;
	
	private Date createDate;
	
	private Date lastModifyDate;

	public long getId() {
		return id;
	}

	public void setId(long id) {
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

	public String getManageFund() {
		return manageFund;
	}

	public void setManageFund(String manageFund) {
		this.manageFund = manageFund;
	}

	public String getProfitProduct() {
		return profitProduct;
	}

	public void setProfitProduct(String profitProduct) {
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

	@Override
	public String toString() {
		return "PEManager [id=" + id + ", logo=" + logo + ", name=" + name
				+ ", education=" + education + ", school=" + school
				+ ", workYear=" + workYear + ", background=" + background
				+ ", institution=" + institution + ", level=" + level
				+ ", manageFund=" + manageFund + ", profitProduct="
				+ profitProduct + ", review=" + review + ", introduce="
				+ introduce + ", recommendLocation=" + recommendLocation
				+ ", recommendSequence=" + recommendSequence + ", status="
				+ status + ", createrId=" + createrId + ", createrName="
				+ createrName + ", createDate=" + createDate
				+ ", lastModifyDate=" + lastModifyDate + "]";
	}

}
