package com.tjs.admin.kybx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.kybx.controller.KybxCtrlModel;
import com.tjs.admin.kybx.dao.KybxMapper;
import com.tjs.admin.kybx.model.Kybx;
import com.tjs.admin.kybx.service.IKybxService;
import com.tjs.admin.order.controller.OrderCtrlModel;
import com.tjs.admin.order.model.Order;
import com.tjs.admin.order.service.IOrderService;

/**
 * 预约服务实现类
 * @author Administrator
 *
 */
@Service
public class KybxService implements IKybxService {

	
	@Resource
    private KybxMapper kybxMapper;

	@Override
	public int countKybx(KybxCtrlModel kybxCtrlModel) {
		// TODO Auto-generated method stub
		return kybxMapper.countKybx(kybxCtrlModel);
	}

	@Override
	public int insertKybx(Kybx kybx) {
		// TODO Auto-generated method stub
		return kybxMapper.insertKybx(kybx);
	}

	@Override
	public int updateKybx(Kybx kybx) {
		// TODO Auto-generated method stub
		return kybxMapper.updateKybx(kybx);
	}

	@Override
	public void deleteKybx(Long kybxId) {
		// TODO Auto-generated method stub
		kybxMapper.deleteKybx(kybxId);
		
	}

	@Override
	public void deleteBatchKybx(Long[] KybxIds) {
		// TODO Auto-generated method stub
		kybxMapper.deleteBatchKybx(KybxIds);
		
	}

	@Override
	public Kybx findBykybxId(Long kybxId) {
		// TODO Auto-generated method stub
		return kybxMapper.findBykybxId(kybxId);
	}

	@Override
	public List<Kybx> selectKybx(KybxCtrlModel kybxCtrlModel) {
		// TODO Auto-generated method stub
		return kybxMapper.selectKybx(kybxCtrlModel);
	}

	
	
	

}
