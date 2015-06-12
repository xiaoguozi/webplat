package com.tjs.admin.peizi.model;

import java.math.BigDecimal;

public class PeiziRule {
	 
	/**规则ID*/
	private  Long  ruleId;
	
	/**规则Type 规则类型：
	 * 1：配置活动， * 例如：免费配\n  
	 * 2：天天配\n
	 * 3：月月配\n                     
	 * 4：低息配\n*/	
	private String ruleType;
	
	/**平仓线(%)，为零或者空为不需要警戒线*/
	private BigDecimal rulePcx;
	
	/**警戒线(%)，为零或者空为不需要警戒线*/
	private BigDecimal ruleJjx;
	
	/**资金使用期限*/
	private Integer ruleZjsyqx;
	
	/**配资管理收益：\n 1：借款账户管理费/天\n 2：借款月利率\n 3：借款年利率*/
	private String ruleGlsyType;
	
	/**年利率*/
	private BigDecimal ruleZhglf;
	
	/**年利率*/
	private BigDecimal ruleNll;
			
	/**月利率*/
	private BigDecimal ruleYll;
	
	
	/**2倍杠杆月利率*/
	private BigDecimal ruleYll2;
	
	/**2倍杠杆平仓线(%)，为零或者空为不需要警戒线*/
	private BigDecimal rulePcx2;
	
	/**2倍杠杆警戒线(%)，为零或者空为不需要警戒线*/
	private BigDecimal ruleJjx2;
	
	
	/**3倍杠杆月利率*/
	private BigDecimal ruleYll3;
	
	/**3倍杠杆平仓线(%)，为零或者空为不需要警戒线*/
	private BigDecimal rulePcx3;
	
	/**3倍杠杆警戒线(%)，为零或者空为不需要警戒线*/
	private BigDecimal ruleJjx3;
	
	
	
	/**4倍杠杆月利率*/
	private BigDecimal ruleYll4;
	
	/**4倍杠杆平仓线(%)，为零或者空为不需要警戒线*/
	private BigDecimal rulePcx4;
	
	/**4倍杠杆警戒线(%)，为零或者空为不需要警戒线*/
	private BigDecimal ruleJjx4;
	
	
	
	/**5倍杠杆月利率*/
	private BigDecimal ruleYll5;
	
	/**5倍杠杆平仓线(%)，为零或者空为不需要警戒线*/
	private BigDecimal rulePcx5;
	
	/**5倍杠杆警戒线(%)，为零或者空为不需要警戒线*/
	private BigDecimal ruleJjx5;
	
	
	/**6倍杠杆月利率*/
	private BigDecimal ruleYll6;
	
	/**6倍杠杆平仓线(%)，为零或者空为不需要警戒线*/
	private BigDecimal rulePcx6;
	
	/**6倍杠杆警戒线(%)，为零或者空为不需要警戒线*/
	private BigDecimal ruleJjx6;
	
	
	
	

	public Long getRuleId() {
		return ruleId;
	}

	public void setRuleId(Long ruleId) {
		this.ruleId = ruleId;
	}

	public String getRuleType() {
		return ruleType;
	}

	public void setRuleType(String ruleType) {
		this.ruleType = ruleType;
	}

	public BigDecimal getRulePcx() {
		return rulePcx;
	}

	public void setRulePcx(BigDecimal rulePcx) {
		this.rulePcx = rulePcx;
	}

	public Integer getRuleZjsyqx() {
		return ruleZjsyqx;
	}

	public void setRuleZjsyqx(Integer ruleZjsyqx) {
		this.ruleZjsyqx = ruleZjsyqx;
	}

	public String getRuleGlsyType() {
		return ruleGlsyType;
	}

	public void setRuleGlsyType(String ruleGlsyType) {
		this.ruleGlsyType = ruleGlsyType;
	}

	public BigDecimal getRuleNll() {
		return ruleNll;
	}

	public void setRuleNll(BigDecimal ruleNll) {
		this.ruleNll = ruleNll;
	}

	public BigDecimal getRuleYll() {
		return ruleYll;
	}

	public void setRuleYll(BigDecimal ruleYll) {
		this.ruleYll = ruleYll;
	}

	public BigDecimal getRuleJjx() {
		return ruleJjx;
	}

	public void setRuleJjx(BigDecimal ruleJjx) {
		this.ruleJjx = ruleJjx;
	}
	
	public BigDecimal getRuleZhglf() {
		return ruleZhglf;
	}

	public void setRuleZhglf(BigDecimal ruleZhglf) {
		this.ruleZhglf = ruleZhglf;
	}

	public BigDecimal getRuleYll2() {
		return ruleYll2;
	}

	public void setRuleYll2(BigDecimal ruleYll2) {
		this.ruleYll2 = ruleYll2;
	}

	public BigDecimal getRulePcx2() {
		return rulePcx2;
	}

	public void setRulePcx2(BigDecimal rulePcx2) {
		this.rulePcx2 = rulePcx2;
	}

	public BigDecimal getRuleJjx2() {
		return ruleJjx2;
	}

	public void setRuleJjx2(BigDecimal ruleJjx2) {
		this.ruleJjx2 = ruleJjx2;
	}

	public BigDecimal getRuleYll3() {
		return ruleYll3;
	}

	public void setRuleYll3(BigDecimal ruleYll3) {
		this.ruleYll3 = ruleYll3;
	}

	public BigDecimal getRulePcx3() {
		return rulePcx3;
	}

	public void setRulePcx3(BigDecimal rulePcx3) {
		this.rulePcx3 = rulePcx3;
	}

	public BigDecimal getRuleJjx3() {
		return ruleJjx3;
	}

	public void setRuleJjx3(BigDecimal ruleJjx3) {
		this.ruleJjx3 = ruleJjx3;
	}

	public BigDecimal getRuleYll4() {
		return ruleYll4;
	}

	public void setRuleYll4(BigDecimal ruleYll4) {
		this.ruleYll4 = ruleYll4;
	}

	public BigDecimal getRulePcx4() {
		return rulePcx4;
	}

	public void setRulePcx4(BigDecimal rulePcx4) {
		this.rulePcx4 = rulePcx4;
	}

	public BigDecimal getRuleJjx4() {
		return ruleJjx4;
	}

	public void setRuleJjx4(BigDecimal ruleJjx4) {
		this.ruleJjx4 = ruleJjx4;
	}

	public BigDecimal getRuleYll5() {
		return ruleYll5;
	}

	public void setRuleYll5(BigDecimal ruleYll5) {
		this.ruleYll5 = ruleYll5;
	}

	public BigDecimal getRulePcx5() {
		return rulePcx5;
	}

	public void setRulePcx5(BigDecimal rulePcx5) {
		this.rulePcx5 = rulePcx5;
	}

	public BigDecimal getRuleJjx5() {
		return ruleJjx5;
	}

	public void setRuleJjx5(BigDecimal ruleJjx5) {
		this.ruleJjx5 = ruleJjx5;
	}

	public BigDecimal getRuleYll6() {
		return ruleYll6;
	}

	public void setRuleYll6(BigDecimal ruleYll6) {
		this.ruleYll6 = ruleYll6;
	}

	public BigDecimal getRulePcx6() {
		return rulePcx6;
	}

	public void setRulePcx6(BigDecimal rulePcx6) {
		this.rulePcx6 = rulePcx6;
	}

	public BigDecimal getRuleJjx6() {
		return ruleJjx6;
	}

	public void setRuleJjx6(BigDecimal ruleJjx6) {
		this.ruleJjx6 = ruleJjx6;
	}				
}
