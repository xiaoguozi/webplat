package com.tjs.web.model;

import java.util.Date;

/**
 * weblog
 * 
 * @author swpan
 * @since 2014年7月5日 下午12:07:20
 **/
public class WebLog {
    private Long id;

    private String userName;
    private String opCode;
    private String opResult;
    private String opObj;
    private String reqUrl;
    private String reqRef;
    private String reqIp;
    private Date opTime;
    private Date logTime;

    public WebLog() {

    }


    public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getOpCode() {
		return opCode;
	}


	public void setOpCode(String opCode) {
		this.opCode = opCode;
	}


	public String getOpResult() {
		return opResult;
	}


	public void setOpResult(String opResult) {
		this.opResult = opResult;
	}


	public String getOpObj() {
		return opObj;
	}


	public void setOpObj(String opObj) {
		this.opObj = opObj;
	}


	public String getReqUrl() {
		return reqUrl;
	}


	public void setReqUrl(String reqUrl) {
		this.reqUrl = reqUrl;
	}


	public String getReqRef() {
		return reqRef;
	}


	public void setReqRef(String reqRef) {
		this.reqRef = reqRef;
	}


	public String getReqIp() {
		return reqIp;
	}


	public void setReqIp(String reqIp) {
		this.reqIp = reqIp;
	}


	public Date getOpTime() {
		return opTime;
	}


	public void setOpTime(Date opTime) {
		this.opTime = opTime;
	}


	public Date getLogTime() {
		return logTime;
	}


	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}


	@Override
	public String toString() {
		return "WebLog [id=" + id + ", userName=" + userName + ", opCode="
				+ opCode + ", opResult=" + opResult + ", opObj=" + opObj
				+ ", reqUrl=" + reqUrl + ", reqRef=" + reqRef + ", reqIp="
				+ reqIp + ", opTime=" + opTime + ", logTime=" + logTime + "]";
	}



}