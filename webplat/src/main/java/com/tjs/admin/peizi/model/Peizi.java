package com.tjs.admin.peizi.model;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Peizi {
	
	/**业务流水号 */
	private Long dataId;
	/**总超盘资金 */
	private BigDecimal dataZcpzj;
	/**投资保证金 */
	private BigDecimal dataTzbzj;	
	/**配资金额 */
	private BigDecimal dataPzje;
	/**警戒线 */
	private BigDecimal dataJjx;
	/**平仓线 */
	private BigDecimal dataPcx;
	/**配资类型：10 配资活动 20 天天配 30 月月配 40 低息配 */
	private String dataType;
	/**收益类型：10借款账户管理费/天\n                    20借款月利率\n                    30借款年利率 */
	private String dataTypeSylx;
	/**资金使用期限 ：根据收益类型（data_type_sylx）\n10借款账户管理费/天\n20借款月利率 存月\n 30借款年利率  存月 */
	private Integer dataZjsyqx;
	/**每天账户管理费 */
	private BigDecimal dataZfglf;
	/**月利率 */
	private BigDecimal dataYll;
	/**年利率 */
	private BigDecimal dataNll;
	/**借款利息\n如果是账户管理费用：   借款利息 =资金使用期限 *每天账户管理费\n如果是月利率     借款利息 = 资金使用期限*月利率*配资金额\n如果是年利率     借款利息 =  资金使用期限/12*年利率*配资金额 */
	private BigDecimal dataJklxTotal;
	/**配资提交时间 */
	private Date dataSubmitDate;
	/**开始交易时间1：当天；2下一个交易日 */
	private String dataJyksDate;
	/** 配资步骤*/
	private String dataStep;
	/** 创建时间*/
	private Date dataCreateDate;
	/** 修改时间*/
	private Date dataModifyDate;
	/** 用户名称*/
	private String dataUserName;
	/** 用户ID*/
	private Long dataUserId;
	/** 用户电话*/
	private String dataUserTel;
	/** 备注*/
	private String dataRemark;
	
	private String dataOperaStatus;
	
	/** 处理人用户名称*/
	private String dataOperaUserName;
	
	/** 处理人用户ID*/
	private Long dataOperaUserId;
	
	/**配资平仓线（%）*/
	private BigDecimal dataRulePcx;
	
	/**配资警戒线(%) */
	private BigDecimal dataRuleJjx;
	
	/**恒生账户 */
	private String dataJyzf;
	
	/**恒生密码 */
	private String dataJymm;
		
	/**发送恒生账户时间*/
	 @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date dataJyzfDate;
	
	/**操盘完成时间*/
	 @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date dataJyfcDate;
	
	
	/**页面段显示支付总金额*/
	
	private BigDecimal zfzje;
	
	
	/**页面段显示账户管理费*/
	
	private BigDecimal zfglf;
	
	
	
	
		
	public Long getDataId() {
		return dataId;
	}
	public void setDataId(Long dataId) {
		this.dataId = dataId;
	}
	public BigDecimal getDataZcpzj() {
		return dataZcpzj;
	}
	public void setDataZcpzj(BigDecimal dataZcpzj) {
		this.dataZcpzj = dataZcpzj;
	}
	public BigDecimal getDataTzbzj() {
		return dataTzbzj;
	}
	public void setDataTzbzj(BigDecimal dataTzbzj) {
		this.dataTzbzj = dataTzbzj;
	}
	public BigDecimal getDataJjx() {
		return dataJjx;
	}
	public void setDataJjx(BigDecimal dataJjx) {
		this.dataJjx = dataJjx;
	}
	public BigDecimal getDataPcx() {
		return dataPcx;
	}
	public void setDataPcx(BigDecimal dataPcx) {
		this.dataPcx = dataPcx;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getDataTypeSylx() {
		return dataTypeSylx;
	}
	public void setDataTypeSylx(String dataTypeSylx) {
		this.dataTypeSylx = dataTypeSylx;
	}
	public Integer getDataZjsyqx() {
		return dataZjsyqx;
	}
	public void setDataZjsyqx(Integer dataZjsyqx) {
		this.dataZjsyqx = dataZjsyqx;
	}
	public BigDecimal getDataZfglf() {
		return dataZfglf;
	}
	public void setDataZfglf(BigDecimal dataZfglf) {
		this.dataZfglf = dataZfglf;
	}
	public BigDecimal getDataYll() {
		return dataYll;
	}
	public void setDataYll(BigDecimal dataYll) {
		this.dataYll = dataYll;
	}

	
	public BigDecimal getDataNll() {
		return dataNll;
	}
	public void setDataNll(BigDecimal dataNll) {
		this.dataNll = dataNll;
	}
	public BigDecimal getDataJklxTotal() {
		return dataJklxTotal;
	}
	public void setDataJklxTotal(BigDecimal dataJklxTotal) {
		this.dataJklxTotal = dataJklxTotal;
	}
	public Date getDataSubmitDate() {
		return dataSubmitDate;
	}
	public void setDataSubmitDate(Date dataSubmitDate) {
		this.dataSubmitDate = dataSubmitDate;
	}
	public String getDataJyksDate() {
		return dataJyksDate;
	}
	public void setDataJyksDate(String dataJyksDate) {
		this.dataJyksDate = dataJyksDate;
	}
	public String getDataStep() {
		return dataStep;
	}
	public void setDataStep(String dataStep) {
		this.dataStep = dataStep;
	}
	public Date getDataCreateDate() {
		return dataCreateDate;
	}
	public void setDataCreateDate(Date dataCreateDate) {
		this.dataCreateDate = dataCreateDate;
	}
	public Date getDataModifyDate() {
		return dataModifyDate;
	}
	public void setDataModifyDate(Date dataModifyDate) {
		this.dataModifyDate = dataModifyDate;
	}
	public String getDataUserName() {
		return dataUserName;
	}
	public void setDataUserName(String dataUserName) {
		this.dataUserName = dataUserName;
	}
	public Long getDataUserId() {
		return dataUserId;
	}
	public void setDataUserId(Long dataUserId) {
		this.dataUserId = dataUserId;
	}		
	public String getDataUserTel() {
		return dataUserTel;
	}
	public void setDataUserTel(String dataUserTel) {
		this.dataUserTel = dataUserTel;
	}
	public String getDataRemark() {
		return dataRemark;
	}
	public void setDataRemark(String dataRemark) {
		this.dataRemark = dataRemark;
	}
	public String getDataOperaStatus() {
		return dataOperaStatus;
	}
	public void setDataOperaStatus(String dataOperaStatus) {
		this.dataOperaStatus = dataOperaStatus;
	}
	public String getDataOperaUserName() {
		return dataOperaUserName;
	}
	public void setDataOperaUserName(String dataOperaUserName) {
		this.dataOperaUserName = dataOperaUserName;
	}
	public Long getDataOperaUserId() {
		return dataOperaUserId;
	}
	public void setDataOperaUserId(Long dataOperaUserId) {
		this.dataOperaUserId = dataOperaUserId;
	}
	public BigDecimal getDataRulePcx() {
		return dataRulePcx;
	}
	public void setDataRulePcx(BigDecimal dataRulePcx) {
		this.dataRulePcx = dataRulePcx;
	}
	public BigDecimal getDataRuleJjx() {
		return dataRuleJjx;
	}
	public void setDataRuleJjx(BigDecimal dataRuleJjx) {
		this.dataRuleJjx = dataRuleJjx;
	}
	public BigDecimal getDataPzje() {
		return dataPzje;
	}
	public void setDataPzje(BigDecimal dataPzje) {
		this.dataPzje = dataPzje;
	}
	public BigDecimal getZfzje() {
		return zfzje;
	}
	public void setZfzje(BigDecimal zfzje) {
		this.zfzje = zfzje;
	}
	public BigDecimal getZfglf() {
		return zfglf;
	}
	public void setZfglf(BigDecimal zfglf) {
		this.zfglf = zfglf;
	}
	public String getDataJyzf() {
		return dataJyzf;
	}
	public void setDataJyzf(String dataJyzf) {
		this.dataJyzf = dataJyzf;
	}
	public String getDataJymm() {
		return dataJymm;
	}
	public void setDataJymm(String dataJymm) {
		this.dataJymm = dataJymm;
	}
	public Date getDataJyzfDate() {
		return dataJyzfDate;
	}
	public void setDataJyzfDate(Date dataJyzfDate) {
		this.dataJyzfDate = dataJyzfDate;
	}
	public Date getDataJyfcDate() {
		return dataJyfcDate;
	}
	public void setDataJyfcDate(Date dataJyfcDate) {
		this.dataJyfcDate = dataJyfcDate;
	}
}
