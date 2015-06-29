package com.tjs.admin.zhifu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.zhifu.controller.RechargeCtrlModel;
import com.tjs.admin.zhifu.dao.RechargeMapper;
import com.tjs.admin.zhifu.model.Recharge;
import com.tjs.admin.zhifu.service.IRecharge;

public class RechargeImpl implements IRecharge {

	
	@Resource
	RechargeMapper rechargeMapper;
	
	@Override
	public int countRecharge(RechargeCtrlModel rechargeCtrlModel) {
		// TODO Auto-generated method stub
		return rechargeMapper.countRecharge(rechargeCtrlModel);
	}

	@Override
	public List<Recharge> selectRecharge(RechargeCtrlModel rechargeCtrlModel) {
		// TODO Auto-generated method stub
		return rechargeMapper.selectRecharge(rechargeCtrlModel);
	}

	@Override
	public int insertRecharge(Recharge recharge) {
		// TODO Auto-generated method stub
		return rechargeMapper.insertRecharge(recharge);
	}

	@Override
	public int updateRecharge(Recharge recharge) {
		// TODO Auto-generated method stub
		return rechargeMapper.updateRecharge(recharge);
	}

	@Override
	public void deleteRecharge(Long rechangeId) {
		// TODO Auto-generated method stub
		rechargeMapper.deleteRecharge(rechangeId);
		
	}

	@Override
	public Recharge findByRechargeId(Long rechangeId) {
		// TODO Auto-generated method stub
		return rechargeMapper.findByRechargeId(rechangeId);
	}

}
