package com.tjs.web.peizi.service.impl;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.peizi.constants.OperaStatusEnum;
import com.tjs.admin.peizi.constants.PeiziTypeEnum;
import com.tjs.admin.peizi.controller.PeiziRuleCtrlModel;
import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.peizi.model.PeiziRule;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.peizi.service.IPeiziRule;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.BigDecimalUtils;
import com.tjs.web.constants.PeiZiConstants;
import com.tjs.web.peizi.controller.PZIndexCtrlModel;
import com.tjs.web.peizi.dao.PeiZiIndexMapper;
import com.tjs.web.peizi.model.FreePeiziDetailVO;
import com.tjs.web.peizi.model.UserInfoExtendVO;
import com.tjs.web.peizi.service.IPeiZiIndexService;

@Service
public class PeiZiIndexService implements IPeiZiIndexService {

	@Resource
	private PeiZiIndexMapper peiZiIndexMapper;
	
	@Resource
	private UserService userService;
	
	@Resource
	private IPeizi peiziService;
	
	@Resource
	IPeiziRule iPeiziRule;
	
	@Resource
    private UserInfoService userInfoService;
	
	@Override
	public int checkFreePeiZiIsValid(PZIndexCtrlModel pzIndexCtrlModel) {
		
		//前提用户已登录，在路径中已经配置
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		
		//查询用户
		pzIndexCtrlModel.setUserId(user.getId());
		//pzIndexCtrlModel.setPeiziType(pzIndexCtrlModel.getPeiziType());
		List<UserInfoExtendVO> lstUserVO = peiZiIndexMapper.getUserInfoExtendList(pzIndexCtrlModel);
		
	    List<FreePeiziDetailVO> lstPZVO = peiZiIndexMapper.getFreePeiziDetailList(pzIndexCtrlModel);
		if(lstPZVO==null || lstPZVO.size()==0){
			//1、新增当日活动计数记录
			FreePeiziDetailVO vo = new FreePeiziDetailVO();
			vo.setPeiziDate(Calendar.getInstance().getTime());
			vo.setPeiziCount(1);
			vo.setPeiziType(pzIndexCtrlModel.getPeiziType());
			peiZiIndexMapper.insertFreePeiziDetailVO(vo);
			
			if(lstUserVO==null || lstUserVO.size()==0){
				//2、新增用户扩展信息表记录
				UserInfoExtendVO userInfoExtendVO = new UserInfoExtendVO();
				userInfoExtendVO.setUserId(user.getId());
				userInfoExtendVO.setIsOwnResource(PeiZiConstants.IS_OWN_RESOURCE);
				userInfoExtendVO.setPeiziType(pzIndexCtrlModel.getPeiziType());
				peiZiIndexMapper.insertUserInfoExtendVO(userInfoExtendVO);
			}else{
				//查询该用户是否参加过该活动
				UserInfoExtendVO userInfoExtendVO = lstUserVO.get(0);
				if(userInfoExtendVO.getIsOwnResource()==PeiZiConstants.IS_OWN_RESOURCE){
					return PeiZiConstants.RESULT_VALID;
				}else{
					return PeiZiConstants.RESULT_ALREADY_USED;
				}
			}
			//参加活动结果合格
			return PeiZiConstants.RESULT_VALID;
		}else{
			FreePeiziDetailVO vo = lstPZVO.get(0);
			if(vo.getPeiziCount()<PeiZiConstants.FREE_ALL_COUNT){
				//查询用户扩展表信息，是否有记录
				if(lstUserVO==null || lstUserVO.size()==0){
					UserInfoExtendVO userInfoExtendVO = new UserInfoExtendVO();
					userInfoExtendVO.setUserId(user.getId());
					userInfoExtendVO.setIsOwnResource(PeiZiConstants.IS_OWN_RESOURCE);
					userInfoExtendVO.setPeiziType(pzIndexCtrlModel.getPeiziType());
					peiZiIndexMapper.insertUserInfoExtendVO(userInfoExtendVO);
					
					//更新计数
					vo.setPeiziCount(vo.getPeiziCount()+1);
					peiZiIndexMapper.updateFreePeiziDetailVO(vo);
					
					return PeiZiConstants.RESULT_VALID;
				}else{
					//查看是否拥有资源
					UserInfoExtendVO userVO = lstUserVO.get(0);
					if(userVO.getIsOwnResource()==PeiZiConstants.IS_OWN_RESOURCE){
						return PeiZiConstants.RESULT_VALID;
					}else{
						return PeiZiConstants.RESULT_ALREADY_USED;
					}
				}
			}else{
				return PeiZiConstants.RESULT_NO_AMOUNT;
			}
		}
	}

