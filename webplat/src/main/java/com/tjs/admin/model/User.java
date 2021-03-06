package com.tjs.admin.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户模型
 * 
 * @author StarZou
 * @since 2014年7月5日 下午12:07:20
 **/
public class User implements Serializable {
    private Long id;

    private String username;

    private String password;

    private String state;

    private Date createTime;
    
    /**
     * 注册来源，区分是否从高铁之类注册
     */
    private String regFrom;
    
    /**
     * 推荐人
     */
    private Long parent;
    
    /**
     * 姓名
     */
    private String name;
    
    /**
     * 推荐人手机号
     */
    private String rmobileNo;
    
    /**
     * 推荐人姓名
     */
    private String rname;
    
    /**
     * 日期字符串
     */
    private String createDateString;
    

    public User() {

    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRegFrom() {
		return regFrom;
	}

	public void setRegFrom(String regFrom) {
		this.regFrom = regFrom;
	}
	
	public Long getParent() {
		return parent;
	}

	public void setParent(Long parent) {
		this.parent = parent;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRmobileNo() {
		return rmobileNo;
	}

	public void setRmobileNo(String rmobileNo) {
		this.rmobileNo = rmobileNo;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}
	
	public String getCreateDateString() {
		return createDateString;
	}

	public void setCreateDateString(String createDateString) {
		this.createDateString = createDateString;
	}

	@Override
    public String toString() {
        return "User [id=" + id + ", username=" + username + ", password=" + password + ", state=" + state + ", createTime=" + createTime + "]";
    }

}