package com.tjs.admin.order.service;

import java.util.List;

import com.tjs.admin.order.controller.OrderCtrlModel;
import com.tjs.admin.order.model.Order;

/**
 * 预约服务接口类
 * @author Administrator
 *
 */
public interface IOrderService {
	
	/**查询预约订单数*/
    public int countOrder(OrderCtrlModel orderCtrlModel);
	/**插入订单*/
	public int  insertOrder(Order order);
	/**更新订单*/
	public int updateOrder(Order order);
	/**删除订单*/
	public void deleteOrder(Long orderId);
	/**批量删除订单*/
	public void deleteBatchOrder(Long[] orderIds);
	/**批量更新订单状态*/
	public void updateBatchOrderStatus(Long[] orderIds);
	/**获取订单*/
	public Order findByOrderId(Long orderId);
	/**根据条件查询订单*/
	public List<Order> selectOrder(OrderCtrlModel orderCtrlModel );

}
