package com.tjs.admin.xintuo.dao;

import java.util.List;

import com.tjs.admin.xintuo.controller.XinTuoCpCtrlModel;
import com.tjs.admin.xintuo.controller.XinTuoSeachCtrlVO;
import com.tjs.admin.xintuo.model.ProductXtcp;

/**
 * 数据库操作接口类
 * @author Administrator
 *
 */
public interface ProductXtcpMapper {
	
    public int countProductXtcp(XinTuoCpCtrlModel xintuoCpCtrlModel);
	
	public int  insertProductXtcp(ProductXtcp productXtcp);
	
	public int updateProductXtcp(ProductXtcp productXtcp);
	
	public void deleteProductXtcp(Long xtcpId);
	
	public void deleteBatchProductXtcp(Long[] xtcpIds);
	
	public ProductXtcp findByProductXtcpId(Long xtcpId);
	
	public List<ProductXtcp> selectProductXtcp(XinTuoCpCtrlModel xintuoCpCtrlModel);

	public List<ProductXtcp> selectProductXtcpIndex();
	
	/**查询信托产品首页上面四个*/		
	public List<ProductXtcp> selectProductXtcpTrustTopIndex(XinTuoCpCtrlModel xintuoCpCtrlModel);		
	/**按信托类型查询产品*/
	public List<ProductXtcp> selectProductXtcpTrustFootIndex(XinTuoCpCtrlModel xintuoCpCtrlModel);

	/**查询信托产品*/		
	public int countProductXtcpTrust(XinTuoSeachCtrlVO xinTuoSeachCtrlVO);		
	/**查询信托产品*/
	public List<ProductXtcp> selectProductXtcpTrust(XinTuoSeachCtrlVO xinTuoSeachCtrlVO);
}
