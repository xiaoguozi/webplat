package com.tjs.web.peizi.model;

import java.util.Date;

public class FreePeiziDetailVO {

	/** 主键 */
	private Long id;
	
	/** 当前活动日期 */
	private Date peiziDate;
	
	/** 配资类型 */
	private int peiziType;
	
	/** 计数 */
	private int peiziCount;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getPeiziDate() {
		return peiziDate;
	}

	public void setPeiziDate(Date peiziDate) {
		this.peiziDate = peiziDate;
	}

	public int getPeiziType() {
		return peiziType;
	}

	public void setPeiziType(int peiziType) {
		this.peiziType = peiziType;
	}

	public int getPeiziCount() {
		return peiziCount;
	}

	public void setPeiziCount(int peiziCount) {
		this.peiziCount = peiziCount;
	}
	
	
	
}
