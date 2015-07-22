package com.tjs.admin.wx.model;

public class WxTick {
	/**业务流水号 */
	private Long tickId;
	/**凭证号*/
	private String tickName;
	/**凭证请求时间 */
	private Long tickDate;
	/**token请求时间 */
	private Long tokenDate;
	/**凭证过期时长 */
	private Long tickInterval;
	
	public Long getTickId() {
		return tickId;
	}
	public void setTickId(Long tickId) {
		this.tickId = tickId;
	}
	public String getTickName() {
		return tickName;
	}
	public void setTickName(String tickName) {
		this.tickName = tickName;
	}
	public Long getTickDate() {
		return tickDate;
	}
	public void setTickDate(Long tickDate) {
		this.tickDate = tickDate;
	}
	public Long getTickInterval() {
		return tickInterval;
	}
	public void setTickInterval(Long tickInterval) {
		this.tickInterval = tickInterval;
	}
	public Long getTokenDate() {
		return tokenDate;
	}
	public void setTokenDate(Long tokenDate) {
		this.tokenDate = tokenDate;
	}
	
	
	
}
