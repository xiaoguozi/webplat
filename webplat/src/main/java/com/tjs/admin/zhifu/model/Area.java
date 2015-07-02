package com.tjs.admin.zhifu.model;

public class Area {
	private Integer id;
	private Integer pid;
	private String code;
	private String tempPcode;
	private String nameCn;
	private String nameEn;
	private Integer dispalyOrder;
	private Integer status;
	private Integer level;
	private String privinceArea;
	private String shortName;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getNameCn() {
		return nameCn;
	}
	public void setNameCn(String nameCn) {
		this.nameCn = nameCn;
	}
	public String getNameEn() {
		return nameEn;
	}
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	public Integer getDispalyOrder() {
		return dispalyOrder;
	}
	public void setDispalyOrder(Integer dispalyOrder) {
		this.dispalyOrder = dispalyOrder;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getPrivinceArea() {
		return privinceArea;
	}
	public void setPrivinceArea(String privinceArea) {
		this.privinceArea = privinceArea;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public String getTempPcode() {
		return tempPcode;
	}
	public void setTempPcode(String tempPcode) {
		this.tempPcode = tempPcode;
	}


}
