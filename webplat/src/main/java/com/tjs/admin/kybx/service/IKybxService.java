package com.tjs.admin.kybx.service;

import java.util.List;

import com.tjs.admin.kybx.controller.KybxCtrlModel;
import com.tjs.admin.kybx.model.Kybx;

public interface IKybxService {
	
	public int countKybx(KybxCtrlModel kybxCtrlModel);
	
	public int  insertKybx(Kybx kybx);
	
	public int updateKybx(Kybx kybx);
	
	public void deleteKybx(Long kybxId);
	
	public void deleteBatchKybx(Long[] KybxIds);
		
	public Kybx findBykybxId(Long kybxId);
	
	public List<Kybx> selectKybx(KybxCtrlModel kybxCtrlModel);

}
