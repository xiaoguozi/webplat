package com.tjs.admin.peizi.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.peizi.constants.OperaStatusEnum;
import com.tjs.admin.peizi.controller.PeiziCtrlModel;
import com.tjs.admin.peizi.dao.PeiziMapper;
import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.utils.DateTimeUtils;
import com.tjs.admin.utils.StringUtils;
import com.tjs.admin.zhifu.exception.DuplicateException;

@Service
public class PeiziImpl implements IPeizi {

	
	@Resource
    private PeiziMapper peiziMapper;
	@Override
	public int countPeizi(PeiziCtrlModel peiziCtrlModel) {
		return peiziMapper.countPeizi(peiziCtrlModel);
	}

	@Override
	public List<Peizi> selectPeizi(PeiziCtrlModel peiziCtrlModel) {
		return peiziMapper.selectPeizi(peiziCtrlModel);
	}

	@Override
	public int insertPeizi(Peizi peizi) {
		String dataOrderCode = "PZ"+DateTimeUtils.formatDate(new Date(), "yyyyMMdd");
		peizi.setLockId(1);
		peiziMapper.insertPeizi(peizi);	//获取主键
		dataOrderCode = dataOrderCode+StringUtils.leftlengthPad(String.valueOf(peizi.getDataId()), 6, '0');
		peizi.setDataOrderCode(dataOrderCode);				
		return peiziMapper.updateOrderCode(peizi);
	}

	@Override
	public int updatePeizi(Peizi peizi) {
		return peiziMapper.updatePeizi(peizi);
	}

	@Override
	public void deletePeizi(Long peiziId) {
		peiziMapper.deletePeizi(peiziId);
		
	}

	@Override
	public void deleteBatchPeizi(Long[] peiziIds) {
		peiziMapper.deleteBatchPeizi(peiziIds);
	}

	@Override
	public Peizi findByPeiziId(Long peiziId) {
		return peiziMapper.findByPeiziId(peiziId);
	}

	@Override
	public int updatePeiziBiz(Peizi peizi, UserInfo userInfo) {
		Peizi oldPeizi = this.findByPeiziId(peizi.getDataId());
		if(!oldPeizi.getLockId().equals(peizi.getLockId())){
			throw new DuplicateException("操作冲突");
		}
		
		if(OperaStatusEnum.YWJIE.getKey().equals(oldPeizi.getDataOperaStatus())||
				OperaStatusEnum.PZCANCEL.getKey().equals(oldPeizi.getDataOperaStatus())	){
			return 1;
		}
		
		if(OperaStatusEnum.PZZhong.getKey().equals(oldPeizi.getDataOperaStatus())){
			peizi.setDataOperaUserName(userInfo.getName());
			peizi.setDataOperaStatus(OperaStatusEnum.CPZHONG.getKey());
			peizi.setDataModifyDate(new Date());
		}else if(OperaStatusEnum.CPZHONG.getKey().equals(oldPeizi.getDataOperaStatus())){
			peizi.setDataOperaUserName(oldPeizi.getDataOperaUserName());
			peizi.setDataModifyDate(oldPeizi.getDataModifyDate());
			peizi.setDataAuditBy(userInfo.getName());
			peizi.setDataOperaStatus(OperaStatusEnum.YWJIE.getKey());
			peizi.setDataCpfDate(new Date());
		}
		//1、更新配资业务单据
		int icount = peiziMapper.updatePeizi(peizi);
		if(icount==0){
			throw new DuplicateException("操作冲突");
		}
		
		//如果配资完成
		if(OperaStatusEnum.YWJIE.getKey().equals(peizi.getDataOperaStatus())){
			//2、更新个人账户资金信息
			
			//3、插入个人资金流水
		}
		
		return 1;
	}

	@Override
	public int CancelPeizi(Peizi peizi, UserInfo userInfo) {
		return 1;
	}

}
