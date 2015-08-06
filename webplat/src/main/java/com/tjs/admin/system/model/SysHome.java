package com.tjs.admin.system.model;

import java.util.Date;


/**
 *banner图片
 * 
 * @author StarZou
 * @since 14年7月5日 下午1:7:
 **/
public class SysHome {
	/**序号 */
	private Long  homeId;
	/**排序 */
	private Integer orderIndex;
	/**使用类型(0 两者都用 电脑 1 手机 2) */
	private Integer userType;
	/**启用状态（0 不启用 1 启用） */
	private Integer enable;
	/**图片 */
	private String homeImg;
	/** 类型(0 URL 1 自定义内容)*/
	private Integer homeType;
	/**URL */
	private String homeUrl;
	
	private String locationBanner;
	/**内容 */
	private String content;
	/**添加时间 */
	private Date createTime;
	/**添加人 */
	private String createBy;
	/**修改时间 */
	private Date updateTime;
	/**修改人 */
	private String updateBy;
	/**标题 */
	private String title;
	public Long getHomeId() {
		return homeId;
	}
	public void setHomeId(Long homeId) {
		this.homeId = homeId;
	}
	public Integer getOrderIndex() {
		return orderIndex;
	}
	public void setOrderIndex(Integer orderIndex) {
		this.orderIndex = orderIndex;
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	public Integer getEnable() {
		return enable;
	}
	public void setEnable(Integer enable) {
		this.enable = enable;
	}
	public String getHomeImg() {
		return homeImg;
	}
	public void setHomeImg(String homeImg) {
		this.homeImg = homeImg;
	}
	public Integer getHomeType() {
		return homeType;
	}
	public void setHomeType(Integer homeType) {
		this.homeType = homeType;
	}
	public String getHomeUrl() {
		return homeUrl;
	}
	public void setHomeUrl(String homeUrl) {
		this.homeUrl = homeUrl;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocationBanner() {
		return locationBanner;
	}
	public void setLocationBanner(String locationBanner) {
		this.locationBanner = locationBanner;
	}
	
	
	
   
}
