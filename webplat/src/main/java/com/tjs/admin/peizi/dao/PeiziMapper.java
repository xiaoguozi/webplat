package com.tjs.admin.peizi.dao;

import java.util.List;

import com.tjs.admin.peizi.controller.PeiziCtrlModel;
import com.tjs.admin.peizi.model.Peizi;

/**
 * 数据库操作接口类
 * @author Administrator
 *
 */
public interface PeiziMapper {
	
	/**后期数量*/
    public int countPeizi(PeiziCtrlModel peiziCtrlModel);
    /**查询规则*/
    public List<Peizi> selectPeizi(PeiziCtrlModel peiziCtrlModel);
    /**插入规则*/
	public int  insertPeizi(Peizi peizi);
	/**跟新规则*/
	public int updatePeizi(Peizi peizi);
	/**根据主键删除规则*/
	public void deletePeizi(Long peiziId);
	/**删除规则*/
	public void deleteBatchPeizi(Long[] peiziIds);
	/**根据ID找到规则*/
	public Peizi findByPeiziId(Long peiziId);
	
	public int updateOrderCode(Peizi peizi);
		
}
