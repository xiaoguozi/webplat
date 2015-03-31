package com.tjs.core.generic;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.tjs.core.util.StringExtUtils;


/**
 * <p>
 * Title: GenericCtrl
 * </p>
 * <p>
 * Description:所有控制数据的父类。控制数据是指区别于系统业务数据的数据，如：题头排序、分页数据、查询条件等
 * </p>
 * 
 * @author panshuangwang
 * @date 2011-11-24 上午10:05:27
 */
public class GenericCtrlModel {

	/**
	 * 排序数据：排序字段
	 */
	private String sortField;

	/**
	 * 排序数据：排序方式：asc/desc
	 */
	private String sortType;

	/**
	 * 分页数据：第几页
	 */
	private int pageNo = 1;

	/**
	 * 分页数据：每页显示多少条
	 */
	private int pageSize = 20;

	/**
	 * 分页数据：总记录条数
	 */
	private int totalCount = 0;

	/**
	 * 分页数据: 页标数字显示多少个
	 */
	private int pageNumShown = 5;

	/**
	 * 选中的记录Id字符串，逗号分隔
	 */
	private String selectedIds;

	/**
	 * 获取selectedIds的List对象
	 * 
	 * @return 被选中的Id的集合
	 */
	public List<String> getSelectedIdsList() {
		if (StringExtUtils.isNotBlank(selectedIds)) {
			return Arrays.asList(selectedIds.split(","));
		} else {
			return new ArrayList<String>(0);
		}
	}

	public String getSelectedIds() {
		return selectedIds;
	}

	public void setSelectedIds(String selectedIds) {
		this.selectedIds = selectedIds;
	}

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageNumShown() {
		return pageNumShown;
	}

	public void setPageNumShown(int pageNumShown) {
		this.pageNumShown = pageNumShown;
	}

	/**
	* <p>Title: getRowBounds</p>
	* <p>Description: </p>
	* @return 分页对象
	*/
	public RowBounds getRowBounds() {
		int offset = (pageNo - 1) * pageSize;
		return new RowBounds(offset, pageSize);
	}

}
