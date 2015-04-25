package com.tjs.admin.order.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.order.controller.OrderCtrlModel;
import com.tjs.admin.order.dao.OrderMapper;
import com.tjs.admin.order.model.Order;
import com.tjs.admin.order.service.IOrderService;

/**
 * 预约服务实现类
 * @author Administrator
 *
 */
@Service
public class OrderService implements IOrderService {

	
	@Resource
    private OrderMapper orderMapper;
	
	@Override
	public int countOrder(OrderCtrlModel orderCtrlModel) {
		return orderMapper.countOrder(orderCtrlModel);
	}

	@Override
	public int insertOrder(Order order) {
		return orderMapper.insertOrder(order);
	}

	@Override
	public int updateOrder(Order order) {
		// TODO Auto-generated method stub
		return orderMapper.updateOrder(order);
	}

	@Override
	public void deleteOrder(Long orderId) {
		orderMapper.deleteOrder(orderId);
	}

	@Override
	public void deleteBatchOrder(Long[] orderIds) {
		orderMapper.deleteBatchOrder(orderIds);
	}

	@Override
	public void updateBatchOrderStatus(Long[] orderIds) {
		// TODO Auto-generated method stub
		orderMapper.updateBatchOrderStatus(orderIds);
		
	}

	@Override
	public Order findByOrderId(Long orderId) {
		return orderMapper.findByOrderId(orderId);
	}

	@Override
	public List<Order> selectOrder(OrderCtrlModel orderCtrlModel) {
		return orderMapper.selectOrder(orderCtrlModel);
	}

}
