package com.tjs.admin.kybx.model;

import java.util.Date;

public class Kybx {
	/*基本信息：
	保险名称、年限选择、投保年龄、保险金额、产品亮点
	富文本四项：
	产品信息、保障计划、理赔流程、常见问题、保险条款*/
	private Long kybxId;
	/**保险名称 */
	private String  kybxName;
	/**保险公司名称 */
	private String  kybxCompanyName;	
	/**年限选择*/
	private String kybxChoose;
	/**投保年龄*/
	private String kybxAge;
	/**保险金额*/
	private String kybxAmont;
	/**产品亮点*/
	private String kybxGood;
	/**产品信息*/
	private String kybxInfo;
	/**保障计划*/
	private String kybxPlan;
	/**理赔流程*/
	private String kybxLplc;
	/**常见问题*/
	private String kybxQuestion;
	/**保险条款*/
	private String kybxTk;
	/**产品状态*/
	private String kybxStatus;
	
	private String kybxTjw;
	
	/**推荐位*/
	private Integer kybxTjno;
	/**创建时间*/
	private Date kybxCreateDate;
	/**创建人*/
	private String kybxCreateBy;
	/**修改时间*/
	private Date kybxModifyDate;
	/**修改人*/
	private String kybxModifyBy;
	/**产品大类：10 寿险 20 医疗 30保费隔资*/
	private String  kybxClass;
	/**产品小类：待定*/
	private String kybxSubclass;	
	/**产品对应图片路径*/
	private String kybxImgUrl;	
	/**上传资料路径*/
	private String kybxZlUrl;
	/**产品优势*/
	private String kybxCpys;
	/**适合人群*/
	private String kybxShrq;
	/**产品简称*/
	private String kybxShortName;
	
	
	
	public Long getKybxId() {
		return kybxId;
	}
	public void setKybxId(Long kybxId) {
		this.kybxId = kybxId;
	}
	public String getKybxName() {
		return kybxName;
	}
	public void setKybxName(String kybxName) {
		this.kybxName = kybxName;
	}
	public String getKybxChoose() {
		return kybxChoose;
	}
	public void setKybxChoose(String kybxChoose) {
		this.kybxChoose = kybxChoose;
	}
	public String getKybxAge() {
		return kybxAge;
	}
	public void setKybxAge(String kybxAge) {
		this.kybxAge = kybxAge;
	}
	public String getKybxAmont() {
		return kybxAmont;
	}
	public void setKybxAmont(String kybxAmont) {
		this.kybxAmont = kybxAmont;
	}
	public String getKybxGood() {
		return kybxGood;
	}
	public void setKybxGood(String kybxGood) {
		this.kybxGood = kybxGood;
	}
	public String getKybxInfo() {
		return kybxInfo;
	}
	public void setKybxInfo(String kybxInfo) {
		this.kybxInfo = kybxInfo;
	}
	public String getKybxPlan() {
		return kybxPlan;
	}
	public void setKybxPlan(String kybxPlan) {
		this.kybxPlan = kybxPlan;
	}
	public String getKybxLplc() {
		return kybxLplc;
	}
	public void setKybxLplc(String kybxLplc) {
		this.kybxLplc = kybxLplc;
	}
	public String getKybxQuestion() {
		return kybxQuestion;
	}
	public void setKybxQuestion(String kybxQuestion) {
		this.kybxQuestion = kybxQuestion;
	}
	public String getKybxTk() {
		return kybxTk;
	}
	public void setKybxTk(String kybxTk) {
		this.kybxTk = kybxTk;
	}
	public String getKybxStatus() {
		return kybxStatus;
	}
	public void setKybxStatus(String kybxStatus) {
		this.kybxStatus = kybxStatus;
	}
	public Integer getKybxTjno() {
		return kybxTjno;
	}
	public void setKybxTjno(Integer kybxTjno) {
		this.kybxTjno = kybxTjno;
	}

	public String getKybxCreateBy() {
		return kybxCreateBy;
	}
	public void setKybxCreateBy(String kybxCreateBy) {
		this.kybxCreateBy = kybxCreateBy;
	}

	public Date getKybxCreateDate() {
		return kybxCreateDate;
	}
	public void setKybxCreateDate(Date kybxCreateDate) {
		this.kybxCreateDate = kybxCreateDate;
	}
	public Date getKybxModifyDate() {
		return kybxModifyDate;
	}
	public void setKybxModifyDate(Date kybxModifyDate) {
		this.kybxModifyDate = kybxModifyDate;
	}
	public String getKybxModifyBy() {
		return kybxModifyBy;
	}
	public void setKybxModifyBy(String kybxModifyBy) {
		this.kybxModifyBy = kybxModifyBy;
	}
	public String getKybxClass() {
		return kybxClass;
	}
	public void setKybxClass(String kybxClass) {
		this.kybxClass = kybxClass;
	}
	public String getKybxSubclass() {
		return kybxSubclass;
	}
	public void setKybxSubclass(String kybxSubclass) {
		this.kybxSubclass = kybxSubclass;
	}
	public String getKybxTjw() {
		return kybxTjw;
	}
	public void setKybxTjw(String kybxTjw) {
		this.kybxTjw = kybxTjw;
	}
	public String getKybxImgUrl() {
		return kybxImgUrl;
	}
	public void setKybxImgUrl(String kybxImgUrl) {
		this.kybxImgUrl = kybxImgUrl;
	}
	public String getKybxZlUrl() {
		return kybxZlUrl;
	}
	public void setKybxZlUrl(String kybxZlUrl) {
		this.kybxZlUrl = kybxZlUrl;
	}
	public String getKybxCpys() {
		return kybxCpys;
	}
	public void setKybxCpys(String kybxCpys) {
		this.kybxCpys = kybxCpys;
	}
	public String getKybxShrq() {
		return kybxShrq;
	}
	public void setKybxShrq(String kybxShrq) {
		this.kybxShrq = kybxShrq;
	}
	public String getKybxCompanyName() {
		return kybxCompanyName;
	}
	public void setKybxCompanyName(String kybxCompanyName) {
		this.kybxCompanyName = kybxCompanyName;
	}
	public String getKybxShortName() {
		return kybxShortName;
	}
	public void setKybxShortName(String kybxShortName) {
		this.kybxShortName = kybxShortName;
	}
	
	

}
