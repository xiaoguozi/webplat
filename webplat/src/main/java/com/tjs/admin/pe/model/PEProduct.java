package com.tjs.admin.pe.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 私募产品实体
 * 
 *@author zhsoft
 *@since 2015年4月7日
 **/
public class PEProduct {
   
	private long id;
	
	/* 基金名称 */
	private String name; 
	
	/* 基金简称 */
	private String simpleName;
	
	/* 最新净值 */
	private BigDecimal netWorth;
	
	/* 累计收益 */
	private BigDecimal accumulatedIncome;
	
	/* 净值日期 */
	private Date netWorthTime;
	
	/* 成立日期 */
	private Date setupTime;
	
	/* 运行时间 */
	private String runTime;
	
	/* 今年以来收益率 */
	private BigDecimal nowRate;
	
	/* 近2年收益率 */
	private BigDecimal towRate;
	
	/* 近1年收益率 */
	private BigDecimal oneRate;
	
	/* 年化收益率 */
	private BigDecimal yearRate;
	
	/* 基金类型:1:股票、2:期货基金、3:股票量化、4:债券型、5:定向增发、6:宏观对冲、7:组合基金、8:其他 */
	private int fundType;
	
	/* 产品等级:1、一级，2、二级，3、三级， 4、四级，5、五级 */
	private int productLevel;
	
	/* 发行平台 */
	private String distributionPlatform;
	
	/* 托管银行 */
	private String custodianBank;
	
	/* 证券经纪 */
	private String stockbrokers;
	
	/* 基金性质:1、主基金，2、子基金 */
	private int fundProperty;
	
	/* 是否结构化 */
	private String whetherStructure;
	
	/* 开放日期 */
	private Date openTime;
	
	/* 认购起点 */
	private BigDecimal subscripStart;
	
	/* 认 购 费 */
	private BigDecimal subscripFee;
	
	/* 退出费用 */
	private BigDecimal exitFee;
	
	/* 浮动管理费 */
	private BigDecimal managementFee;
	
	/* 推荐理由 */
	private String recommendReason;
	
	/* 创建日期 */
	private Date createDate;
	
	/* 最后修改日期 */
	private Date lastModifyDate;
	
	/* 创建人ID */
	private long createrId;
	
	/* 创建人姓名 */
	private String createrName;
	
	/* 推荐位 */
	private String recommendLocation;
	
	/* 推荐顺序 */
	private String recommendSequence;
	
	/* 产品状态:1、未上线，2、上线, 3、下线 */
	private int status;
	
	/* 私募公司ID */
	private Long pecompanyId;
	
	/* 私募公司名称 */
	private String pecompanyName;
	
	/* 经理ID */
	private Long managerId;
	
	/* 经理名称 */
	private String managerName;

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

	public String getSimpleName() {
		return simpleName;
	}

	public void setSimpleName(String simpleName) {
		this.simpleName = simpleName;
	}

	public BigDecimal getNetWorth() {
		return netWorth;
	}

	public void setNetWorth(BigDecimal netWorth) {
		this.netWorth = netWorth;
	}

	public BigDecimal getAccumulatedIncome() {
		return accumulatedIncome;
	}

	public void setAccumulatedIncome(BigDecimal accumulatedIncome) {
		this.accumulatedIncome = accumulatedIncome;
	}

	public Date getNetWorthTime() {
		return netWorthTime;
	}

	public void setNetWorthTime(Date netWorthTime) {
		this.netWorthTime = netWorthTime;
	}

	public Date getSetupTime() {
		return setupTime;
	}

	public void setSetupTime(Date setupTime) {
		this.setupTime = setupTime;
	}

	public String getRunTime() {
		return runTime;
	}

	public void setRunTime(String runTime) {
		this.runTime = runTime;
	}

	public BigDecimal getNowRate() {
		return nowRate;
	}

	public void setNowRate(BigDecimal nowRate) {
		this.nowRate = nowRate;
	}

	public BigDecimal getTowRate() {
		return towRate;
	}

	public void setTowRate(BigDecimal towRate) {
		this.towRate = towRate;
	}

	public BigDecimal getOneRate() {
		return oneRate;
	}

	public void setOneRate(BigDecimal oneRate) {
		this.oneRate = oneRate;
	}

