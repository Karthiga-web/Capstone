package com.hcl.service;

import java.util.List;
import java.util.Optional;

import com.hcl.entity.Order;

public interface OrderService {

	Optional<Order> findOrderById(long orderId);

	void deleteOrder(Order newProductEntity);

	List<Order> getAllOrders(Long long1);

	void clearCart(Long userId);

}
