package com.tjs.admin.peizi.service.impl;

import java.math.BigDecimal;
import java.util.Calendar;
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
import com.tjs.admin.utils.BigDecimalUtils;
import com.tjs.admin.utils.DateTimeUtils;
import com.tjs.admin.utils.StringUtils;
import com.tjs.admin.zhifu.controller.CustomerFundCtrlModel;
import com.tjs.admin.zhifu.exception.DuplicateException;
import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.model.FundRecord;
import com.tjs.admin.zhifu.service.ICustomerFund;
import com.tjs.admin.zhifu.service.IFundRecord;
import com.tjs.admin.zhifu.zfenum.FundRecordFundTypeEnum;

@Service
public class PeiziImpl implements IPeizi {

	
	@Resource
    private PeiziMapper peiziMapper;
	
	 @Resource
	 IFundRecord fundRecordService;
	 
	 @Resource
	 ICustomerFund customerFundService;
	 
	 
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
			//配资完成金额，收益为整数									 
			CustomerFundCtrlModel customerFundCtrlModel = new CustomerFundCtrlModel();
			customerFundCtrlModel.getCustomerFund().setCustomerId(peizi.getDataUserId());
			List<CustomerFund> lstCustomerFund = customerFundService.selectCustomerFund(customerFundCtrlModel);
			CustomerFund customerFund = lstCustomerFund.get(0);
			
