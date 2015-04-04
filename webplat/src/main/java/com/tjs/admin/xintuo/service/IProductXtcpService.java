package com.tjs.admin.xintuo.service;

import java.util.List;

import com.tjs.admin.xintuo.model.ProductXtcp;

/**
 * 信托产品接口类
 * @author Administrator
 *
 */
public interface IProductXtcpService  {
	
	   public int countProductXtcp(ProductXtcp productXtcp);
		
		public int  insertProductXtcp(ProductXtcp productXtcp);
		
		public int updateProductXtcp(ProductXtcp productXtcp);
		
		public void deleteProductXtcp(Long xtcpId);
		
		public void deleteBatchProductXtcp(Long[] xtcpIds);
		
		public ProductXtcp findByProductXtcpId(Long xtcpId);
		
		public List<ProductXtcp> selectProductXtcp();
}
