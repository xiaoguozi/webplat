package com.tjs.admin.kybx.dao;

import java.util.List;

import com.tjs.admin.kybx.controller.KybxCtrlModel;
import com.tjs.admin.kybx.model.Kybx;

/**
 * 数据库操作接口类
 * @author Administrator
 *
 */
public interface KybxMapper  {
  	
	public int countKybx(KybxCtrlModel kybxCtrlModel);
	
	public int  insertKybx(Kybx kybx);
	
	public int updateKybx(Kybx kybx);
	
	public void deleteKybx(Long kybxId);
	
	public void deleteBatchKybx(Long[] KybxIds);
		
	public Kybx findBykybxId(Long kybxId);
	
	public List<Kybx> selectKybx(KybxCtrlModel kybxCtrlModel);
		
}


