package com.tjs.admin.pe.model;

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
	private String netWorth;
	
	/* 累计收益 */
	private String accumulatedIncome;
	
	/* 净值日期 */
	private Date netWorthTime;
	
	/* 成立日期 */
	private Date setupTime;
	
	/* 运行时间 */
	private String runTime;
	
	/* 今年以来收益率 */
	private String nowRate;
	
	/* 近2年收益率 */
	private String towRate;
	
	/* 近1年收益率 */
	private String oneRate;
	
	/* 年化收益率 */
	private String yearRate;
	
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
	private String subscripStart;
	
	/* 认 购 费 */
	private String subscripFee;
	
	/* 退出费用 */
	private String exitFee;
	
	/* 浮动管理费 */
	private String managementFee;
	
	/* 推荐理由 */
	private String recommendReason;
	
	/* 创建日期 */
	private Date createDate;
	
	/* 最后修改日期 */
	private Date lastMdifyDate;
	
	/* 创建人ID */
	private Long createrId;
	
	/* 创建人姓名 */
	private String createrName;
	
	/* 推荐位 */
	private int recommendLocation;
	
	/* 推荐顺序 */
	private int recommendSequence;
	
	/* 产品状态:1、上线，2、运行中, 3、下线 */
	private int status;
	
	/* 私募公司ID */
	private Long pecompanyId;
	
	/* 私募公司名称 */
	private String pecompanyName;


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

	public String getNetWorth() {
		return netWorth;
	}

	public void setNetWorth(String netWorth) {
		this.netWorth = netWorth;
	}

	public String getAccumulatedIncome() {
		return accumulatedIncome;
	}

	public void setAccumulatedIncome(String accumulatedIncome) {
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

	public String getNowRate() {
		return nowRate;
	}

	public void setNowRate(String nowRate) {
		this.nowRate = nowRate;
	}

	public String getTowRate() {
		return towRate;
	}

	public void setTowRate(String towRate) {
		this.towRate = towRate;
	}

	public String getOneRate() {
		return oneRate;
	}

	public void setOneRate(String oneRate) {
		this.oneRate = oneRate;
	}

	public String getYearRate() {
		return yearRate;
	}

	public void setYearRate(String yearRate) {
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

	public String getSubscripStart() {
		return subscripStart;
	}

	public void setSubscripStart(String subscripStart) {
		this.subscripStart = subscripStart;
	}

	public String getSubscripFee() {
		return subscripFee;
	}

	public void setSubscripFee(String subscripFee) {
		this.subscripFee = subscripFee;
	}

	public String getExitFee() {
		return exitFee;
	}

	public void setExitFee(String exitFee) {
		this.exitFee = exitFee;
	}

	public String getManagementFee() {
		return managementFee;
	}

	public void setManagementFee(String managementFee) {
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

	public Date getLastMdifyDate() {
		return lastMdifyDate;
	}

	public void setLastMdifyDate(Date lastMdifyDate) {
		this.lastMdifyDate = lastMdifyDate;
	}

	public Long getCreaterId() {
		return createrId;
	}

	public void setCreaterId(Long createrId) {
		this.createrId = createrId;
	}

	public String getCreaterName() {
		return createrName;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}

	public int getRecommendLocation() {
		return recommendLocation;
	}

	public void setRecommendLocation(int recommendLocation) {
		this.recommendLocation = recommendLocation;
	}

	public int getRecommendSequence() {
		return recommendSequence;
	}

	public void setRecommendSequence(int recommendSequence) {
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
				+ ", lastMdifyDate=" + lastMdifyDate + ", createrId="
				+ createrId + ", createrName=" + createrName
				+ ", recommendLocation=" + recommendLocation
				+ ", recommendSequence=" + recommendSequence + ", status="
				+ status + ", pecompanyId=" + pecompanyId + ", pecompanyName="
				+ pecompanyName + "]";
	}
	
}