	public BigDecimal getYearRate() {
		return yearRate;
	}

	public void setYearRate(BigDecimal yearRate) {
		this.yearRate = yearRate;
	}

	public int getFundType() {
		return fundType;
	}

	public void setFundType(int fundType) {
		this.fundType = fundType;
	}

	public int getProductLevel() {
		return productLevel;
	}

	public void setProductLevel(int productLevel) {
		this.productLevel = productLevel;
	}

	public String getDistributionPlatform() {
		return distributionPlatform;
	}

	public void setDistributionPlatform(String distributionPlatform) {
		this.distributionPlatform = distributionPlatform;
	}

	public String getCustodianBank() {
		return custodianBank;
	}

	public void setCustodianBank(String custodianBank) {
		this.custodianBank = custodianBank;
	}

	public String getStockbrokers() {
		return stockbrokers;
	}

	public void setStockbrokers(String stockbrokers) {
		this.stockbrokers = stockbrokers;
	}

	public int getFundProperty() {
		return fundProperty;
	}

	public void setFundProperty(int fundProperty) {
		this.fundProperty = fundProperty;
	}

	public String getWhetherStructure() {
		return whetherStructure;
	}

	public void setWhetherStructure(String whetherStructure) {
		this.whetherStructure = whetherStructure;
	}

	public Date getOpenTime() {
		return openTime;
	}

	public void setOpenTime(Date openTime) {
		this.openTime = openTime;
	}

	public BigDecimal getSubscripStart() {
		return subscripStart;
	}

	public void setSubscripStart(BigDecimal subscripStart) {
		this.subscripStart = subscripStart;
	}

	public BigDecimal getSubscripFee() {
		return subscripFee;
	}

	public void setSubscripFee(BigDecimal subscripFee) {
		this.subscripFee = subscripFee;
	}

	public BigDecimal getExitFee() {
		return exitFee;
	}

	public void setExitFee(BigDecimal exitFee) {
		this.exitFee = exitFee;
	}

	public BigDecimal getManagementFee() {
		return managementFee;
	}

	public void setManagementFee(BigDecimal managementFee) {
		this.managementFee = managementFee;
	}

	public String getRecommendReason() {
		return recommendReason;
	}

	public void setRecommendReason(String recommendReason) {
		this.recommendReason = recommendReason;
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

	public Long getPecompanyId() {
		return pecompanyId;
	}

	public void setPecompanyId(Long pecompanyId) {
		this.pecompanyId = pecompanyId;
	}

	public String getPecompanyName() {
		return pecompanyName;
	}

	public void setPecompanyName(String pecompanyName) {
		this.pecompanyName = pecompanyName;
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

	@Override
	public String toString() {
		return "PEProduct [id=" + id + ", name=" + name + ", simpleName="
				+ simpleName + ", netWorth=" + netWorth
				+ ", accumulatedIncome=" + accumulatedIncome
				+ ", netWorthTime=" + netWorthTime + ", setupTime=" + setupTime
				+ ", runTime=" + runTime + ", nowRate=" + nowRate
				+ ", towRate=" + towRate + ", oneRate=" + oneRate
				+ ", yearRate=" + yearRate + ", fundType=" + fundType
				+ ", productLevel=" + productLevel + ", distributionPlatform="
				+ distributionPlatform + ", custodianBank=" + custodianBank
				+ ", stockbrokers=" + stockbrokers + ", fundProperty="
				+ fundProperty + ", whetherStructure=" + whetherStructure
				+ ", openTime=" + openTime + ", subscripStart=" + subscripStart
				+ ", subscripFee=" + subscripFee + ", exitFee=" + exitFee
				+ ", managementFee=" + managementFee + ", recommendReason="
				+ recommendReason + ", createDate=" + createDate
				+ ", lastModifyDate=" + lastModifyDate + ", createrId="
				+ createrId + ", createrName=" + createrName
				+ ", recommendLocation=" + recommendLocation
				+ ", recommendSequence=" + recommendSequence + ", status="
				+ status + ", pecompanyId=" + pecompanyId + ", pecompanyName="
				+ pecompanyName + ", managerId=" + managerId + ", managerName="
				+ managerName + "]";
	}

}
