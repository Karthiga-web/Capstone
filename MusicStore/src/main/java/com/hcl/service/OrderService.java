package com.hcl.service;

import java.util.List;
import java.util.Optional;

import com.hcl.entity.Order;
import com.hcl.entity.Product;

public interface OrderService {

	Optional<Order> findOrderById(long orderId);

	void deleteOrder(Order newProductEntity);

	List<Order> getAllOrders(Long long1);

	void changeStatus(Long userId);

	void clearCart(Long userId);

	void deleteOrderById(Long id);

	void saveOrder(Order order);

}
