package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.model.PETopProduct;

/**
 * 私募产品DAO
 * 
 *@Author zhsoft
 *@Time 2015年3月25日
 *
 **/
public interface PEIndexMapper  {
	
	List<PETopProduct> getTop4PEProductList();
}