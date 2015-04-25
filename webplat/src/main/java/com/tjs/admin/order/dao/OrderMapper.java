package com.tjs.admin.order.dao;

import java.util.List;

import com.tjs.admin.order.controller.OrderCtrlModel;
import com.tjs.admin.order.model.Order;

/**
 * 数据库操作接口类
 * @author Administrator
 *
 */
public interface OrderMapper  {
  	
	public int countOrder(OrderCtrlModel orderCtrlModel);
	
	public int  insertOrder(Order order);
	
	public int updateOrder(Order order);
	
	public void deleteOrder(Long orderId);
	
	public void deleteBatchOrder(Long[] orderIds);
	
	public void updateBatchOrderStatus(Long[] orderIds);
	
	public Order findByOrderId(Long orderId);
	
	public List<Order> selectOrder(OrderCtrlModel orderCtrlModel );
		
}