	@Override
	public List<FreePeiziDetailVO> getFreePeiziDetailList(
			PZIndexCtrlModel pzIndexCtrlModel) {
		List<FreePeiziDetailVO> lstVO = peiZiIndexMapper.getFreePeiziDetailList(pzIndexCtrlModel);
		
		return lstVO;
	}

	@Override
	public List<UserInfoExtendVO> getUserInfoExtendList(
			PZIndexCtrlModel pzIndexCtrlModel) {
		return peiZiIndexMapper.getUserInfoExtendList(pzIndexCtrlModel);
	}

	@Override
	public Peizi createFreeAllPeiziOrder(UserInfoExtendVO userInfoExtendVO, String peiziType) {
		//免息配规则
		PeiziRuleCtrlModel peiziRuleCtrlModel = new PeiziRuleCtrlModel();
		peiziRuleCtrlModel.getPeiziRule().setRuleType(PeiziTypeEnum.MFPEIZI.getKey());
		List<PeiziRule> lstPeiziRule = iPeiziRule.selectPeiziRule(peiziRuleCtrlModel);
		if(lstPeiziRule==null||lstPeiziRule.size()==0){
			throw new  RuntimeException("免息配资规则没有找到");
		}
		
		peiZiIndexMapper.updateUserInfoExtendVO(userInfoExtendVO);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(userInfoExtendVO.getUserId());
		Date date = Calendar.getInstance().getTime();
		//插入配资订单
		Peizi peizi = new Peizi();
		peizi.setDataZcpzj(new BigDecimal(10001));
		peizi.setDataTzbzj(new BigDecimal(1));
		peizi.setDataPzje(new BigDecimal(10000));
		
		peizi.setDataJjx(BigDecimalUtils.multiply(new BigDecimal(7500), lstPeiziRule.get(0).getRuleJjx3()).divide(new BigDecimal(100)));
		peizi.setDataRuleJjx(lstPeiziRule.get(0).getRuleJjx3());
		peizi.setDataPcx(BigDecimalUtils.multiply(new BigDecimal(7500), lstPeiziRule.get(0).getRulePcx3()).divide(new BigDecimal(100)));
		peizi.setDataRulePcx(lstPeiziRule.get(0).getRulePcx3());
		
		peizi.setDataType(peiziType);
		peizi.setDataTypeSylx("10");
		peizi.setDataZjsyqx(2);
		peizi.setDataSubmitDate(date);
		peizi.setDataJyksDate("2");
		peizi.setDataCreateDate(date);
		peizi.setDataUserId(userInfoExtendVO.getUserId());
		peizi.setDataUserName(userInfo==null?"":userInfo.getName());
		peizi.setDataUserTel(userInfoExtendVO.getPhone());
		peizi.setDataOperaStatus(OperaStatusEnum.PZPay.getKey());
		peiziService.insertPeizi(peizi);
		return peizi;
	}
	
	@Override
	public Long createFreeChargePeiziOrder(UserInfoExtendVO userInfoExtendVO, Peizi peizi) {
		peiZiIndexMapper.updateUserInfoExtendVO(userInfoExtendVO);
		Date date = Calendar.getInstance().getTime();
		peizi.setDataSubmitDate(date);
		if (peizi.getDataId() == null) {
			//设置用户信息
			peiziService.insertPeizi(peizi);
		} else {
			peiziService.updatePeizi(peizi);
		}
		
		return peizi.getDataId();
		
	}
	

}