			//收益为为正数
			if(BigDecimalUtils.isGreaterThan(peizi.getDataProfit(), BigDecimal.ZERO)
				||BigDecimalUtils.isEquals(peizi.getDataProfit(), BigDecimal.ZERO)){
				//2、插入个人资金流水				
				//2.1 返还风险保证金
				FundRecord fundRecord1 = new FundRecord();
				fundRecord1.setAmount(oldPeizi.getDataTzbzj());
				fundRecord1.setBusinessId(oldPeizi.getDataId());
				fundRecord1.setCreateBy(oldPeizi.getDataUserName());
				fundRecord1.setCreateTime(Calendar.getInstance().getTime());
				fundRecord1.setCustomerId(oldPeizi.getDataUserId());
				fundRecord1.setFundType(FundRecordFundTypeEnum.HHTZBZJ.getKey());
				fundRecord1.setRecordDesc(FundRecordFundTypeEnum.HHTZBZJ.getValue());
				fundRecord1.setUsableAmount(BigDecimalUtils.add(customerFund.getUsebleFund(), oldPeizi.getDataTzbzj()));
				
				customerFund.setUsebleFund(BigDecimalUtils.add(customerFund.getUsebleFund(),oldPeizi.getDataTzbzj()));
				customerFund.setFxbzFund(BigDecimalUtils.subtractZero(customerFund.getFxbzFund(), oldPeizi.getDataTzbzj()));
				fundRecordService.insertFundRecord(fundRecord1);
				
				//2.2扣除配资金额
				FundRecord fundRecord2 = new FundRecord();
				fundRecord2.setAmount(oldPeizi.getDataPzje());
				fundRecord2.setBusinessId(oldPeizi.getDataId());
				fundRecord2.setCreateBy(oldPeizi.getDataUserName());
				fundRecord2.setCreateTime(Calendar.getInstance().getTime());
				fundRecord2.setCustomerId(oldPeizi.getDataUserId());
				fundRecord2.setFundType(FundRecordFundTypeEnum.SHPZJE.getKey());
				fundRecord2.setRecordDesc(FundRecordFundTypeEnum.SHPZJE.getValue());
				fundRecord2.setUsableAmount(customerFund.getUsebleFund());
				
				customerFund.setPeiziFund(BigDecimalUtils.subtractZero(customerFund.getPeiziFund(), oldPeizi.getDataPzje()));
				fundRecordService.insertFundRecord(fundRecord2);
				//2.3收益
				if(!BigDecimalUtils.isEquals(peizi.getDataProfit(), BigDecimal.ZERO)){
				FundRecord fundRecord3 = new FundRecord();
				fundRecord3.setAmount(peizi.getDataProfit());
				fundRecord3.setBusinessId(oldPeizi.getDataId());
				fundRecord3.setCreateBy(oldPeizi.getDataUserName());
				fundRecord3.setCreateTime(Calendar.getInstance().getTime());
				fundRecord3.setCustomerId(oldPeizi.getDataUserId());
				fundRecord3.setFundType(FundRecordFundTypeEnum.PZSH.getKey());
				fundRecord3.setRecordDesc(FundRecordFundTypeEnum.PZSH.getValue());
				fundRecord3.setUsableAmount(BigDecimalUtils.add(customerFund.getUsebleFund(), peizi.getDataProfit()));
				
				customerFund.setTotalFund(BigDecimalUtils.add(customerFund.getTotalFund(),peizi.getDataProfit()));
				customerFund.setUsebleFund(BigDecimalUtils.add(customerFund.getUsebleFund(),peizi.getDataProfit()));
				
				fundRecordService.insertFundRecord(fundRecord3);
				}
			
				//3、更新个人账户资金信息	
				int iupdateCount = customerFundService.updateCustomerFund(customerFund);
				if(iupdateCount==0){
					throw new DuplicateException("操作冲突");
				}
			}else{
				//2.1扣除风险保证金
				FundRecord fundRecord1 = new FundRecord();
				BigDecimal reslut = BigDecimalUtils.add(peizi.getDataProfit(), oldPeizi.getDataTzbzj());
				if(BigDecimalUtils.isEquals(reslut, BigDecimal.ZERO)
						||BigDecimalUtils.isLessThan(reslut, BigDecimal.ZERO)){
					fundRecord1.setAmount(oldPeizi.getDataTzbzj());
					
				}else{
					fundRecord1.setAmount(peizi.getDataProfit().abs());
				}				
				fundRecord1.setBusinessId(oldPeizi.getDataId());
				fundRecord1.setCreateBy(oldPeizi.getDataUserName());
				fundRecord1.setCreateTime(Calendar.getInstance().getTime());
				fundRecord1.setCustomerId(oldPeizi.getDataUserId());
				fundRecord1.setFundType(FundRecordFundTypeEnum.KCFXBZJ.getKey());
				fundRecord1.setRecordDesc(FundRecordFundTypeEnum.KCFXBZJ.getValue()+":由于配资收益为"+BigDecimalUtils.format(peizi.getDataProfit())+"元");
				fundRecord1.setUsableAmount(customerFund.getUsebleFund());
				fundRecordService.insertFundRecord(fundRecord1);
				
				//2.2风险保证金还存在
				if(BigDecimalUtils.isGreaterThan(reslut, BigDecimal.ZERO)){
					FundRecord fundRecord2 = new FundRecord();
					fundRecord2.setAmount(reslut);
					fundRecord2.setBusinessId(oldPeizi.getDataId());
					fundRecord2.setCreateBy(oldPeizi.getDataUserName());
					fundRecord2.setCreateTime(Calendar.getInstance().getTime());
					fundRecord2.setCustomerId(oldPeizi.getDataUserId());
					fundRecord2.setFundType(FundRecordFundTypeEnum.HHTZBZJ.getKey());
					fundRecord2.setRecordDesc(FundRecordFundTypeEnum.HHTZBZJ.getValue());
					fundRecord2.setUsableAmount(BigDecimalUtils.add(customerFund.getUsebleFund(),reslut));
					
					customerFund.setUsebleFund(BigDecimalUtils.add(customerFund.getUsebleFund(),reslut));
										
					fundRecordService.insertFundRecord(fundRecord2);					
				}
				
				customerFund.setFxbzFund(BigDecimalUtils.subtractZero(customerFund.getFxbzFund(), oldPeizi.getDataTzbzj()));
					
				//2.3扣除配资金额
				FundRecord fundRecord3 = new FundRecord();
				fundRecord3.setAmount(oldPeizi.getDataPzje());
				fundRecord3.setBusinessId(oldPeizi.getDataId());
				fundRecord3.setCreateBy(oldPeizi.getDataUserName());
				fundRecord3.setCreateTime(Calendar.getInstance().getTime());
				fundRecord3.setCustomerId(oldPeizi.getDataUserId());
				fundRecord3.setFundType(FundRecordFundTypeEnum.SHPZJE.getKey());
				fundRecord3.setRecordDesc(FundRecordFundTypeEnum.SHPZJE.getValue());
				fundRecord3.setUsableAmount(customerFund.getUsebleFund());
				
				customerFund.setPeiziFund(BigDecimalUtils.subtractZero(customerFund.getPeiziFund(), oldPeizi.getDataPzje()));
				fundRecordService.insertFundRecord(fundRecord3);
				
				//3、更新个人账户资金信息	
				int iupdateCount = customerFundService.updateCustomerFund(customerFund);
				if(iupdateCount==0){
					throw new DuplicateException("操作冲突");
				}
				
			}
			
		}
		
		return 1;
	}

	@Override
	public int CancelPeizi(Peizi peizi, UserInfo userInfo) {
		
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
			peizi.setDataOperaStatus(OperaStatusEnum.PZCANCEL.getKey());
			peizi.setDataModifyDate(new Date());
		}else if(OperaStatusEnum.CPZHONG.getKey().equals(oldPeizi.getDataOperaStatus())){
			peizi.setDataOperaUserName(oldPeizi.getDataOperaUserName());
			peizi.setDataModifyDate(oldPeizi.getDataModifyDate());
			peizi.setDataAuditBy(userInfo.getName());
			peizi.setDataOperaStatus(OperaStatusEnum.PZCANCEL.getKey());
			peizi.setDataCpfDate(new Date());
		}
		//1、更新配资业务单据
		int icount = peiziMapper.updatePeizi(peizi);
		if(icount==0){
			throw new DuplicateException("操作冲突");
		}
		
		if(OperaStatusEnum.PZCANCEL.getKey().equals(peizi.getDataOperaStatus())){
			CustomerFundCtrlModel customerFundCtrlModel = new CustomerFundCtrlModel();
			customerFundCtrlModel.getCustomerFund().setCustomerId(peizi.getDataUserId());
			List<CustomerFund> lstCustomerFund = customerFundService.selectCustomerFund(customerFundCtrlModel);
			CustomerFund customerFund = lstCustomerFund.get(0);
			
			//2.1 返还风险保证金
			FundRecord fundRecord1 = new FundRecord();
			fundRecord1.setAmount(oldPeizi.getDataTzbzj());
			fundRecord1.setBusinessId(oldPeizi.getDataId());
			fundRecord1.setCreateBy(oldPeizi.getDataUserName());
			fundRecord1.setCreateTime(Calendar.getInstance().getTime());
			fundRecord1.setCustomerId(oldPeizi.getDataUserId());
			fundRecord1.setFundType(FundRecordFundTypeEnum.HHTZBZJ.getKey());
			fundRecord1.setRecordDesc(FundRecordFundTypeEnum.HHTZBZJ.getValue());
			fundRecord1.setUsableAmount(BigDecimalUtils.add(customerFund.getUsebleFund(), oldPeizi.getDataTzbzj()));
			
			
			customerFund.setUsebleFund(BigDecimalUtils.add(customerFund.getUsebleFund(),oldPeizi.getDataTzbzj()));
			customerFund.setFxbzFund(BigDecimalUtils.subtractZero(customerFund.getFxbzFund(), oldPeizi.getDataTzbzj()));
			fundRecordService.insertFundRecord(fundRecord1);
			
			//2.2扣除配资金额
			FundRecord fundRecord2 = new FundRecord();
			fundRecord2.setAmount(oldPeizi.getDataPzje());
			fundRecord2.setBusinessId(oldPeizi.getDataId());
			fundRecord2.setCreateBy(oldPeizi.getDataUserName());
			fundRecord2.setCreateTime(Calendar.getInstance().getTime());
			fundRecord2.setCustomerId(oldPeizi.getDataUserId());
			fundRecord2.setFundType(FundRecordFundTypeEnum.SHPZJE.getKey());
			fundRecord2.setRecordDesc(FundRecordFundTypeEnum.SHPZJE.getValue());
			fundRecord2.setUsableAmount(customerFund.getUsebleFund());
			
			customerFund.setPeiziFund(BigDecimalUtils.subtractZero(customerFund.getPeiziFund(), oldPeizi.getDataPzje()));
			fundRecordService.insertFundRecord(fundRecord2);
			
			
			//2.3返回借款利息
			FundRecord fundRecord3 = new FundRecord();
			fundRecord3.setAmount(oldPeizi.getDataJklxTotal());
			fundRecord3.setBusinessId(oldPeizi.getDataId());
			fundRecord3.setCreateBy(oldPeizi.getDataUserName());
			fundRecord3.setCreateTime(Calendar.getInstance().getTime());
			fundRecord3.setCustomerId(oldPeizi.getDataUserId());
			fundRecord3.setFundType(FundRecordFundTypeEnum.FHJKLX.getKey());
			fundRecord3.setRecordDesc(FundRecordFundTypeEnum.FHJKLX.getValue());
			fundRecord3.setUsableAmount(BigDecimalUtils.add(customerFund.getUsebleFund(), oldPeizi.getDataJklxTotal()));
			
			customerFund.setTotalFund(BigDecimalUtils.add(customerFund.getTotalFund(),oldPeizi.getDataJklxTotal()));
			customerFund.setUsebleFund(BigDecimalUtils.add(customerFund.getUsebleFund(),oldPeizi.getDataJklxTotal()));
			fundRecordService.insertFundRecord(fundRecord3);
			
			//3、更新个人账户资金信息	
			int iupdateCount = customerFundService.updateCustomerFund(customerFund);
			if(iupdateCount==0){
				throw new DuplicateException("操作冲突");
			}
		}
		
		return 1;
	}

}
