package com.tjs.admin.zhifu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.zhifu.controller.WithdrawCtrlModel;
import com.tjs.admin.zhifu.dao.WithdrawMapper;
import com.tjs.admin.zhifu.model.Withdraw;
import com.tjs.admin.zhifu.service.IWithdraw;

@Service
public class WithdrawImpl implements IWithdraw{
	
	@Resource
	WithdrawMapper withdrawMapper;
	
	@Override
	public int countWithdraw(WithdrawCtrlModel withdrawCtrlModel) {
		// TODO Auto-generated method stub
		return withdrawMapper.countWithdraw(withdrawCtrlModel);
	}

	@Override
	public List<Withdraw> selectWithdraw(WithdrawCtrlModel withdrawCtrlModel) {
		// TODO Auto-generated method stub
		return withdrawMapper.selectWithdraw(withdrawCtrlModel);
	}

	@Override
	public int insertWithdraw(Withdraw withdraw) {
		// TODO Auto-generated method stub
		return withdrawMapper.insertWithdraw(withdraw);
	}

	@Override
	public int updateWithdraw(Withdraw withdraw) {
		// TODO Auto-generated method stub
		return withdrawMapper.updateWithdraw(withdraw);
	}

	@Override
	public int deleteWithdraw(Long withdrawId) {
		// TODO Auto-generated method stub
		return withdrawMapper.deleteWithdraw(withdrawId);
	}

	@Override
	public Withdraw findByWithdrawId(Long withdrawId) {
		// TODO Auto-generated method stub
		return withdrawMapper.findByWithdrawId(withdrawId);
	}

	@Override
	public List<Withdraw> selectWithdrawByIds(Long[] ids) {
		// TODO Auto-generated method stub
		return withdrawMapper.selectWithdrawByIds(ids);
	}

}
