package com.hcl.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.hcl.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.entity.Order;
import com.hcl.repository.OrderRepository;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderRepository repo;

	@Override
	public Optional<Order> findOrderById(long id) {
		return repo.findById(id);
	}

	@Override
	public void deleteOrder(Order newProductEntity) {
		repo.delete(newProductEntity);
	}

	@Override
	public List<Order> getAllOrders(Long long1) {
		List<Order> list1 = repo.findAll();
		List<Order> list2 = new ArrayList<>();;
		list1.stream().forEach(a->{
			if(a.getUserId() == long1 && a.getStatus().equalsIgnoreCase("Cart")) {
				list2.add(a);
			}
		});
		return list2;
	}

	@Override
	public void changeStatus(Long userId) {
		List<Order> list1 = repo.findAll();
		list1.stream().forEach(a->{
			if(a.getStatus().equalsIgnoreCase("Cart")) {
				a.setStatus("Ordered");
			}
			if(a.getUserId() == userId) {
				repo.save(a);
			}
		});
	}

	@Override
	public void clearCart(Long userId) {
		List<Order> list1 = repo.findAll();
		list1.stream().forEach(a->{
			if(a.getUserId() == userId && a.getStatus().equalsIgnoreCase("Cart")) {
				repo.deleteById(a.getId());
			}
		});
	}

	@Override
	public void saveOrder(Order order){
		this.repo.save(order);
	}

	@Override
	public void deleteOrderById(Long id) {
		repo.deleteById(id);
	}

}
