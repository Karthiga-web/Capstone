package com.hcl.service;

import java.util.List;

import com.hcl.entity.Order;

public interface CartService {

	List<Order> cartMethod(Long userCartId);

}
