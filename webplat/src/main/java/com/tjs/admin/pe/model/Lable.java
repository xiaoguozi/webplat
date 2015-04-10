package com.tjs.admin.pe.model;

/**
 * 标签类
 * 
 *@author zhsoft
 *@since 2015年4月10日
 **/
public class Lable {

	private String id;
	
	private String title;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Lable [id=" + id + ", title=" + title + "]";
	}
	
}
