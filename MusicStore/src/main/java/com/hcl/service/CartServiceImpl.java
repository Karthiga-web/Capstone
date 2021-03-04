package com.hcl.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.entity.Order;
import com.hcl.repository.OrderRepository;
import com.hcl.repository.ProductRepository;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	ProductRepository productRepository;
	@Autowired
	OrderRepository orderRepository;
	Logger logger = LoggerFactory.getLogger(CartServiceImpl.class);

	@Override
	public List<Order> cartMethod(Long userCartId) {
		List<Order> orders = orderRepository.findAll();
		List<Order> userOrders = new ArrayList<>();
		orders.stream().forEach(order->{
			if(order.getUserId() == userCartId && order.getStatus().equalsIgnoreCase("Cart")) {
				userOrders.add(order);
			}
		});
		return userOrders;
	}

}
