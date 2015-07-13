package com.tjs.admin.utils;

import java.util.*;

public class ExportMo
{

    public ExportMo()
    {
    	
    }
    public String tableName;
    
    /**导出的字段ming*/
    private List<String> columns;
    /**导出的标题*/
    private List<String> columnTitles;
    /**导出的类型*/
    private List<String> columnTypes;
    
    /**导出的值*/
    private List<?> values;
    
    
    
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public List<String> getColumns() {
		return columns;
	}

	public void setColumns(List<String> columns) {
		this.columns = columns;
	}

	public List<String> getColumnTitles() {
		return columnTitles;
	}

	public void setColumnTitles(List<String> columnTitles) {
		this.columnTitles = columnTitles;
	}

	public List<String> getColumnTypes() {
		return columnTypes;
	}

	public void setColumnTypes(List<String> columnTypes) {
		this.columnTypes = columnTypes;
	}

	public List<?> getValues() {
		return values;
	}

	public void setValues(List<?> values) {
		this.values = values;
	}
    
}
