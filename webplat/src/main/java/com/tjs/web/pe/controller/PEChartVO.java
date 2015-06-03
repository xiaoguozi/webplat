package com.tjs.web.pe.controller;

import java.util.ArrayList;
import java.util.List;

public class PEChartVO {

	private String name;
	
	private List<Object[]> data = new ArrayList<Object[]>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Object[]> getData() {
		return data;
	}

	public void setData(List<Object[]> data) {
		this.data = data;
	}

	
	
}
