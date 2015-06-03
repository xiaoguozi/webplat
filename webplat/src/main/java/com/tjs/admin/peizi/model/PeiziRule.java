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
}
